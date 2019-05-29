import Foundation

//Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example below, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.
enum CompassPoint  {
    case north
    case south
    case east
    case west
}

print(CompassPoint.south)//print 'south'
//print(CompassPoint.south.rawValue)//error

enum CompassPoint1 : Int  { //If the first case doesn’t have a value set, its raw value is 0.
    case north = 1
    case south
    case east
    case west
}

var direction = CompassPoint1.south

//Once variable is declared as a enum, you can set it to a different enum value using a shorter dot syntax
direction = .north
print(direction)//print 'north'
print(direction.rawValue)//print '1'

//Initializing from a Raw Value : If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil. The raw value initializer is a failable initializer, because not every raw value will return an enumeration case. When it isn’t appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that aren’t addressed explicitly:
let positionToFind = 0
if let somePlanet = CompassPoint1(rawValue: positionToFind) {
    switch somePlanet {
    case .north:
        print("North pole")
    default:
        print("Not north pole")
    }
} else {
    print("There isn't a direction at position \(positionToFind)") // Prints "There isn't a planet at position 11"
}

//For iterating over Enumeration Cases, enum must have to implement CaseIterable protocol
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

print("\(Beverage.allCases.count) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

//Associated Values :  You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

//If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

//RAW values : As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.
enum CompassPoint3: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint3.west.rawValue// sunsetDirection is "west"

//Recursive Enumerations : A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it or before the enum keyword only, both cases tells the compiler to insert the necessary layer of indirection.
enum ArithmeticExpression1 {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
} 
// or
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))// Prints "18"


