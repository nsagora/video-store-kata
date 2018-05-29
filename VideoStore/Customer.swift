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

        var frequentRenterPoints:Int = 0
        var result:String = "Rental Record for \(name)\n"
        
        for rental in rentals {

            frequentRenterPoints += rental.getFrequentRenterPoints()

            // show figures for this rental
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
        }
        
        // add footer lines
        result += "Amount owed is \(getTotalAmount())\n"
        result += "You earned \(frequentRenterPoints) frequent renter points\n"
        
        return result
    }

    private func getTotalAmount() -> Double {
        return rentals.reduce(0) { $0 + $1.getCharge()}
    }
}
