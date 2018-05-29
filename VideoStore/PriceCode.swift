import Foundation

public enum PriceCode:Int {
    case regular = 0
    case newRelease = 1
    case childrens = 2

    func makePrice() -> Price {
        switch (self){
        case .childrens: return ChildrensPrice()
        case .newRelease: return NewReleasePrice()
        case .regular: return RegularPrice()
        }
    }
}
