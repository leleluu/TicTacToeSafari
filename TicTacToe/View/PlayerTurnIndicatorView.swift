import UIKit

class PlayerTurnIndicatorView: UIView {
    
    // MARK: - Public Properties
    
    var activePlayerIndex: Int? {
        didSet {
            switch activePlayerIndex {
            case 0:
                playerOneView.isActive = true
                playerTwoView.isActive = false
            case 1:
                playerTwoView.isActive = true
                playerOneView.isActive = false
            default:
                break
            }
        }
    }
        
    // MARK: - Private Properties
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            playerOneView,
            versusLabel,
            playerTwoView
        ])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 35, leading: 35, bottom: 35, trailing: 35)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var playerOneView: PlayerView = {
        let view = PlayerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playerTwoView: PlayerView = {
        let view = PlayerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var versusLabel: UILabel = {
        let label = UILabel()
        label.text = "vs"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    func configureSubviews() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Public Methods
    
    func setPlayerNames(playerOneName: String, playerTwoName: String) {
        playerOneView.setPlayerName(playerOneName)
        playerTwoView.setPlayerName(playerTwoName)
    }

}
