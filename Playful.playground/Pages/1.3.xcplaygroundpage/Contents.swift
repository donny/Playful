//: [Previous](@previous)

import Foundation

/* Question:
 URLify: Write a method to replace all spaces in a string with '%20'. You may assume that the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of string. (Note: If implementing in Java, please use a character array so that you can perform this operation in place.)
 Example:
 Input:  "Mr John Smith    ", 13
 Output: "Mr%20John%20Smith"
 */

func urlify(input: inout String, length: Int) -> String {
  var charArray = Array(input)
  var indexOffset = 0

  for (index, char) in charArray.prefix(length).enumerated() {
    if char == " " {
      let realIndex = index + indexOffset
      charArray[realIndex] = "%"
      charArray.insert("2", at: realIndex.advanced(by: 1))
      charArray.insert("0", at: realIndex.advanced(by: 2))
      indexOffset += 2
    }
  }

  input = String(charArray).trimmingCharacters(in: [" "])

  return input
}

var input = "Mr John Smith    "
let result = urlify(input: &input, length: 13)
print(result)
print(result.count)

/* Discussion:
 Given that it says that the string has sufficient space, I guess it means that we need to perform the replacement in place.
 Runtime complexity is O(n) and no additional space is required. The trick is to keep indexOffset since we are performing the replacement in place whilst the index given by enumerated() refers to the space (" ") index in the old string before replacement.
 */

//: [Next](@next)

