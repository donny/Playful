//: [Previous](@previous)

import Foundation

/* Question:
 String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2b1c5a3. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a-z).
 */

func stringCompression(input: String) -> String {
  let charArray = Array(input)
  var result = ""
  var currentChar = Character("_")
  var currentCount = 0

  for char in charArray {
    if char == currentChar {
      currentCount += 1
      continue
    } else {
      if currentCount != 0 { // Ignore the "sentinel" initial character.
        result.append(currentChar)
        result.append(String(currentCount))
      }
      currentChar = char
      currentCount = 1
    }
  }
  // Need to take care of the characters at the end of the string.
  result.append(currentChar)
  result.append(String(currentCount))

  if result.count < input.count {
    return result
  } else {
    return input
  }
}

var result = stringCompression(input: "aabcccccaaa")
print(result)
result = stringCompression(input: "abcde")
print(result)

/* Discussion:
 The runtime complexity is O(n).
 */

//: [Next](@next)
