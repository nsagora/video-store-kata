import Foundation

public class Rental {
    
    public private(set) var movie:Movie
    public var daysRented:Int
    
    public init(movie:Movie, daysRented:Int) {
        self.movie = movie
        self.daysRented = daysRented
    }

    public func getCharge() -> Double {
        return movie.getCharge(for: daysRented)
    }

    public func getFrequentRenterPoints() -> Int {
        if (movie.priceCode == .newRelease && daysRented > 1) {
            return 2
        }
        return 1
    }
}
