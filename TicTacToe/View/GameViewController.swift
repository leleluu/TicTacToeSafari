import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel = GameViewModel()
    
    private lazy var playerTurnIndicator: PlayerTurnIndicatorView = {
        let view = PlayerTurnIndicatorView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var gameGrid: GameGridView = {
        let grid = GameGridView()
        grid.translatesAutoresizingMaskIntoConstraints = false
        return grid
    }()
    
    private lazy var gameStatusLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.numberOfSpotsLeftText
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViews()
        viewModel.onStateChange = { [weak self] in
            guard let self else { return }
            self.updateViewStateWithViewModel()
        }
        updateViewStateWithViewModel()
        gameGrid.onTap = { [weak self] row, column in
            self?.viewModel.takeTurn(row: row, column: column) 
        }
    }

    // MARK: - Private Methods
    
    private func configureViews() {
        view.addSubview(playerTurnIndicator)
        view.addSubview(gameGrid)
        view.addSubview(gameStatusLabel)
        
        NSLayoutConstraint.activate([
            // turn indicator label
            playerTurnIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerTurnIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerTurnIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            playerTurnIndicator.bottomAnchor.constraint(equalTo: gameGrid.topAnchor),
            playerTurnIndicator.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            
            // game grid
            gameGrid.leadingAnchor.constraint(equalTo: playerTurnIndicator.leadingAnchor, constant: 16),
            gameGrid.trailingAnchor.constraint(equalTo: playerTurnIndicator.trailingAnchor, constant: -16),
            gameGrid.bottomAnchor.constraint(equalTo: gameStatusLabel.topAnchor),
            gameGrid.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            
            // game status label
            gameStatusLabel.leadingAnchor.constraint(equalTo: playerTurnIndicator.leadingAnchor),
            gameStatusLabel.trailingAnchor.constraint(equalTo: playerTurnIndicator.trailingAnchor),
            gameStatusLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            gameStatusLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func updateViewStateWithViewModel() {
        gameStatusLabel.text = viewModel.numberOfSpotsLeftText
        playerTurnIndicator.setPlayerNames(playerOneName: viewModel.playerOneName, playerTwoName: viewModel.playerTwoName)
        for marker in viewModel.markers {
            if let playerName = marker.playerName {
                gameGrid.setPlayerMarker(playerName, row: marker.row, column: marker.column)
            } else {
                gameGrid.resetPlayerMarker(row: marker.row, column: marker.column)
            }
        }
        playerTurnIndicator.activePlayerIndex = viewModel.activePlayerIndex
        
        if let message = viewModel.gameEndedMessage {
            let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            let rematchAction = UIAlertAction(title: "Rematch", style: .default) { [weak self] action in
                self?.viewModel.didTapRematch()
            }
            alert.addAction(rematchAction)
            present(alert, animated: true)
            
        }
    }
        
}

