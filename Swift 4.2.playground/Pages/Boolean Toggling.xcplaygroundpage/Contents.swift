/*:
 # Boolean Toggling

 ---

 ## The Old Way

 Prior to Swift 4.2, toggling a `Bool` was still super simple, though it was arguably less clear and easy to miss, and could potentially be confused by beginners for a strange form of `Optional`-unwrapping
*/

!true
!false

/*:
 ---

 ## The New Way

 Swift 4.2 makes this a bit clearer by defining a dedicated `toggle` method
*/

var yes = true
yes.toggle()

//: [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
