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
        backgroundColor = .systemBackground
        configureGrid()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let offset = rect.width / 6
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: gridContainerView.frame.midX - offset, y: gridContainerView.frame.minY))
        path.addLine(to: CGPoint(x: gridContainerView.frame.midX - offset, y: gridContainerView.frame.maxY))
        
        path.move(to: CGPoint(x: gridContainerView.frame.midX + offset, y: gridContainerView.frame.minY))
        path.addLine(to: CGPoint(x: gridContainerView.frame.midX + offset, y: gridContainerView.frame.maxY))
        
        path.move(to: CGPoint(x: gridContainerView.frame.minX, y: gridContainerView.frame.midY - offset))
        path.addLine(to: CGPoint(x: gridContainerView.frame.maxX, y: gridContainerView.frame.midY - offset))
        
        path.move(to: CGPoint(x: gridContainerView.frame.minX, y: gridContainerView.frame.midY + offset))
        path.addLine(to: CGPoint(x: gridContainerView.frame.maxX, y: gridContainerView.frame.midY + offset))

        UIColor.black.setStroke()
        path.lineWidth = 3.0
        
        path.stroke()
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
            gridContainerView.heightAnchor.constraint(equalTo: gridContainerView.widthAnchor),
            gridContainerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func placeMarking(row: Int, column: Int, marking: String) {
        let validRange = 0...2
        guard validRange.contains(row) && validRange.contains(column) else { return }
        let button = gridContainerView.subviews[row].subviews[column] as? UIButton
        button?.setTitle(marking, for: .normal)
    }
}
