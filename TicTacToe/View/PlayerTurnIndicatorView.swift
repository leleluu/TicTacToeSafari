import UIKit

class PlayerTurnIndicatorView: UIView {
        
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
        view.isActive = true 
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playerTwoView: PlayerView = {
        let view = PlayerView(frame: .zero)
        view.isActive = false
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
    
    func toggleActivePlayer() {
        playerOneView.isActive.toggle()
        playerTwoView.isActive.toggle()
    }
}
