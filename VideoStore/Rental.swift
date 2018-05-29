import Foundation

public class Rental {
    
    public private(set) var movie:Movie
    public var daysRented:Int
    
    public init(movie:Movie, daysRented:Int) {
        self.movie = movie
        self.daysRented = daysRented
    }

    public func getCharge() -> Double {

        var thisAmount:Double = 0

        switch (movie.priceCode) {
        case .regular:
            thisAmount += 2
            if (daysRented > 2) {
                thisAmount += Double(daysRented - 2) * 1.5
            }

        case .newRelease:
            thisAmount += Double(daysRented) * 3

        case .childrens:
            thisAmount += 1.5
            if (daysRented > 3) {
                thisAmount += Double(daysRented - 3) * 1.5
            }
        }

        return thisAmount
    }

    public func getFrequentRenterPoints() -> Int {
        if (movie.priceCode == .newRelease && daysRented > 1) {
            return 2
        }
        return 1
    }
}
