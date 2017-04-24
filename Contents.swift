//: Playground - noun: a place where people can play

// walking through in this: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html

print("Hello, Swift!")


////
//// Simple Values
////

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
let myName = "zsmester"
let score: Float = 4.321
print("\(myName), your score is \(score)")

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


////
//// Functions and Closures
////

func greet(person: String, course: String) -> String {
	return "Hello \(person), today's first course is \(course)."
}
greet(person: "Bob", course: "stuffed cabbage")

func greet(_ person: String, on day: String) -> String {
	return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

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
print(statistics.sum)
print(statistics.2)

func sumOf(numbers: [Int]) -> Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}
func sumOf(numbers: Int...) -> Int {
	return sumOf(numbers: numbers)
}
sumOf()
sumOf(numbers: 42, 597, 12)

func averageOf(numbers: Int...) -> Double {
	let sum = sumOf(numbers: numbers)
	let average = Double(sum) / Double(numbers.count)
	return average
}
averageOf(numbers: 2, 4)

func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
	func addOne(number: Int) -> Int {
		return 1 + number
	}
	return addOne
}
var increment = makeIncrementer()
increment(7)

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

numbers.map({ (number: Int) -> Bool in
	let result = number % 2
	return result == 0
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


////
//// Objects and Classes
////

class Shape {
	var numberOfSides = 0
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
	var numberOfSides: Int = 0
	var name: String

	init(name: String) {
		self.name = name
	}

	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

// deinit: destruktor

class Square: NamedShape {
	var sideLength: Double

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 4
	}

	func area() -> Double {
		return sideLength * sideLength
	}

	override func simpleDescription() -> String {
		return "A square with sides of length \(sideLength)."
	}
}
let testSquare = Square(sideLength: 5.2, name: "my test square")
testSquare.area()
testSquare.simpleDescription()

class Circle: NamedShape {
	var radius: Double

	init(radius: Double, name: String) {
		self.radius = radius
		super.init(name: name)
		numberOfSides = 0
	}

	func area() -> Double {
		return radius * radius * Double.pi
	}

	override func simpleDescription() -> String {
		return "A circle with radius of \(radius)."
	}
}
let testCircle = Circle(radius: 2, name: "my test circle")
testCircle.area()
testCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
	var sideLength: Double = 0.0

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 3
	}

	var perimeter: Double {
		get {
			return 3.0 * sideLength
		}
		set {
			sideLength = newValue / 3.0
		}
	}

	override func simpleDescription() -> String {
		return "An equilateral triangle with sides of length \(sideLength)."
	}
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
	var triangle: EquilateralTriangle {
		willSet {
			square.sideLength = newValue.sideLength
		}
	}
	var square: Square {
		willSet {
			triangle.sideLength = newValue.sideLength
		}
	}
	init(size: Double, name: String) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name)
	}
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = nil
let sideLength = optionalSquare?.sideLength


////
//// Enumerations and Structures
////

enum Rank: Int {
	case ace = 1
	case two, three, four, five, six, seven, eight, nine, ten
	case jack, queen, king
	func simpleDescription() -> String {
		switch self {
		case .ace:
			return "ace"
		case .jack:
			return "jack"
		case .queen:
			return "queen"
		case .king:
			return "king"
		default:
			return String(self.rawValue)
		}
	}
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

func compareRanks(lhs: Rank, rhs: Rank) -> Int {
	if lhs.rawValue < rhs.rawValue {
		return -1
	} else if rhs.rawValue < lhs.rawValue {
		return 1
	} else {
		return 0
	}
}
let king = Rank.king
print(compareRanks(lhs: ace, rhs: king))

if let convertedRank = Rank(rawValue: 12) {
	let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
	case spades, hearts, diamonds, clubs
	func simpleDescription() -> String {
		switch self {
		case .spades:
			return "spades"
		case .hearts:
			return "hearts"
		case .diamonds:
			return "diamonds"
		case .clubs:
			return "clubs"
		}
	}
	func color() -> String {
		switch self {
		case .spades, .clubs:
			return "black"
		case .hearts, .diamonds:
			return "red"
		}
	}
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(hearts.color())

enum ServerResponse {
	case result(String, String)
	case failure(String)
	case timeout(Int)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let timeout = ServerResponse.timeout(5000)
switch success {
case let .result(sunrise, sunset):
	print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
	print("Failure...  \(message)")
case let .timeout(milliseconds):
	print("Timeout. We waited \(milliseconds) ms.")
}

// One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.

struct Card {
	var rank: Rank
	var suit: Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
	static func fullDeck() -> [Card] {
		var deck = [Card]()
		for suit in [Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades] {
			for rank in Rank.ace.rawValue...Rank.king.rawValue {
				deck.append(Card(rank: Rank(rawValue: rank)!, suit: suit))
			}
		}
		return deck
	}
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
let deck = Card.fullDeck()


////
//// Protocols and Extensions
////

protocol ExampleProtocol {
	var simpleDescription: String { get }
	mutating func adjust()
}

class SimpleClass: ExampleProtocol {
	var simpleDescription: String = "A very simple class."
	var anotherProperty: Int = 69105
	func adjust() {
		simpleDescription += "  Now 100% adjusted."
	}
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
	var simpleDescription: String = "A simple structure"
	mutating func adjust() {
		simpleDescription += " (adjusted)"
	}
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

enum SimpleEnum: ExampleProtocol {
	case Base, Adjusted

	var simpleDescription: String {
		switch self {
		case .Base:
			return "Base enum."
		case .Adjusted:
			return "Adjusted enum."
		}
	}

	mutating func adjust() {
		self = .Adjusted
	}
}
var c = SimpleEnum.Base
c.adjust()
let cDescription = c.simpleDescription

extension Int: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}
print(7.simpleDescription)

extension Double {
	var absoluteValue: Double {
		get {
			if self < 0 {
				return -self
			} else {
				return self
			}
		}
	}

}
print((-7.0).absoluteValue)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error


////
//// Error Handling
////

enum PrinterError: Error {
	case outOfPaper
	case noToner
	case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
	if printerName == "Never Has Toner" {
		throw PrinterError.noToner
	}
	return "Job sent"
}

do {
	var printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
	print(printerResponse)
	printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
} catch {
	print(error)
}

do {
	let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
	print(printerResponse)
	throw PrinterError.onFire
	throw PrinterError.outOfPaper // never run
} catch PrinterError.onFire {
	print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
	print("Printer error: \(printerError).")
} catch {
	print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
	fridgeIsOpen = true
	defer {
		fridgeIsOpen = false
	}

	let result = fridgeContent.contains(food)
	return result
}
fridgeContains("banana")
print(fridgeIsOpen)


////
//// Generics
////

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
	var result = [Item]()
	for _ in 0..<numberOfTimes {
		result.append(item)
	}
	return result
}
makeArray(repeating: "knock", numberOfTimes:4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
	case none
	case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
	where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
		for lhsItem in lhs {
			for rhsItem in rhs {
				if lhsItem == rhsItem {
					return true
				}
			}
		}
		return false
}
anyCommonElements([1, 2, 3], [3])