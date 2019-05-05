import UIKit

//Check by Boolean
var optionalString: String? = "Hello"
print(optionalString == nil)

//Optional binding/unwrap optional
var optionalName: String?
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting
}

//Handle optional values by providing default value. If the optional value is missing, the default value is used instead.
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

//Switch in Swift, support any kind of data and a wide variety of comparison operations. 'default' label in a 'switch' should have at least one executable statement. There is no need to explicitly break out of the switch at the end of each case’s code.
let vegetable = "pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

//Iteration with for-each loop
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var type: String?
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            type = kind
        }
    }
}

if let kindOfNumbers = type {
    print("\(kindOfNumbers) : \(largest)")
}

//While loop
var n = 2
while n < 100 {
    n *= 2
}
print(n)//128

//While-repeat
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

//Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.
var total = 0
for i in 0..<4 {
    total += i
}
print(total)// Prints "6"


//By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


//Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)// Prints "120"
print(statistics.2)// Prints "120"


//Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


//A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
let numbersAfterMapping = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    if number % 2 == 1 {
        return 0//return zero for all odd numbers
    }
    return result
})
print(numbers)
print(numbersAfterMapping)

//When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)
