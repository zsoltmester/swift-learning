//: Playground - noun: a place where people can play

// walking through in this: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html

print("Hello, Swift!")


////
//// Simple Values
////

/*
var myVariable = 42
myVariable = 50
let myConstant = 42

// types inferred by the compiler (implicit type)

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

// if type is inferred, no type change allowed afterwards

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let name = "zsmester"
let score: Float = 4.321
print("\(name), your score is \(score)")

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
	"Malcolm": "Captain",
	"Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// inferred from the var's type:
shoppingList = []
occupations = [:]
*/


////
//// Control Flow
////

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
	if score > 50 {
		teamScore += 3
	} else {
		teamScore += 1
	}
}
print(teamScore)

// there is no implicit comparison to 0. if score { ... will fail.

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName { // checks for nil
	greeting = "Hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "red pepper"
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

let interestingNumbers = [
	"Prime": [2, 3, 5, 7, 11, 13],
	"Fibonacci": [1, 1, 2, 3, 5, 8],
	"Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String = ""
for (kind, numbers) in interestingNumbers {
	for number in numbers {
		if number > largest {
			largest = number
			largestKind = kind
		}
	}
}
print("The largest \(largest), in \(largestKind).")

var n = 2
while n < 100 {
	n *= 2
}
print(n)

var m = 2
repeat {
	m *= 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 { // or ... to include 4
	total += i
}
print(total)
