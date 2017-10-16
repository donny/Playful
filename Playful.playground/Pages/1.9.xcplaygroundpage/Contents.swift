//: [Previous](@previous)

import Foundation

/* Question:
 String Rotation: Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only once call to isSubstring (e.g., "waterbottle" is a rotation of "erbottlewat").
 */

func stringRotation(input1: String, input2: String) -> Bool {
  let combined = input1 + input1
  return combined.contains(input2)
}

let result = stringRotation(input1: "erbottlewat", input2: "waterbottle")
print(result)

/* Discussion:
 Because it's a rotation, we could just combine input1 with itself, and check for the presence of input2.
 The runtime is O(N).
 */

//: [Next](@next)
