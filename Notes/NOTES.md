# Basic expressions

Swift code looks in its first view as many other languages

1. We can have global expressions without the need of a function or class
2. Semi-colons are optional, not recommended unless two expressions share a line
3. Everything we declare is accesible by other files in the same app or framework
4. We use (mandatory) curly braces for code blocks following C-syntax.
5. Spaces and new lines are, most of the time, ignored

```
var x = 1; var y = 2

// Boolean conditions don't need parenthesis
if x > 1 {

}

while x < 10 {
    x += 1  // ++ operator does NOT exist in Swift
}

print(x)    // print sends a message to the console with a new line after
```

## Name style guidelines

```
// Variables, constants and function name use camelCase
var name: String
let tax = 7.8
func printMessage() { }

// Data types use TitleCase
class CustomerOrder { }
enum UserType { }
protocol MyProtocol { }
struct ApiResponse { }

// Valid identifiers: as most languages, but with steroids
var español = "hola"
var 🐄 = 1
var 愛 = "love"

// Visibility
public var visible = 1
private var invisible = 2
fileprivate var kindOfInvisible = 3
```

# Variables and Types

Swift is a statically typed language, but it's also flexible and support type inference

```
// Variables use the keyword `var`
var data = 3
data = 5
data = 7

// Constants use the keyword `let`, they can also be used as inmutable variables
// CAREFUL JAVASCRIPT DEVS!
// We want to use let as much as possible
let tax = 7.8
//tax = 10

// Types are defined with colon after name, but they can be inferred by its initial value
var price: Double
var otherPrice = 325.99

// Sometimes we want to explicitly define the data type
var aThirdPrice = 23   // is it a Double?

// Core Data Types
let string: String
let integer: Int   // there are also bit-specific and unsigned versions
let double: Double // there is also Float
let boolean: Bool  // values are true and false

// String Literals, double quotes
print("Hello World")
// Every string can have template expressions using \()
// expression result will be converted to string
var message = "The price is \(otherPrice * 1.1)"

// Tuples
let coordinate: (Int, Int) = (4, 5)
let city: (String, Int) = ("Minneapolis", 420_000)
print(city.0, city.1)

// Tuple segments can have names for better access
let state: (name: String, population: Int, isNice: Bool)
state = ("Minnesota", 5_640_000, true)

```

# Collections

Swift includes several collections ready to use, here just the ones we will use

```
// Array, we use [] and the type of the collection inside
// The literal string follows JSON syntax
var countries: [String] = ["Argentina", "Brazil", "Canada", "Denmark"]
// If the collection is a `var`, it's mutable
countries.append("Egypt")

// If the collection is a `let`, it's inmutable
let cities: [String] = ["Alameda", "Buenos Aires", "Cali"]

let anything: [Any] = [1, true, "A"]
```

# Null Safety

A String must have a string value, but a String? accepts nil (aka null)

```
var name: String?

// Null-safe operators
//print(name.count)

// If let
if let name = name {
    print(name.count)
}
```
