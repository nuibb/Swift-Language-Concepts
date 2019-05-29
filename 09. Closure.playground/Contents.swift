import Foundation

//Capturing Values : A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()// returns a value of 10
incrementByTen()// returns a value of 20
incrementByTen()// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()// returns a value of 7

incrementByTen()// returns a value of 40

//If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles.

// functions and closures are reference types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()// returns a value of 50
incrementByTen()// returns a value of 60


//Escaping Closures : A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape. One way that a closure can escape is by being stored in a variable that is defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later. For example:
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
 
//Marking a closure with @escaping means you have to refer to self explicitly within the closure. In contrast, the closure passed as a nonescaping closure, can refer to self implicitly.
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)// Prints "200"

completionHandlers.first?()
print(instance.x)// Prints "100"

//Autoclosures example
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }// return a function
print(customersInLine.count)// Prints "5"

print("Now serving \(customerProvider())!")// Prints "Now serving Chris!"
print(customersInLine.count)// Prints "4"

//You get the same behavior of delayed evaluation when you pass a closure as an argument to a function.
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )// Prints "Now serving Alex!"

//With the @autoclosure attribute, the argument is automatically converted to a closure, no need to explicitly call with {}
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))// Prints "Now serving Ewa!"

//If you want an autoclosure that is allowed to escape, use both the @autoclosure and @escaping attributes. 
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

