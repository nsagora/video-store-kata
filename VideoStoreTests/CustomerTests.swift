import XCTest
@testable import VideoStore

class CustomerTests: XCTestCase {

    private var customer: Customer!
    private var newRelease1: Movie!
    private var newRelease2: Movie!
    private var childrens1: Movie!
    private var childrens2: Movie!
    private var regular1: Movie!
    private var regular2: Movie!
    private var regular3: Movie!

    public override func setUp() {
        super.setUp()
        customer = Customer(name: "Customer Name")
        newRelease1 = Movie(title: "New Release 1", priceCode: .newRelease)
        newRelease2 = Movie(title: "New Release 2", priceCode: .newRelease)
        childrens1 = Movie(title: "Childrens 1", priceCode: .childern)
        childrens2 = Movie(title: "Childrens 2", priceCode: .childern)
        regular1 = Movie(title: "Regular 1", priceCode: .regular)
        regular2 = Movie(title: "Regular 2", priceCode: .regular)
        regular3 = Movie(title: "Regular 3", priceCode: .regular)
    }

    public func testSingleNewReleaseStatement() {
        customer.add(rental: Rental(movie: newRelease1, daysRented: 3))

        XCTAssertEqual(
            "Rental Record for Customer Name\n" +
                "\tNew Release 1\t9.0\n" +
                "Amount owed is 9.0\n" +
            "You earned 2 frequent renter points\n",
            customer.statement()
        )
    }

    public func testMultipleNewReleaseStatement() {
        customer.add(rental: Rental(movie: newRelease1, daysRented: 1))
        customer.add(rental: Rental(movie: newRelease2, daysRented: 3))

        XCTAssertEqual(
            "Rental Record for Customer Name\n" +
                "\tNew Release 1\t3.0\n" +
                "\tNew Release 2\t9.0\n" +
                "Amount owed is 12.0\n" +
            "You earned 3 frequent renter points\n",
            customer.statement()
        )
    }

    public func testSingleChildrensStatement() {
        customer.add(rental: Rental(movie: childrens1, daysRented: 3))

        XCTAssertEqual(
            "Rental Record for Customer Name\n" +
                "\tChildrens 1\t1.5\n" +
                "Amount owed is 1.5\n" +
            "You earned 1 frequent renter points\n",
            customer.statement()
        )
    }

    public func testMultipleChildrensStatement() {
        customer.add(rental: Rental(movie: childrens1, daysRented: 3))
        customer.add(rental: Rental(movie: childrens2, daysRented: 4))

        XCTAssertEqual(
            "Rental Record for Customer Name\n" +
                "\tChildrens 1\t1.5\n" +
                "\tChildrens 2\t3.0\n" +
                "Amount owed is 4.5\n" +
            "You earned 2 frequent renter points\n",
            customer.statement()
        )
    }

    public func testMultipleRegularStatement() {
        customer.add(rental: Rental(movie: regular1, daysRented: 1))
        customer.add(rental: Rental(movie: regular2, daysRented: 2))
        customer.add(rental: Rental(movie: regular3, daysRented: 3))

        XCTAssertEqual(
            "Rental Record for Customer Name\n" +
                "\tRegular 1\t2.0\n" +
                "\tRegular 2\t2.0\n" +
                "\tRegular 3\t3.5\n" +
                "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points\n",
            customer.statement()
        )
    }
}
