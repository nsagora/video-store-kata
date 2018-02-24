import Foundation

public class Movie {

    public private(set) var title:String
    public var priceCode:PriceCode

    init(title:String, priceCode:PriceCode) {
        self.title = title
        self.priceCode = priceCode
    }

    public func getCharge(daysRented:Int) -> Double {
        var result:Double = 0

        switch (priceCode) {
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

    public func getFrequentRenterPoints(daysRented:Int) -> Int {
        if (priceCode == .newRelease && daysRented > 1) {
            return 2
        }
        return 1
    }
}
