import UIKit

class GameGrid: UIView {
    
    // MARK: - Private Properties
    
    private lazy var gridContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGrid()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureGrid() {
        for row in 0...2 {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            
            for column in 0...2 {
                let button = UIButton(type: .system, primaryAction: UIAction(title: "button", handler: { _ in
                    print("row: \(row)")
                    print("column: \(column)")
                }))
                rowStackView.addArrangedSubview(button)
            }
            gridContainerView.addArrangedSubview(rowStackView)
        }
    }
    
    private func configureSubviews() {
        addSubview(gridContainerView)
        
        NSLayoutConstraint.activate([
            gridContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gridContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gridContainerView.topAnchor.constraint(equalTo: topAnchor),
            gridContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
