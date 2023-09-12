import UIKit

class PlayerView: UIView {
    
    // MARK: - Public Properties
    
    var isActive = false {
        didSet {
            if isActive {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn) {
                    self.backgroundColor = .systemOrange.withAlphaComponent(0.5)
                }
            } else {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                    self.backgroundColor = UIColor.systemBackground
                }
            }
        }
    }
    
    // MARK: - Private Properties
    
    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.systemFont(ofSize: 34)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.borderWidth = 3
        layer.cornerRadius = layer.bounds.width / 2
    }
    
    // MARK: - Private Methods
    
    func configureSubviews() {
        addSubview(playerNameLabel)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor),
            playerNameLabel.topAnchor.constraint(equalTo: topAnchor),
            playerNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            playerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setPlayerName(_ name: String) {
        playerNameLabel.text = name
    }
    
}
