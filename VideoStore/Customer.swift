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

    public func htmlStatement() -> String {

        var result:String = "<h1>Rental Record for <em>\(name)</em></h1>"
        result += "<ul>"
        for item in rentals {
            result += "<li>\(item.movie.title) <em>\(item.getCharge())</em></li>"
        }
        result += "</ul>"

        // add footer lines
        result += "<p>Amount owed is <em>\(getTotalCharge())</em></p>"
        result += "<p>You earned <em>\(getTotalFrequentRenterPoints())</em> frequent renter points</p>"

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
