import UIKit

//Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations.

//Mutability of Collections : If you create an array, a set, or a dictionary, and assign it to a variable, the collection that is created will be mutable. This means that you can change (or mutate) the collection after it’s created by adding, removing, or changing items in the collection. If you assign an array, a set, or a dictionary to a constant, that collection is immutable, and its size and contents cannot be changed.

//It is good practice to create immutable collections in all cases where the collection does not need to change. Doing so makes it easier for you to reason about your code and enables the Swift compiler to optimize the performance of the collections you create.

//An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.

//Creating an Empty Array :
var someInts = [Int]() //or
someInts = [] //infers as Int array
//or
var emptyArray = Array<Int>()

//Swift’s Array type also provides an initializer for creating an array of a certain size with all of its values set to the same default value.
var threeDoubles = Array(repeating: 0.0, count: 3)// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

//Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)// anotherThreeDoubles is of type [Double]
var sixDoubles = threeDoubles + anotherThreeDoubles// sixDoubles is inferred as [Double]
sixDoubles += anotherThreeDoubles

//Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"] // var shoppingList = ["Eggs", "Milk"]
// Note - The shoppingList array is declared as a variable (with the var introducer) and not a constant (with the let introducer) because more items are added to the shopping list in the examples below.

//Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if shoppingList.isEmpty {
    print("The shopping list is empty.")
}

//Appending item to array
shoppingList.append("Flour")
shoppingList += ["Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
//shoppingList[shoppingList.count] = "Salt" //run time error
print(shoppingList)

//You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
shoppingList[2...6] = ["Bananas", "Apples"]// shoppingList now contains 6 items
print(shoppingList)

//To insert an item into the array at a specified index, call the array’s insert(_:at:) method:
shoppingList.insert("Maple Syrup", at: 0)

//Similarly, you remove an item from the array with the remove(at:) method.
let mapleSyrup = shoppingList.remove(at: 0)
print(mapleSyrup)
print(shoppingList)

//NOTE - If you try to access or modify a value for an index that is outside of an array’s existing bounds, you will trigger a runtime error.

//Use the removeLast() method rather than the remove(at:) method to avoid the need to query the array’s count property. Like the remove(at:) method, removeLast() returns the removed item:
let lastItem = shoppingList.removeLast()
print(lastItem)

//If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead.
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//Sets : A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

//Hashable :

//Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")// letters now contains 1 value of type Character
letters = []// letters is now an empty set, but is still of type Set<Character>

//Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]// favoriteGenres has been initialized with three initial items

//A set type cannot be inferred from an array literal alone, so the type Set must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type.
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

//Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
}

//You can add a new item into a set by calling the set’s insert(_:) method:
favoriteGenres.insert("Jazz")

//You can remove an item from a set by calling the set’s remove(_:) method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set did not contain it. Alternatively, all items in a set can be removed with its removeAll() method.
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

//To check whether a set contains a particular item, use the contains(_:) method.
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
}

/*
Set operations :
Use the intersection(_:) method to create a new set with only the values common to both sets.
Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
Use the union(_:) method to create a new set with all of the values in both sets.
Use the subtracting(_:) method to create a new set with values not in the specified set.
*/
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()// [1, 2, 9]

/*
 Set Membership and Equality :
 Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
 Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
 Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
 Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
 Use the isDisjoint(with:) method to determine whether two sets have no values in common.
 */
 let houseAnimals: Set = ["🐶", "🐱"]
 let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
 let cityAnimals: Set = ["🐦", "🐭"]
 
 houseAnimals.isSubset(of: farmAnimals)// true
 farmAnimals.isSuperset(of: houseAnimals)// true
 houseAnimals.isStrictSubset(of: farmAnimals)// true
 farmAnimals.isDisjoint(with: cityAnimals)// true

//Creating empty dictionary
var namesOfIntegers = [Int: String]()

//Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty.")
}

//You can also use subscript syntax to add/change the value associated with a particular key:
airports["LHR"] = "London Heathrow"

//The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. For a dictionary that stores String values, for example, the method returns a value of type String?, or “optional String”. This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

//You can also use subscript syntax to retrieve a value from the dictionary for a particular key.
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
}

//You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:
airports["APL"] = "Apple International"// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil// APL has now been removed from the dictionary
print(airports)

//Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//Iterating Over a Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)// airportCodes is ["YYZ", "LHR"]
let airportNames = [String](airports.values)// airportNames is ["Toronto Pearson", "London Heathrow"]

//Swift’s Dictionary type does not have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property.
