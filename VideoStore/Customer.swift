import Foundation

public class Customer {
    
    public var name:String
    private var rentals:Array<Rental> = []
    
    public init(name:String) {
        self.name = name
    }
    
    public func add(rental:Rental) {
        rentals.append(rental)
    }
    
    public func statement() -> String {
        
        var totalAmount:Double = 0
        var frequentRenterPoints:Int = 0
        var result:String = "Rental Record for \(name)\n"
        
        for item in rentals {
            
            var thisAmount:Double = 0
            
            // determine amounts for each line
            switch (item.movie.priceCode) {
            case .regular:
                thisAmount += 2
                if (item.daysRented > 2) {
                    thisAmount += Double(item.daysRented - 2) * 1.5
                }
                
            case .newRelease:
                thisAmount += Double(item.daysRented) * 3
                
            case .childrens:
                thisAmount += 1.5
                if (item.daysRented > 3) {
                    thisAmount += Double(item.daysRented - 3) * 1.5
                }
            }
            
            // add frequent renter points
            frequentRenterPoints += 1
            // add bonus for a two day new release rental
            if (item.movie.priceCode == .newRelease && item.daysRented > 1) {
                frequentRenterPoints += 1
            }
            // show figures for this rental
            result += "\t\(item.movie.title)\t\(thisAmount)\n"
            totalAmount += thisAmount
        }
        
        // add footer lines
        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRenterPoints) frequent renter points\n"
        
        return result
    }
}
