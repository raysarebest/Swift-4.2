/*:
 # Protocol Conformance

 Swift 4.1 was able to synthesize your object's conformances to certain `protocol`s (`Equatable`, `Hashable`, `Codable`, etc.), but with a fairly restrictive condition -- you *had* to declare your conformance in the object's declaration itself. In Swift 4.2, the compiler can automatically synthesize conformance to those protocols, even if conformance is declared within an `extension`, as long as it's in the same file as the declaration
*/

struct Program<Language: Equatable>{
    var language: Language
}

extension Program: Equatable{}

//: This can lead to some fun things, like automatic synthesis of conditional conformances

extension Program: Hashable where Language: Hashable{}

//: - warning: Be careful about conforming to a `protocol` composition, and instead consider conforming to the individual `protocol`s that make up the composition. This allows for conformance to one without necessarily the other. For example, if one wants to make a type `Decodable`, conforming directly to `Codable` would require the generic parameter to also be `Encodable`, which likely isn't necessary

extension Program: Encodable where Language: Encodable{}
extension Program: Decodable where Language: Decodable{}

//: Furthermore, unlike in Swift 4.1 and earlier, you can now check if an object conforms to a particular protocol at runtime

let app = Program(language: "Swift")

if let comparableApp = app as? CustomStringConvertible{
    // `app` conforms to `CustomStringConvertible`
    print("\(comparableApp) can be converted to a string")
}
else{
    // `app` is not `CustomStringConvertible`
    print("\(app) does not provide a description of itself")
}

//: [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
