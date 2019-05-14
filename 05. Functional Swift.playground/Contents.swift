import UIKit

// Map : Use map to loop over a collection and apply the same operation as closure to each element in the collection. The map function returns an array containing the results of applying a mapping or transform function to each item. The return type of a map function is always a generic array. You can return an array of any type.
let arrayOfInt = [2,3,4,5,4,7,2]
let newArrUsingMap = arrayOfInt.map { $0 * 10 }
print(newArrUsingMap)
let newArrUsingMap1 = arrayOfInt.map { val in val * 5 }
print(newArrUsingMap1)

//Map on Dictionary:
let bookAmount = ["harrypotter":100.0, "junglebook":100.0]
let returnArrayFromMap = bookAmount.map { (key, value) in
   return (key, value * 10)
}
print(returnArrayFromMap)

//Map on Set
let lengthInMeters: Set = [4.0,6.2,8.9]
let lengthInFeet = lengthInMeters.map{meter in meter * 3.2808}
print(lengthInFeet)
let lengthInFeet1 = lengthInMeters.map{$0 * 3.2808}
print(lengthInFeet1)

//Indexing on map
let numbers = [1, 2, 4, 5]
let indexAndNum = numbers.enumerated().map { (index,element) in
    return "\(index):\(element)"
}
print(indexAndNum)

//Filter : Use filter to loop over a collection and return an Array containing only those elements that match an include condition. The filter method has a single argument that specifies the include condition. This is a closure that takes as an argument the element from the collection and must return a Bool indicating if the item should be included in the result.
let arrayOfIntegers = [1,2,3,4,5,6,7,8,9]
let filteredArray = arrayOfIntegers.filter { (someInt) -> Bool in
    someInt % 2 == 0
}
print(filteredArray)

//The filter closure can be further simplified like we did for map.
arrayOfIntegers.filter( { (someInt:Int) -> Bool in return someInt % 2 == 0 } )
arrayOfIntegers.filter( { (someInt:Int) in return someInt % 2 == 0 } )
arrayOfIntegers.filter( { (someInt) in return someInt % 2 == 0 } )
arrayOfIntegers.filter( { (someInt) in someInt % 2 == 0 } )
arrayOfIntegers.filter( { $0 % 2 == 0 } )
arrayOfIntegers.filter { $0 % 2 == 0 }

//Filter on dictionary
let filteredArrayOnDictionary = bookAmount.filter({ (key, value) in
    return value + 1  > 100
})
print(filteredArrayOnDictionary)

//Simplified form :
let filteredArrayOnDict = bookAmount.filter { $1 > 99}//$0 is the key, $1 is the value
print(filteredArrayOnDict)

//Filter on set
let lengthInFeet2 = lengthInMeters.filter {$0 > 5}
print(lengthInFeet2)

//Equatable - check if all the elements of two object is similar or not
struct Country: Equatable {
    let name: String
    let capital: String
    var visited: Bool
}

let france = Country(name: "France", capital: "Paris", visited: true)
let french = Country(name: "France", capital: "Paris", visited: true)
let spain = Country(name: "Spain", capital: "Madrid", visited: true)
if france == spain { print("true") } else {print("false")}

//Reduce : Use reduce to combine all items in a collection to create a single new value. The reduce closure can be further simplified like we did for map/filter. Can apply to string array also like int array.
let numbersArray = [1,2,3,4]
let numberSum = numbersArray.reduce(5, {$0 + $1})//or $0 * $1
print(numberSum)
let numberSum1 = numbersArray.reduce(0, {x,y in x+y})
print(numberSum1)
let reducedNumberSum = numbersArray.reduce(5) { $0 + $1 }
print(reducedNumberSum)//

//Instead of the closure, we could also pass basic operator functions like +, -, *, /
let reducedNumberSum1 = numbersArray.reduce(0,+) // returns 10
let reducedNumberMul = numbersArray.reduce(5,*) // returns 120

//Reduce on dictionary
let reduceAmountOnDic2 = bookAmount.reduce(10, { (result, tupleOfKeyvalue) in
    return result + tupleOfKeyvalue.value
})
print(reduceAmountOnDic2)

let reduceBookNamesOnDic2 = bookAmount.reduce("Books are : ", { (result, tupleOfKeyvalue) in
    return result + tupleOfKeyvalue.key + " "
})
print(reduceBookNamesOnDic2)

//Reduce on Set
let reducedSet = lengthInMeters.reduce(5.0) {$0 + $1}
print(reducedSet)

//FlatMap
