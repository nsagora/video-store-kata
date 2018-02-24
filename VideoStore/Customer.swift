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

            frequentRenterPoints += item.getFrequentRenterPoints()
            // show figures for this rental
            result += "\t\(item.movie.title)\t\(item.getCharge())\n"
            totalAmount += item.getCharge()
        }
        
        // add footer lines
        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRenterPoints) frequent renter points\n"
        
        return result
    }
}
