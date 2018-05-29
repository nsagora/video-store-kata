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
        for rental in rentals {
            // show figures for this rental
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
        }
        
        // add footer lines
        result += "Amount owed is \(getTotalAmount())\n"
        result += "You earned \(getFrequentRenterPoints()) frequent renter points\n"
        
        return result
    }

    public func statementHTML() -> String {

        var result:String = "<h1>Rental Record for \(name)</h1>\n"
        result += "<ul>"
        for rental in rentals {
            // show figures for this rental
            result += "<li>\(rental.movie.title)\t\(rental.getCharge())</li>"
        }
        result += "</ul>"

        // add footer lines
        result += "<p>Amount owed is \(getTotalAmount())</p>"
        result += "<p>You earned \(getFrequentRenterPoints()) frequent renter points</p>"

        return result
    }

    private func getTotalAmount() -> Double {
        return rentals.reduce(0) { $0 + $1.getCharge()}
    }

    private func getFrequentRenterPoints() -> Int {
        return rentals.reduce(0) { $0 + $1.getFrequentRenterPoints()}
    }
}
