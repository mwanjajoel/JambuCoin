
import UIKit

class Block {
    // Properties of the Block Class
    
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
    // this function generates a hash comprised of alphanumeric characters.
    func generateHash() -> String {
        
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
}
