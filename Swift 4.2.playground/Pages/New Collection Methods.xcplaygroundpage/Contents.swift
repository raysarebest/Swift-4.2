/*:
 # New Collection Methods

 Swift 4.1 provided a few useful collection/sequence methods like `first(where:)` and `index(of:)`. However, some of these names were ambiguous given their actual functionality, so Swift 4.2 has renamed a few of these for clarity
*/

var names = ["Michael", "Jennifer", "Kristi", "Craig", "Emily", "Jennifer"]

names.firstIndex(of: "Jennifer")

let firstIndex = names.firstIndex(where: { $0.contains("i") })
firstIndex

//: Swift 4.2 also adds methods that also find an element given a predicate, but they find the last instance of a matching element instead of the first

let lastE = names.last(where: {$0.contains("e")})
lastE

names.lastIndex(of: "Jennifer")

let lastIndex = names.lastIndex(where: {$0.contains("i")})
lastIndex

//: Swift 4.2 also has a handy method to see if all elements in a collection match a particular condition

let allI = names.allSatisfy({$0.contains("i")})
allI

let allG = names.allSatisfy({$0.contains("g")})
allG

//: Lastly, it also adds a method to remove all elements that match a particular condition, like an in-place version of `filter(_:)`

names.removeAll(where: {$0.contains("r")})
names

//: [< Last Feature](@previous)    [Home](Intro)
