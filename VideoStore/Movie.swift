import Foundation

public class Movie {

    public private(set) var title:String

    private var price: Price = RegularPrice()
    public var priceCode:PriceCode {
        get { return price.priceCode }
        set { price = newValue.makePrice() }
    }

    init(title:String, priceCode:PriceCode) {
        self.title = title
        self.priceCode = priceCode
    }

    public func getCharge(for daysRented:Int) -> Double {
        return price.getCharge(for:daysRented)
    }
}
