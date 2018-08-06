/**
 The two major functions of the Blockchain is to create genesis blocks and also add other blocks to the chain to form a block chain. This Class replicates that same behaviour.
 
**/

import UIKit

class Blockchain {
    
    // create a chain comprising of Blocks.
    var chain = [Block]()
    
    // this function creates a genesis block in the blockchain
    func createGenesisBlock(data: String) {
        
        let genesisBlock = Block()
        
        //generate the beginning hash
        genesisBlock.hash = genesisBlock.generateHash()
        
        //store data in the block
        genesisBlock.data = data
        
        //set the previous hash to zero
        genesisBlock.previousHash = "0000"
        
        // and set the genesis Block to be the index
        genesisBlock.index = 0
        
        //append the genesis block to the chain
        chain.append(genesisBlock)
        
    }
    
    // this function creates a new block
    func createBlock(data: String) {
        
        //create a new instance of the Block class
        let newBlock = Block()
        
        // and generate a hash for it
        newBlock.hash = newBlock.generateHash()
        
        // put some data to it
        newBlock.data = data
        
        // get the previous Hash and add it to this block
        newBlock.previousHash = chain[chain.count - 1].hash
        
        // begin counting from the index
        newBlock.index = chain.count
        
        // then append to the chain, hoorrayyy!!
        chain.append(newBlock)
        
    }
    
}
