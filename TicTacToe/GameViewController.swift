import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var turnIndicatorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.text = "Player A vs Player B"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var gameGrid: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIButton(), UIButton()
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemOrange
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var gameStatusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.text = "X moves left"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }

    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(turnIndicatorLabel)
        view.addSubview(gameGrid)
        view.addSubview(gameStatusLabel)
        
        NSLayoutConstraint.activate([
            // turn indicator label
            turnIndicatorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            turnIndicatorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            turnIndicatorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            turnIndicatorLabel.bottomAnchor.constraint(equalTo: gameGrid.topAnchor),
            turnIndicatorLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            
            // game grid
            gameGrid.leadingAnchor.constraint(equalTo: turnIndicatorLabel.leadingAnchor),
            gameGrid.trailingAnchor.constraint(equalTo: turnIndicatorLabel.trailingAnchor),
            gameGrid.bottomAnchor.constraint(equalTo: gameStatusLabel.topAnchor),
            gameGrid.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            
            // game status label
            gameStatusLabel.leadingAnchor.constraint(equalTo: turnIndicatorLabel.leadingAnchor),
            gameStatusLabel.trailingAnchor.constraint(equalTo: turnIndicatorLabel.trailingAnchor),
            gameStatusLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            gameStatusLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }
}

