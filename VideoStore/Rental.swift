import Foundation

public class Rental {
    
    public private(set) var movie:Movie
    public var daysRented:Int
    
    public init(movie:Movie, daysRented:Int) {
        self.movie = movie
        self.daysRented = daysRented
    }

    public func getCharge() -> Double {
        var result:Double = 0

        switch (movie.priceCode) {
        case .regular:
            result += 2
            if (daysRented > 2) {
                result += Double(daysRented - 2) * 1.5
            }

        case .newRelease:
            result += Double(daysRented) * 3

        case .childern:
            result += 1.5
            if (daysRented > 3) {
                result += Double(daysRented - 3) * 1.5
            }
        }

        return result
    }
}
