/*:
 # Hashing

---

 ## The Old Way

 Hashing before Swift 4.2 was a bit of a mess. The goal is to have the `hashValue` property from your object that conforms to `Hashable` produce the same value for instances that are equal. The most common way to achieve this was to just `XOR` all your properties together:
*/

struct HashBrown: Hashable{
    var potato: String
    var style: String
    var toppings: [String]

    var hashValue: Int{
        get{
            return potato.hashValue ^ style.hashValue ^ toppings.hashValue
        }
    }
}

/*:
 This is not nice to write yourself, because the common implementation often produces collisions and unclear to people who've never `XOR`'d anything, and anything better is difficult to implement on your own. Things got a little better in Swift 4.1 because the compiler could automatically synthesize a good implementation, as long as you declared your `Hashable` conformance in your object definition itself and not an `extension`

 ---

 ## The New Way

 Hashing is one of the biggest areas of improvement in Swift 4.2, as an easy-to-use, cryptographically-secure generic hash implementation is built into the standard library. Instead of implementing `hashValue` to conform to `Hashable`, you now implement a method called `hash(into:)`, which is passed a `Hasher` structure as an `inout` parameter. Now an implementation is as simple as calling `combine(_:)` for all of your properties
*/

struct Egg: Hashable{
    var shellColor: String
    var size: String
    var species: String

    func hash(into hasher: inout Hasher) -> Void{
        hasher.combine(shellColor)
        hasher.combine(size)
        hasher.combine(species)
    }
}

//: Of course, these `Hashable` implementations are still automatically synthesized by the compiler. However, you can even create your own `Hasher`s to create your own hash values

let egg = Egg(shellColor: "White", size: "Jumbo", species: "Rhode Island White")
let hashBrown = HashBrown(potato: "Russett", style: "Plain", toppings: [])

var pan = Hasher()
pan.combine(egg)
pan.combine(hashBrown)

let breakfastHash = pan.finalize()

/*:
 - note: The algorithim that `Hasher` uses is now cryptographically-securely randomly seeded, which fulfills a longstanding prophecy of the documentation: "Hash values are not guaranteed to be equal across different executions of your program. Do not save hash values to use during a future execution". Since any particular hash value will not be the same across runs of your program, this means you can't do things like save a hash value to compare later or rely on the implicit order of your unordered collections, like `Dictionary` or `Set`

 Also new in Swift 4.2 is that the `Optional`, `Array`, `ArraySlice`, `ContiguousArray`, `Dictionary`, `Range`, and `ClosedRange` types all conform to `Hashable` when their elements also do, so that a `Hashable` implementation can be synthesized for your object which has one or more of these types as a stored property

 [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
*/
