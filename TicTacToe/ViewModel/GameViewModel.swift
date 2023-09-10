import Foundation

class GameViewModel {
    
    typealias Marker = (playerName: String?, row: Int, column: Int)
    
    // MARK: - Private Properties
    
    private var model = GameModel(
        playerOne: Player(name: "🐻", isActive: true),
        playerTwo: Player(name: "🐼", isActive: false)
    )
    
    private var numberOfMovesLeft = 9
    private var grid = Grid(rows: 3, columns: 3)

    
    // MARK: - Public Properties
    
        
    var winner: String?
    
    var markers: [Marker] {
        var markers: [Marker] = []
        for row in 0...grid.rows - 1 {
            for column in 0...grid.columns - 1 {
                
                let name = grid.get(row: row, column: column)
                let marker = (
                    playerName: name,
                    row: row,
                    column: column
                )
                markers.append(marker)
            }
        }
        return markers
    }

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

    // MARK: - Private Methods
    
    private func checkForWinner() {
        checkRows()
        checkColumns()
        checkDiagonal()

    }
    
    private func checkDiagonal() {
        // check middle tile is filled
        guard let playerName = grid.get(row: 1, column: 1) else { return }
        
        // check top left to bottom right
        if grid.get(row: 0, column: 0) == playerName
            && grid.get(row: 2, column: 2) == playerName {
            winner = playerName
        }
        
        // check bottom left to top right
        if grid.get(row: 0, column: 2) == playerName
            && grid.get(row: 2, column: 0) == playerName {
            winner = playerName
        }
    }

    private func check(row: Int) {
        // first tile is filled
        guard let playerName = grid.get(row: row, column: 0) else { return }
        
        if grid.get(row: row, column: 1) == playerName
        && grid.get(row: row, column: 2) == playerName {
            winner = playerName
        }
    }

    private func checkRows() {
        for row in 0...grid.rows - 1 {
            check(row: row)
        }
    }

    private func check(column: Int) {
        guard let playerName = grid.get(row: 0, column: column) else { return }

        if grid.get(row: 1, column: column) == playerName
        && grid.get(row: 2, column: column) == playerName {
            winner = playerName
        }
    }
    
    private func checkColumns() {
        for column in 0...grid.columns - 1 {
            check(column: column)
        }
    }

    // MARK: - Public Methods
    
    func takeTurn(row: Int, column: Int) {
        grid.set(model.playerOne.isActive ? playerOneName : playerTwoName, row: row, column: column)
        
        checkForWinner()
        numberOfMovesLeft -= 1
        model.toggleActivePlayer()
        onStateChange?()
    }
    
    func didTapRematch() {
        // reset state
        grid = Grid(rows: 3, columns: 3)
        numberOfMovesLeft = 9
        
        // TODO: Pick random emojis
        model = GameModel(
            playerOne: Player(name: "🐳", isActive: true),
            playerTwo: Player(name: "🦆", isActive: false)
        )
        winner = nil
        onStateChange?()
        
    }
}
