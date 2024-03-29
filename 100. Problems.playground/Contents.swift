import UIKit

// MARK: String Indexing, Substring, Trimming and Splitting

let greeting = "Hello World!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]//Last Character
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[...index]

extension String {
    func substr(_ range: NSRange) -> String {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        let subString = self[start..<end]
        return String(subString)
    }
}

func getMessage(_ message: String, k: Int) -> String {
    if message.count <= k {
        return message
    }
    
    let endIndex = message.index(message.startIndex, offsetBy: k)
    let firstRange = message[..<endIndex]
    let startIndex = message.index(message.endIndex, offsetBy:(k - message.count))
    let lastRange = message[startIndex..<message.endIndex]
    
    if lastRange.first == " " { //lastRange[lastRange.startIndex]
        return String(firstRange)
    } else if firstRange.last == " " {
        return String(firstRange).trimmingCharacters(in: .whitespaces)
    } else {
        var splitedArray = firstRange.split(separator: " ")
        splitedArray.removeLast()
        return splitedArray.joined(separator: " ")
    }
}

let input = "To crop or not to crop"
let msg = getMessage(input, k: 21)

// MARK: Get Mejority Element
func getMejorityElement(n: Int, A: [Int]) -> Int {
    let mappedItems = A.map { ($0, 1) }
    let itemsByCount = Dictionary(mappedItems, uniquingKeysWith: +)
    let pairByMajority = itemsByCount.filter {$1 > n}
    guard let majority = pairByMajority.first else { return 0 }
    return majority.key
}

let a = [1,1,2]
a.count
let threshold = Int(floor(Double(a.count/2)))
let result = getMejorityElement(n: threshold, A: a)
result
