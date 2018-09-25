/*:
 # Randomness

 ---

 ## The Old Way

 Prior to Swift 4.2, randomness was not built into the language, and developers were instead forced to rely on their platforms to supply a random number generator they could use. In the context of iOS/macOS, this was likely something like `arc4random(_:)` or from GameplayKit
*/

import Darwin
let sysRand = arc4random_uniform(100)

import GameplayKit
let gameRand = GKRandomSource.sharedRandom().nextInt(upperBound: 100)

/*:
 This is pretty clunky, however, because we have to `import` a module, which is supplied by a platform we may not necessarily be on if our aim is to write cross-platform code. This forces us to write multiple versions of code to do the same thing in order to run wherever we want it to. Furthermore, we can't necessarily guarantee cryptographic security, as we must rely on whatever random number generator that our platform implements

 ---

 ## The New Way

 As hinted about before in the page on [`Hashable` improvements](Hashing), a cryptographically-secure random number generator is now built into the language. Even better, it's super simple to use. For example, if we wanted to generate a random `Int` between 0 and 100 exclusive as we have twice above, it's as easy as
*/

let swiftRand = Int.random(in: 0..<100)

//: This isn't just constrained to `Int`, either. It's implemented by effectively all the numeric types, as well as the `Bool` type, so it's easy to generate random numbers wherever it makes sense, and even booleans

let floatingRand = Double.random(in: 0..<100)
let booleanRand = Bool.random()

//: The language-provided random number generator is efficient, thread safe, and cryptographically-secure, but the randomness interface is also extensible, as it allows you to provide your own random number generator, if you so choose

// This is an example implementation that doesn't actually do anything random. Please don't use it for real
struct CustomRandomNumberGenerator: RandomNumberGenerator{
    var seed: Int

    mutating func next() -> UInt64{
        seed += 1
        return UInt64(seed)
    }

    mutating func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger {
        if seed >= upperBound{
            seed = Int(upperBound - 2)
        }
        return next()
    }
}

var customGenerator = CustomRandomNumberGenerator(seed: 5)
let customRand = Int.random(in: 0..<100, using: &customGenerator)

//: Collection types also got some nice extensions for common random operations involved

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.randomElement()
numbers.shuffle() // Shuffles the array in-place
numbers.shuffled() // Makes a new shuffled copy

//: [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
