/*:
 # Dynamic Member Lookup

 If you've ever used a dynamic language like JavaScript or Python, you'll know that data structures in those languages look up their dot-notation keys at runtime, without any ahead-of-time guarantees that the key is even defined. This is in contrast with Swift, where all dot-notation keys must be defined and type-checked at compile time

 Swift 4.2 adds support for dynamically looking up an object's dot-notation-accessed keys at runtime, instead of forcing it at compile time. However, we get to keep the type safety that Swift gives us by default. Let's say we have a model backed by data we've downloaded from the network. We'll just store the `Dictionary` we get from serializing the data we downloaded, and instead of further serializing it into our model, we'll just look up the keys in the `Dictionary` as they're requested. This is useful in cases such as when a particular key isn't necessarily guaranteed to define any particular key
*/

@dynamicMemberLookup struct Restaurant{
    let name: String
    let address: String

    var others: [String: Any]

    subscript(dynamicMember index: String) -> String{
        return others[index] as? String ?? ""
    }

    subscript(dynamicMember index: String) -> Int{
        return others[index] as? Int ?? 0
    }
}

let deli = Restaurant(name: "Michael's Deli", address: "123 Example Way", others: ["address": "567 Other Lane", "hours": "10 AM to 11 PM", "openTime": 10, "closeTime": 23])

deli.name
deli.address

let hours: String = deli.hours
let openTime: Int = deli.openTime

/*:
 There are a few notes here: Data structures must opt into dynamic member capability with the `@dynamicMemberLookup` decorator, which then forces it to implement a method called `subscript(dynamicMember:)`, which must take a `String` key. You can define overloads of this subscript to `return` any type you want to, but you must annotate what type you're expecting at the call site. Furthermore, if your type statically defines a particular member, it will take precedence over any `subscript(dynamicMember:)` implementations, even if one of them would `return` something different for the same key. Otherwise, at the end of the day, it's just syntactic sugar for `String`-based keys

 [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
*/
