import UIKit

class PlayerView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = layer.bounds.width / 2
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    func configureSubviews() {
        addSubview(playerNameLabel)
        
        NSLayoutConstraint.activate([
            playerNameLabel.topAnchor.constraint(equalTo: topAnchor),
            playerNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            playerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            playerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
