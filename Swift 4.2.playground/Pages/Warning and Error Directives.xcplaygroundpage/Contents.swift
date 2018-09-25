/*:
 # Custom Compiler Warnings & Errors

 In Objective-C, you can define your own compiler warnings and errors with the `#warning` and `#error` preprocessor directives, respectively. This wasn't possible in Swift, though, unless you defined your own build script that scanned your source code for a comment formatted in a particular way you could define, and it was just a pain and a mess. Swift 4.2 introduces Objective-C-style compiler directives for these, however, so now it's just as easy to do in Swift
*/

func someFunction() -> Void{
    #warning("This hasn't been implemented yet")
}
#error("This is a critical problem")

/*:
 - note: These are still *preprocessor* directives, and don't get triggered by the flow of your actual code. You can still conditionally trigger them with preprocessor conditionals, though

 [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
*/
