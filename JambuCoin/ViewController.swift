import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueAmount: UITextField!
    @IBOutlet weak var redAmount: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    // jambucoin accounts we shall be using to transact
    let firstAccount = 1000
    let secondAccount = 0200
    
    // unleash our blockchain
    let jambuCoinChain = Blockchain()
    
    // reward given out when mining takes place
    let reward = 100
    
    // master account from where the JambuCoins come from, only has 999000000 Jambucoins
    var accounts: [String: Int] = ["0000": 999000000]
    
    // this is an alert that shall be seen when a transaction is more than 999000000 Jambucoins
    let invalidTransactionAlert = UIAlertController(title: "Dang! Invalid Transaction", message: "Please check the details of your transaction, change them and try again", preferredStyle: .alert)
    
    // MARK: - This is the transaction function that enables transfer of money from sender to receiver
    
    func transaction(from: String, to: String, amount: Int, type: String) {
        
        //check if sending account is nil
        if accounts[from] == nil {
            
            //alert the user
            self.present(invalidTransactionAlert, animated: true, completion: nil)
            
            return
        //check to see if sending amount is less than zero
        } else if accounts[from]! - amount < 0 {
            
            // alert the user, again
            self.present(invalidTransactionAlert, animated: true, completion: nil)
            
            return
          
            // otherwise do the needful
        } else {
            
            // update the value of the receiving account
            accounts.updateValue(accounts[from]! - amount, forKey: from)
        }
        
        // check to see if its a genesis block
        if type == "genesis" {
            
            //create a genesis block
            jambuCoinChain.createGenesisBlock(data: "From: \(from); To: \(to); Amount: \(amount)JBC")
            
            // otherwise if its normal
        } else if type == "normal"  {
            
            // create the next block
            jambuCoinChain.createBlock(data: "From:\(from); To: \(to); Amount: \(amount) JBC" )
            
            
        }
        
    }
    
    // MARK: - This function prints the list of transactions
    func chainState() {
        
        // loop through from the first transaction
        for i in 0...jambuCoinChain.chain.count - 1 {
            
            print("\tBlock: \(jambuCoinChain.chain[i].index!) \n\tHash: \(jambuCoinChain.chain[i].hash!)\n\tPreviousHash: \(jambuCoinChain.chain[i].previousHash!) \n\tData: \(jambuCoinChain.chain[i].data!)")
        }
        
        //update the balances on the UI
        redLabel.text = "Balance: \(accounts[String(describing: firstAccount)]!) JBC"
        blueLabel.text = "Balance: \(accounts[String(describing: secondAccount)]!) JBC"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redMine(_ sender: Any) {
        
    }
    
    @IBAction func blueMine(_ sender: Any) {
        
    }
    
    @IBAction func redSend(_ sender: Any) {
        
    }
    
    @IBAction func blueSend(_ sender: Any) {
        
    }
    
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
