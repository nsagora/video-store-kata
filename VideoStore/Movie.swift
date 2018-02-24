import Foundation

public class Movie {

    public private(set) var title:String

    private var price:Price = RegularPrice()
    public var priceCode:PriceCode {
        get { return price.priceCode }
        set {
            switch newValue {
            case .childern: price = ChildrenPrice()
            case .regular: price = RegularPrice()
            case .newRelease: price = NewReleasePrice()
            }
        }
    }

    init(title:String, priceCode:PriceCode) {
        self.title = title
        self.priceCode = priceCode
    }

    public func getCharge(daysRented:Int) -> Double {
        return price.getCharge(daysRented: daysRented)
    }

    public func getFrequentRenterPoints(daysRented:Int) -> Int {
       return price.getFrequentRenterPoints(daysRented:daysRented)
    }
}
