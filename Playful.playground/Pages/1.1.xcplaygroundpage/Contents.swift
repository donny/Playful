//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Implement an algorithm to determine if a string has all unique characters

func isUniqueCharacters(input: String) -> Bool {
  let charSetLength = 128 // Assume it's ASCII (128 characters)

  var charData: Array<Bool> = Array(repeatElement(false, count: charSetLength))

  for char in input {
    if let charValue = UnicodeScalar(String(char))?.value {
      let index = Int(charValue)
      if charData[index] == true {
        return false
      }
      charData[index] = true
    } else {
      return false
    }
  }

  return true
}

let result = isUniqueCharacters(input: "abc")
print(result)

/*
 The runtime complexity is O(n), the length of the input while the space complexity is O(1), the space occupied by the ASCII character array.
 We could probably do better by using a bitmap array.
 If we don't want to use any data structure at all, we could compare each character with the rest of the characters. The runtime complexity becomes O(n^2).
 Or, we could sort the characters O(n log n) and we detect the neighbouring characters.
 */

//: [Next](@next)
