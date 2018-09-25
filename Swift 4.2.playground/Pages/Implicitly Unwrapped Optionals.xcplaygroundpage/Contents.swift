/*:
 # Implicitly Unwrapped Optionals

 In Swift 4.1, you could declare an implicitly-unwrapped optional as a type for a constant/variable. In fact, it had its own type: `ImplicitlyUnwrappedOptional<Wrapped>`. In Swift 4.2, said type is declared like this:
*/

@available(*, unavailable)
typealias ImplicitlyUnwrappedOptional<Wrapped> = Optional<Wrapped>

//: That is to say that they don't actually exist anymore. You can still declare an implicitly unwrapped `Optional` as a type, like this:

var postCount: Int! = 0

//: However, if we check the actual type of the variable, we will see that it's an `Optional<Int>` instead of the old `ImplicitlyUnwrappedOptional<Int>`

type(of: postCount)

/*:
 It still behaves like an `ImplicitlyUnwrappedOptional`, too, in that you can assign it `nil` and your program will crash if you read it while it's `nil`. Nowadays, the compiler generates it as `Optional<Wrapped>`, but internally flags it as being allowed to be automatically implicitly unwrapped. This is still useful for things like `@IBOutlet`s and other cases where you know it'll never be `nil` when you read it, but it can make it easy to opt-out of Swift's `nil` safety accidentally. Interface Builder will still generate your `@IBOutlet`s as implicitly-unwrapped `Optional`s, but if you look closely at [Xcode 10's screenshots in the Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835?mt=12), you can see that Apple has actually changed them to regular `Optional`s in their code

 ![Xcode 10 Screenshot](Xcode.png "Apple declares their @IBOutlets as normal Optionals")

 [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
*/
