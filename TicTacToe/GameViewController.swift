import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var playerTurnIndicator: PlayerTurnIndicatorView = {
        let view = PlayerTurnIndicatorView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var gameGrid: GameGrid = {
        let grid = GameGrid()
        grid.translatesAutoresizingMaskIntoConstraints = false
        return grid
    }()
    
    private lazy var gameStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "X moves left"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViews()
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
            gameGrid.leadingAnchor.constraint(equalTo: playerTurnIndicator.leadingAnchor),
            gameGrid.trailingAnchor.constraint(equalTo: playerTurnIndicator.trailingAnchor),
            gameGrid.bottomAnchor.constraint(equalTo: gameStatusLabel.topAnchor),
            gameGrid.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            
            // game status label
            gameStatusLabel.leadingAnchor.constraint(equalTo: playerTurnIndicator.leadingAnchor),
            gameStatusLabel.trailingAnchor.constraint(equalTo: playerTurnIndicator.trailingAnchor),
            gameStatusLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            gameStatusLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
}

