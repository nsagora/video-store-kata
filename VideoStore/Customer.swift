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
            
            let thisAmount = amount(forRental: item)
            
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

    private func amount(forRental rental:Rental) -> Double {
        var result:Double = 0

        switch (rental.movie.priceCode) {
        case .regular:
            result += 2
            if (rental.daysRented > 2) {
                result += Double(rental.daysRented - 2) * 1.5
            }

        case .newRelease:
            result += Double(rental.daysRented) * 3

        case .childern:
            result += 1.5
            if (rental.daysRented > 3) {
                result += Double(rental.daysRented - 3) * 1.5
            }
        }

        return result
    }
}
