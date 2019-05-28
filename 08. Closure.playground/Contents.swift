import Foundation

//The closure expression can be used to sort an array of String values in reverse alphabetical order. Swift can infer the types of its parameters and the type of the value it returns. 
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)

//Inferring Type From Context
let reversedNames2 = names.sorted(by: { s1, s2 in return s1 > s2 } ) //or
//reversedNames2 = names.sorted(by: { s1, s2 in s1 > s2 } )
print(reversedNames2)

//Using Shorthand Argument Names
let reversedNames3 = names.sorted(by: { $0 > $1 } )
print(reversedNames3)

//Operator Methods : Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:
let reversedNames4 = names.sorted(by: >)
print(reversedNames4)

//Trailing Closures : If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is written after the function call’s parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for the closure as part of the function call.
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

//Another example of trailing closure
let reversedNames5 = names.sorted() { $0 > $1 }

//If a closure expression is provided as the function or method’s only argument and you provide that expression as a trailing closure, you do not need to write a pair of parentheses () after the function or method’s name when you call the function:
let reversedNames6 = names.sorted { $0 > $1 }

//Mapping a number array to corresponding string array of those numbers. Ex - 16 -> onesix, 58 -> fiveeight
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let convertedStrVal = numbers.map { (number1) -> String in
    var str = ""
    var number = number1
     while number != 0 {
         let remainder = number % 10
         str = digitNames[remainder]! + str
         number /= 10
    }   
    return str
}

print(convertedStrVal)

