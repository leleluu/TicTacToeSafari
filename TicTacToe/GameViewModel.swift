import Foundation

class GameViewModel {
    
    // MARK: - Private Properties
    private var numberOfMovesLeft = 9
    // MARK: - Public Properties
    
    lazy var numberOfMovesLeftText = "\(numberOfMovesLeft) number of moves left"
    var onStateChange: (() -> ())?
    
    // MARK: - Public Methods
    
    func moveTaken() {
        numberOfMovesLeft -= 1
        onStateChange?()
    }
    
}
