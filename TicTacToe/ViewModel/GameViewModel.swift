import Foundation

class GameViewModel {
    
    typealias Move = (playerName: String, position: IndexPath)
    
    // MARK: - Private Properties
    
    private var model = GameModel(
        playerOne: Player(name: "🐻", isActive: true),
        playerTwo: Player(name: "🐼", isActive: false)
    )
    
    private var numberOfMovesLeft = 9
    
    // MARK: - Public Properties
    
    var moves = [Move]()

    var playerOneName: String {
        model.playerOne.name
    }
    var playerTwoName: String {
        model.playerTwo.name
    }
    
    var numberOfMovesLeftText: String {
        "\(numberOfMovesLeft) number of moves left"
    }
    
    var activePlayerIndex: Int {
        if model.playerOne.isActive {
            return 0
        } else {
            return 1
        }
    }
    
    var onStateChange: (() -> ())?
    
    // MARK: - Public Methods
    
    func takeTurn(row: Int, column: Int) {
        let tappedPosition = IndexPath(row: row, section: column)
        
        moves.append((
            playerName: model.playerOne.isActive ? playerOneName : playerTwoName,
            position: tappedPosition
        ))
        numberOfMovesLeft -= 1
        model.toggleActivePlayer()
        onStateChange?() 
    }
       
}
