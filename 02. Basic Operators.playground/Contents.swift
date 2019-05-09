import UIKit

//Assignment Operator : Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value. The following statement is not valid:
var (x, y) = (1, 2)
//if x = y {// This is not valid, because x = y does not return a value.}
//This feature prevents the assignment operator (=) from being used by accident when the equal to operator (==) is actually intended.

//Unary Minus Operator : The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

//Unary Plus Operator : The unary plus operator (+) simply returns the value it operates on, without any change
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
print(alsoMinusSix)

//Compound Assignment Operators
var a = 1
a += 2 // a is now equal to 3

/*
Swift supports all standard C comparison operators:
Equal to (a == b)
Not equal to (a != b)
Greater than (a > b)
Less than (a < b)
Greater than or equal to (a >= b)
Less than or equal to (a <= b)
*/

//Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance.

//You can compare two tuples if they have the same type and the same number of values. Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison. If all the elements are equal, then the tuples themselves are equal. For example:
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

//Tuples can be compared with a given operator only if the operator can be applied to each value in the respective tuples.
("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values

//The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.

//ernary Conditional Operator
let hasHeader = true
let rowHeight = hasHeader ? 50 : 20

//Nil-Coalescing Operator : The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a.
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName // userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//Closed Range Operator : The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.
//Half-Open Range Operator : The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b.

//One-Sided Ranges : The closed range operator has an alternative form for ranges that continue as far as possible in one direction. This kind of range is called a one-sided range because the operator has a value on only one side. For example:
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)// Brian, Jack
}

for name in names[...2] {
    print(name)// Anna, Alex, Brian
}

for name in names[..<2] {
    print(name)// Anna, Alex
}

//One-sided ranges can be used in other contexts, not just in subscripts. You can’t iterate over a one-sided range that omits a first value, because it isn’t clear where iteration should begin. You can iterate over a one-sided range that omits its final value; however, because the range continues indefinitely, make sure you add an explicit end condition for the loop. You can also check whether a one-sided range contains a particular value, as shown in the code below.
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

// Swift supports the three standard logical operators found in C-based languages:
//Logical NOT (!a) : The logical NOT operator (!a) inverts a Boolean value so that true becomes false, and false becomes true.
//Logical AND (a && b) : The logical AND operator (a && b) creates logical expressions where both values must be true for the overall expression to also be true.
//Logical OR (a || b) : The logical OR operator (a || b) creates logical expressions where only one of the two values has to be true for the overall expression to be true.
