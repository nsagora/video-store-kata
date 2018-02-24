import Foundation

public protocol Price {
    var priceCode: PriceCode { get }
    func getCharge(daysRented: Int) -> Double
}

extension Price {

    public func getCharge(daysRented: Int) -> Double {
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
}

public class ChildrenPrice: Price {
    public var priceCode: PriceCode = .childern
}

public class RegularPrice: Price {
    public var priceCode: PriceCode = .regular
}

public class NewReleasePrice: Price {
    public var priceCode: PriceCode = .newRelease
}
