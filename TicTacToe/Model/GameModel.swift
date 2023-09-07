import Foundation

struct GameModel {
    
    // MARK: - Properties
    
    var playerOne: Player
    var playerTwo: Player
    
    // MARK: - Methods
        
    mutating func toggleActivePlayer() {
        playerOne.isActive.toggle()
        playerTwo.isActive.toggle()
    }

}

struct Player {
    
    // MARK: - Properties

    let name: String
    var isActive: Bool
    

}
