//
//  Price.swift
//  VideoStore
//
//  Created by Alex Cristea on 29/05/2018.
//  Copyright © 2018 NSAgora. All rights reserved.
//

import Foundation

protocol Price {
    var priceCode:PriceCode { get }
    func getCharge(for daysRented:Int) -> Double
}

class RegularPrice: Price {
    var priceCode: PriceCode { return .regular }

    func getCharge(for daysRented: Int) -> Double {
        var thisAmount:Double = 2
        if (daysRented > 2) {
            thisAmount += Double(daysRented - 2) * 1.5
        }
        return thisAmount
    }

}

class NewReleasePrice: Price {
    var priceCode: PriceCode { return .newRelease }

    func getCharge(for daysRented: Int) -> Double {
        return Double(daysRented) * 3
    }
}

class ChildrensPrice: Price {
    var priceCode: PriceCode { return .childrens }
    func getCharge(for daysRented: Int) -> Double {
        var thisAmount:Double = 1.5
        if (daysRented > 3) {
            thisAmount += Double(daysRented - 3) * 1.5
        }
        return thisAmount
    }
}
