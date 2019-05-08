import UIKit

/*
 Declaring Constants and Variables :
 Constants and variables must be declared before they’re used. The value of a constant can’t be changed once it’s set, whereas a variable can be set to a different value in the future. You declare constants with the let keyword and variables with the var keyword.
 */
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

//You can declare multiple constants or multiple variables on a single line, separated by commas:
var x = 0.0, y = 0.0, z = 0.0

//Type Annotations : You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name:
var red, green, blue: Double

//Naming Constants and Variables : Constant and variable names can contain almost any character, including Unicode characters :
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
//Constant and variable names can’t contain whitespace characters, mathematical symbols, arrows, private-use Unicode scalar values, or line- and box-drawing characters. Nor can they begin with a number, although numbers may be included elsewhere within the name.

//If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.

//Unlike a variable, the value of a constant can’t be changed after it’s set. Attempting to do so is reported as an error when your code is compiled:
let languageName = "Swift"
//languageName = "Swift++"// This is a compile-time error.

//By default, the print function terminates the line it prints by adding a line break. To print a value without a line break after it, pass an empty string as the terminator -
print(languageName, terminator: "")

//String interpolation :
print("The current value of currentLoginAttempt is \(currentLoginAttempt)")

//Semicolons are required if you want to write multiple separate statements on a single line:
let cat = "🐱"; print(cat)

//Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms. An 8-bit unsigned integer is of type UInt8, and a 32-bit signed integer is of type Int32. Like all types in Swift, these integer types have capitalized names.

//You can access the minimum and maximum values of each integer type with its min and max properties:
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

//Swift provides an additional integer type, Int/UInt, which has the same size as the current platform’s native word size:
//On a 32-bit platform, Int is the same size as Int32.
//On a 64-bit platform, Int is the same size as Int64.

//Double represents a 64-bit floating-point number.
//Float represents a 32-bit floating-point number.
//Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits.

//Type Safety and Type Inference :
let meaningOfLife = 42 // meaningOfLife is inferred to be of type Int

//Swift always chooses Double (rather than Float) when inferring the type of floating-point numbers.
let pi = 3.14159// pi is inferred to be of type Double

//If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context:
let anotherPi = 3 + 0.14159//anotherPi is also inferred to be of type Double

//UInt8 cannot store negative numbers, and so this will report an error
//let cannotBeNegative: UInt8 = -1

// Int8 cannot store a number larger than its maximum value, so this will also report an error
//let tooBig: Int8 = Int8.max + 1

//SomeType(ofInitialValue) is the default way to call the initializer of a Swift type and pass in an initial value. Different type of Numeric type can't be added together, they need to be compatible in same type with type converion
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//Conversions between integer and floating-point numeric types must be made explicit:
let three = 3
let pointOneFourOneFiveNine = 0.14159
let piValue = Double(three) + pointOneFourOneFiveNine// pi equals 3.14159, and is inferred to be of type Double

//Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source:
typealias AudioSample = UInt16

//Once you define a type alias, you can use the alias anywhere you might use the original name:
var maxAmplitudeFound = AudioSample.min// maxAmplitudeFound is now 0

//Swift provides two Boolean constant values, true and false:
let orangesAreOrange = true
let turnipsAreDelicious = false

/*
Swift’s type safety prevents non-Boolean values from being substituted for Bool. The following example reports a compile-time error:
let i = 1
if i {
    // this example will not compile, and will report an error
}
*/
//However, the alternative example below is valid:
let i = 1
if i == 1 {
    // this example will compile successfully
}

//Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.
let http404Error = (404, "Not Found") // http404Error is of type (Int, String), and equals (404, "Not Found")

//You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error

//If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")// Prints "The status code is 404"

//You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")

//If you name the elements in a tuple, you can use the element names to access the values of those elements:
print("The status code is \(http200Status.statusCode)")// Prints "The status code is 200"

//If you name the elements in a tuple, you can use the element names to access the values of those elements:
print("The status code is \(http200Status.statusCode)")// Prints "The status code is 200"

//You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all. The example below uses the initializer to try to convert a String into an Int:
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)// convertedNumber is inferred to be of type "Int?", or "optional Int" means it’s either an Int, or it’s nothing at all.

//You can’t use nil with non-optional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.
var serverResponseCode: Int? = 404// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil// serverResponseCode now contains no value

//If you define an optional variable without providing a default value, the variable is automatically set to nil for you:
var surveyAnswer: String?// surveyAnswer is automatically set to nil

//Swift’s nil isn’t the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.

//Force-unwrap : Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional’s name. Trying to use ! to access a nonexistent optional value triggers a runtime error. Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value.
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//Optional Binding : Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
}

//You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false.
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//Constants and variables created with optional binding in an if statement are available only within the body of the if statement. In contrast, the constants and variables created with a guard statement are available in the lines of code that follow the guard statement.

//Don’t use an implicitly unwrapped optional when there’s a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.

//You write an implicitly unwrapped optional by placing an exclamation mark (String!) rather than a question mark (String?) after the type that you want to make optional.
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

//Assertions and Preconditions : Assertions and preconditions are checks that happen at runtime. You use them to make sure an essential condition is satisfied before executing any further code. If the Boolean condition in the assertion or precondition evaluates to true, code execution continues as usual. If the condition evaluates to false, the current state of the program is invalid; code execution ends, and your app is terminated. Assertions help you find mistakes and incorrect assumptions during development, and preconditions help you detect issues in production.

//Assertions are checked only in debug builds, but preconditions are checked in both debug and production builds. In production builds, the condition inside an assertion isn’t evaluated. This means you can use as many assertions as you want during your development process, without impacting performance in production.

//Debugging with Assertions : You pass assert function as an expression that evaluates to true or false and a message to display if the result of the condition is false. For example:
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")// This assertion fails because -3 is not >= 0.

//You can omit the assertion message—for example.
assert(age >= 0)

//If the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate that an assertion has failed. For example:
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

//Enforcing Preconditions : Use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution.
let index = 0
precondition(index > 0, "Index must be greater than zero.")

//You can also call the preconditionFailure(_:file:line:) function to indicate that a failure has occurred—for example, if the default case of a switch was taken, but all valid input data should have been handled by one of the switch’s other cases.
