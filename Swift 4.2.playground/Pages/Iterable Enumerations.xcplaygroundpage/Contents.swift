/*:
 # Iterable `enum`s

 Swift 4.2 provides a way to interate over all of an `enum`'s `case`s, without having to write much extra code on your own

---

 ## The Old Way

 Before Swift 4.2, you had to make your own `static` property on your `enum` that held each `case`, and iterate over that property
 */

enum Vehicle{
    case car
    case plane
    case train
    case boat

    static var allVehicles: [Vehicle] = [.car, .plane, .train, .boat]
}


for vehicle in Vehicle.allVehicles{
    dump(vehicle)
}

/*:
 This is error prone, however. If you add, delete, or change any particular `case`, you also have to remember to update `allVehicles`

---

 ## The New Way

 Swift 4.2 will synthesize this array for you at compile time. All you have to do is declare that your `enum` conforms to the new `CaseIterable` protocol
 */

enum Food: CaseIterable{
    case pizza
    case taco
    case burger
    case sandwich
    case spaghetti

    //    case chips(count: Int)
    //
    //    @available(*, unavailable)
    //    case liverwurst
    //
    //    static var allCases: [Food]{
    //        get{
    //            return [.pizza, .taco, .burger, .sandwich, .spaghetti]
    //        }
    //    }
}

for food in Food.allCases{
    dump(food)
}


/*:
 - note: The compiler will *not* synthesize `CaseIterable` conformance if your `enum` has any `case`s with associated values or `case`s marked as unavailalbe, and you'll have to write the conformance yourself like you used to 😕
 
 [Home](Intro)    [Next Feature >](@next)
*/
