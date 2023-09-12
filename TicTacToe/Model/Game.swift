import Foundation

struct Game {
    
    // MARK: - Properties
    
    var playerOne: Player
    var playerTwo: Player
    
    // MARK: - Methods
        
    mutating func toggleActivePlayer() {
        playerOne.isActive.toggle()
        playerTwo.isActive.toggle()
    }

}
