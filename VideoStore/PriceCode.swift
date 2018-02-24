import Foundation

public enum PriceCode:Int {
    case regular = 0
    case newRelease = 1
    case childern = 2

    public func MakePrice() -> Price {
        switch self {
        case .childern: return ChildrenPrice()
        case .regular: return RegularPrice()
        case .newRelease: return NewReleasePrice()
        }
    }
}
