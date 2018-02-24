import Foundation

public protocol Price {
    var priceCode: PriceCode { get }
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
