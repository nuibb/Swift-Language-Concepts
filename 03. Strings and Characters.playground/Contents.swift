import UIKit

//If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks:
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
"""

// If you want to use line breaks to make your source code easier to read, but you don’t want the line breaks to be part of the string’s value, write a backslash (\) at the end of those lines:
let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where shall I begin, \
please your Majesty?" he asked.

     "Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

/*
 String literals can include the following special characters:
    01. The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
    02. An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number
 */
let wiseWords = "\"Imagination is more important than knowledge\" \n - Einstein"// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
print(wiseWords)

//To include the text """ in a multiline string, escape at least one of the quotation marks. For example:
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

///Initializing an Empty String: Following two strings are both empty, and are equivalent to each other
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax

//Find out whether a String value is empty by checking its Boolean isEmpty property:
if emptyString.isEmpty {
    print("Nothing to see here")
}

//String Mutability
var variableString = "Horse"
variableString += " and carriage"// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // this reports a compile-time error - a constant string cannot be modified

//Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.

//You can access the individual Character values for a String by iterating over the string with a for-in loop:
for character in "Dog!🐶" {
    print(character)
}

//you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation:
let exclamationMark: Character = "!"

//String values can be constructed by passing an array of Character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//Concatenating Strings
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//You can append a Character value to a String variable with the String type’s append() method, but you can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.:
welcome.append(exclamationMark) // welcome now equals "hello there!"

//String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal.
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//You can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation. For example:
print(#"Write an interpolated string in Swift using \(multiplier)."#)// Prints "Write an interpolated string in Swift using \(multiplier)."


//To use string interpolation inside a string that uses extended delimiters, match the number of number signs before the backslash to the number of number signs at the beginning and end of the string. The expressions you write inside parentheses within an interpolated string can’t contain an unescaped backslash (\), a carriage return, or a line feed. However, they can contain other string literals. For example:
print(#"6 times 7 is \#(6 * 7)."#)// Prints "6 times 7 is 42."

//Count characters in String
print(welcome.count)

//Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string. You can use subscript syntax to access the Character at a particular String index.
let greeting = "Guten Tag!"
greeting[greeting.startIndex]// G
greeting[greeting.index(before: greeting.endIndex)]// !
greeting[greeting.index(after: greeting.startIndex)]// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]// a

//Attempting to access an index outside of a string’s range or a Character at an index outside of a string’s range will trigger a runtime error.
//greeting[greeting.endIndex] // Error
//greeting.index(after: greeting.endIndex) // Error

//Use the indices property to access all of the indices of individual characters in a string.
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

//Note - You can use the startIndex and endIndex properties and the index(before:), index(after:), and index(_:offsetBy:) methods on any type that conforms to the Collection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

//To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
var welcomeText = "hello"
welcomeText.insert("!", at: welcomeText.endIndex)// welcome now equals "hello!"
welcomeText.insert(contentsOf: " there", at: welcomeText.index(before: welcomeText.endIndex))// welcome now equals "hello there!"

//To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:
welcome.remove(at: welcome.index(before: welcome.endIndex))// welcome now equals "hello there"
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)// welcome now equals "hello"

//NOTE - You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

//When you get a substring from a string—for example, using a subscript or a method like prefix(_:)—the result is an instance of Substring, not another string. Substrings in Swift have most of the same methods as strings, which means you can work with substrings the same way you work with strings. However, unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String. For example:
let greeting1 = "Hello, world!"
let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index1]// beginning is "Hello"
let newString = String(beginning)// Convert the result to a String for long-term storage.
//As mentioned above, substrings aren’t suitable for long-term storage—because they reuse the storage of the original string, the entire original string must be kept in memory as long as any of its substrings are being used.

//Both String and Substring conform to the StringProtocol protocol

//Comparing Strings : Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.

//String and Character Equality
let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation1 == sameQuotation {
    print("\nThese two strings are considered equal")// Prints "These two strings are considered equal"
}

//Prefix and Suffix Equality : To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
if quotation1.hasPrefix("We're") {
    print(quotation1)
}

if sameQuotation.hasSuffix(".") {
    print(sameQuotation)
}

//UTF-8 Representation
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {//you can use urf16/unicodeScalars also
    print("\(codeUnit) ", terminator: "")
}
print("")// Prints "68 111 103 226 128 188 240 159 144 182 "
