import XCTest
@testable import TicTacToe

// winning condition tests
final class GameViewModelTests: XCTestCase {

    // MARK: - Start game conditions
    
    func testPlayerOneStarts() throws {
        let viewModel = GameViewModel()

        XCTAssertEqual(viewModel.activePlayerIndex, 0, "Player One should be the starting player")
    }
    
    func testPlayersHaveDifferentNamesOnGameStart() {
        let viewModel = GameViewModel()

        XCTAssertNotEqual(viewModel.playerOneName, viewModel.playerTwoName, "Players should have different names")
    }
    
    func testNumberOfSpotsLeftIsEmptyOnGameStart() {
        let viewModel = GameViewModel()

        XCTAssertEqual(viewModel.numberOfSpotsLeftText, "", "Number of spots left text should be empty")
    }
    
    func testGridIsEmptyOnGameStart() {
        let viewModel = GameViewModel()
        
        for marker in viewModel.markers {
            XCTAssertEqual(marker.playerName, nil, "Marker should be empty")
        }
    }

    // MARK: - Game end conditions
    
    func testThreeInARowWins() {
        let viewModel = GameViewModel()
        let expectedMessage = "\(viewModel.playerOneName) won!"

        viewModel.takeTurn(row: 0, column: 0) // player one
        viewModel.takeTurn(row: 1, column: 0)
        viewModel.takeTurn(row: 0, column: 1) // player one
        viewModel.takeTurn(row: 1, column: 1)
        viewModel.takeTurn(row: 0, column: 2) // player one
        
        XCTAssertEqual(viewModel.gameEndedMessage, "\(expectedMessage)", "3 in a row should win")
    }
    
    func testThreeInAColumnWins() {
        let viewModel = GameViewModel()
        let expectedMessage = "\(viewModel.playerOneName) won!"

        viewModel.takeTurn(row: 0, column: 0) // player one
        viewModel.takeTurn(row: 0, column: 1)
        viewModel.takeTurn(row: 1, column: 0) // player one
        viewModel.takeTurn(row: 1, column: 1)
        viewModel.takeTurn(row: 2, column: 0) // player one
        
        XCTAssertEqual(viewModel.gameEndedMessage, (expectedMessage), "3 in a column should win")
    }

    func testThreeDiagonalWins() {
        let viewModel = GameViewModel()
        let expectedMessage = "\(viewModel.playerOneName) won!"

        XCTAssertTrue(viewModel.activePlayerIndex == 0)
        
        viewModel.takeTurn(row: 0, column: 0) // player one
        viewModel.takeTurn(row: 0, column: 1)
        viewModel.takeTurn(row: 1, column: 1) // player one
        viewModel.takeTurn(row: 1, column: 2)
        viewModel.takeTurn(row: 2, column: 2) // player one
        
        XCTAssertEqual(viewModel.gameEndedMessage, expectedMessage, "3 in a diagonal should win")
    }
    
    func testTieGame() {
        let viewModel = GameViewModel()
        let expectedMessage = "It's a tie! 🤝"
        
        viewModel.takeTurn(row: 0, column: 0)
        viewModel.takeTurn(row: 0, column: 1)
        viewModel.takeTurn(row: 0, column: 2)
        viewModel.takeTurn(row: 2, column: 0)
        viewModel.takeTurn(row: 2, column: 1)
        viewModel.takeTurn(row: 2, column: 2)
        viewModel.takeTurn(row: 1, column: 0)
        viewModel.takeTurn(row: 1, column: 1)
        viewModel.takeTurn(row: 1, column: 2)

        XCTAssertEqual(viewModel.gameEndedMessage, expectedMessage, "This should be a tie game")
    }
    
    func testNumberOfSpotsLeftTextIsEmptyOnGameEnd() {
        let viewModel = GameViewModel()
        
        // Trigger a win
        viewModel.takeTurn(row: 0, column: 0)
        viewModel.takeTurn(row: 0, column: 1)
        viewModel.takeTurn(row: 1, column: 0)
        viewModel.takeTurn(row: 1, column: 1)
        viewModel.takeTurn(row: 2, column: 0)
        
        XCTAssertEqual(viewModel.numberOfSpotsLeftText, "")
    }
    
    func testRematchResetsGameCorrectly() {
        let viewModel = GameViewModel()
        
        viewModel.takeTurn(row: 0, column: 1)
        viewModel.didTapRematch()
        
        XCTAssertEqual(viewModel.activePlayerIndex, 0)
        XCTAssertEqual(viewModel.gameEndedMessage, nil)
        XCTAssertEqual(viewModel.numberOfSpotsLeftText, "")
        
        // test grid is reset
        for marker in viewModel.markers {
            XCTAssertEqual(marker.playerName, nil, "Marker should be empty")
        }
    }
    
    // MARK: - Take Turn conditions
    
    func testMarkerIsSetCorrectly() {
        let viewModel = GameViewModel()
        viewModel.takeTurn(row: 1, column: 1)
        
        let marker = viewModel.markers[4]
        XCTAssertEqual(marker.row, 1)
        XCTAssertEqual(marker.column, 1)
        XCTAssertEqual(marker.playerName, viewModel.playerOneName)
    }
        
    func testNumberOfSpotsLeftDecreasesByOneAfterTurnTaken() {
        let viewModel = GameViewModel()
        
        viewModel.takeTurn(row: 0, column: 0)
        XCTAssertEqual(viewModel.numberOfSpotsLeftText, "8 spots left")
        XCTAssertEqual(viewModel.numberOfSpotsLeftText, "7 spots left")
        
    }
    
    func testActivePlayerSwitchesAfterTurnTaken() {
        let viewModel = GameViewModel()
        XCTAssertEqual(viewModel.activePlayerIndex, 0)
        
        viewModel.takeTurn(row: 0, column: 0)
        XCTAssertEqual(viewModel.activePlayerIndex, 1, "Active player should switch after turn taken")
    }

}
