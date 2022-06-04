import Foundation

public class Movie {

    public private(set) var title: String
    public var priceCode: PriceCode

    init(title: String, priceCode: PriceCode) {
        self.title = title
        self.priceCode = priceCode
    }
}
