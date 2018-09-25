/*:
 # Floating-Point Number Conversion to String

 In Swift 4.1 and earlier, when converting a floating-point number to a `String` via the `description` or `debugDescription` properties, the algorithm to generate the `String` always returned a fixed number of digits. This would lead to situations where you'd get a large number of unnecessary digits after the decimal place, but given that the limit on `Double` was 15 digits for the `description` and 17 for the `debugDescription`, this lead to the more pressing issue of the possiblity of the `String` representation not being as accurate as the `Double` representation. In such a case, if you converted the `Double` to a `String`, converted the `String` back to a `Double`, and compared the new `Double` to the original `Double`, the comparison would result in `false`, despite only doing some type juggling.

 In Swift 4.2, the algorithm to convert a floating-point number to a `String` has been updated to require only the precision necessary to accurately represent the entire number. For example, if we have a number with a relatively short fractional part, it won't generate a `String` with several unnecessary trailing zeros
*/

let short = 123.4
short.description

//: However, if we have a very long number, the resulting `String` will contain the *entire* number and not be cut off

let long = 123.4567891011121314
long.description

//: [< Last Feature](@previous)    [Home](Intro)    [Next Feature >](@next)
