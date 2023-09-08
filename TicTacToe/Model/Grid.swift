import Foundation

struct Grid {
    
    // MARK: - Private Properties
    
    let rows: Int
    let columns: Int
    private var grid: [[String?]] = []

    // MARK: - Initialisation
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        for row in 0...rows - 1 {
            grid.append([])
            for _ in 0...columns - 1 {
                grid[row].append(nil)
            }
        }
        
    }
    
    // MARK: - Public Methods
    
    mutating func set(_ string: String, row: Int, column: Int) {
        grid[row][column] = string
    }

    func get(row: Int, column: Int) -> String? {
        let string = grid[row][column]
        return string 
    }
}
