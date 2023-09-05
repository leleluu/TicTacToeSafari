import Foundation

class GameViewModel {
    
    // MARK: - Private Properties
    
    private var numberOfMovesLeft = 9
    
    // MARK: - Public Properties
    
    var playerOneName = Player.one.name
    var playerTwoName = Player.two.name
    
    var numberOfMovesLeftText: String {
        "\(numberOfMovesLeft) number of moves left"
    }
    var activePlayer: Player = .one
    var onStateChange: (() -> ())?
    
    // MARK: - Public Methods
    
    func moveTaken() {
        numberOfMovesLeft -= 1
        toggleActivePlayer()
        onStateChange?() 
    }
    
    private func toggleActivePlayer() {
        if activePlayer == .one {
            activePlayer = .two
        } else {
            activePlayer = .one
        }
    }
    
}

extension GameViewModel {
    enum Player {
        case one
        case two
    
        var name: String {
            switch self {
            case .one:
                return "🐶"
            case .two:
                return "🐱"
            }
        }
    }
}
