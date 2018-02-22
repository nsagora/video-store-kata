# Video Store Kata

I propose this exercise as an introduction to the art of __refactoring__.

Along the way you will see how  __code smells__ help us identify problems in the code base and how, by applying __refactorings__, you can improve it's structure to better accommodate new features.

This exercise is an adaptation of [__Martin Fowler__](https://martinfowler.com)'s example on refactoring, from his book, [__Refactoring: Improving the Design of Existing Code__](https://martinfowler.com/books/refactoring.html).

## The set up

This code base represents a submodule of a larger and more complex software application, used by a video store to manage it's business: client management, movie catalogue, movie rentals, etc. 

The module's main responsibility is to calculate a text statement of a customer's charges, containing an overall summary, total charges and frequent renter points.

## The quest

Let's assume that you have recently become the new lead developer of this module and you have to extend it with new features.

The first two tasks that you are accountable of are:

1. Calculate a HTML statement version of the customer's charges (which will be used by a web related module).
2. Make the system ready for a couple of future changes in the way the movies are classified:
- Possible changes in the way the renters are charged
- Possible changes in the way the frequent renter points are calculated

Before you start refactoring your way out of these tasks, you run the tests and a smile appears on the corners of your lips: the source code is 100% covered with unit tests.

Good luck in your quest!
