//: [Previous](@previous)

import Foundation

/* Question:
 Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
 Example:
 Input: Tact Coa
 Output: True (permutations: "taco cat", "atco cta", etc.)
 */

func palindromePermutation(input: String) -> Bool {
  let charArray = Array(input.lowercased().replacingOccurrences(of: " ", with: ""))
  var charDict: Dictionary<Character, Bool> = [:]
  // The charDict value is true if we have encountered the character odd-numbered times.
  // The charDict value is false if we have encountered the character even-numbered times.

  // Store the number of each character in the string.
  for char in charArray {
    if let value = charDict[char] {
      charDict[char] = !value
    } else {
      charDict[char] = true // First time that we encounter the character.
    }
  }

  // Check the number of each character.
  let newDict = charDict.filter { (char, isOdd) -> Bool in return isOdd }

  return (newDict.count == 1 || newDict.count == 0)
}

let result = palindromePermutation(input: "Tact Coa")
print(result)

/* Discussion:
 A palindrome can have at most one character that is odd-numbered in total. This algorithm maintains a lookup table and parses the character one by one.
 The runtime complexity is O(n).
 */

//: [Next](@next)

