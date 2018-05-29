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
        
        for rental in rentals {

            // add frequent renter points
            frequentRenterPoints += 1
            // add bonus for a two day new release rental
            if (rental.movie.priceCode == .newRelease && rental.daysRented > 1) {
                frequentRenterPoints += 1
            }
            // show figures for this rental
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
            totalAmount += rental.getCharge()
        }
        
        // add footer lines
        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRenterPoints) frequent renter points\n"
        
        return result
    }
}
