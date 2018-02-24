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

        var result:String = "Rental Record for \(name)\n"
        for item in rentals {
            result += "\t\(item.movie.title)\t\(item.getCharge())\n"
        }
        
        // add footer lines
        result += "Amount owed is \(getTotalCharge())\n"
        result += "You earned \(getTotalFrequentRenterPoints()) frequent renter points\n"
        
        return result
    }

    private func getTotalCharge() -> Double {
        var result:Double = 0
        for rental in rentals {
            result += rental.getCharge()
        }
        return result;
    }

    private func getTotalFrequentRenterPoints() -> Int {
        var result:Int = 0
        for rental in rentals {
            result += rental.getFrequentRenterPoints()
        }
        return result;
    }
}
