//: [Previous](@previous)

import Foundation

/* Question:
 Check Permutation: Given two string, write a method to decide if one is a permutation of the other.
 */

// We could use the `sorted()` method on a string, but let's build our own string sort function.

func sort(input: [Character]) -> [Character] {
  guard let sentinel = input.first else { return input }
  let restInput = input.suffix(from: 1)

  var lessThan: Array<Character> = []
  var greaterThanEqual: Array<Character> = []

  for char in restInput {
    if char < sentinel {
      lessThan.append(char)
    } else {
      greaterThanEqual.append(char)
    }
  }

  var results: Array<Character> = []
  results += sort(input: lessThan)
  results.append(sentinel)
  results += sort(input: greaterThanEqual)

  return results
}

let sortTest = sort(input: Array("dcbea"))
print(sortTest)



func checkPermutation(input1: String, input2: String) -> Bool {
  //return input1.sorted() == input2.sorted()
  return sort(input: Array(input1)) == sort(input: Array(input2))
}

let result = checkPermutation(input1: "abc", input2: "cba")
print(result)

/* Discussion:
 The easiest way is to sort the input strings (characters) and compare them. In other words, we just check for the distinct characters and the numbers of each character. And disregarding the order.
 The runtime complexity is O(n log n) for sorting one input string and O(n) for comparing those 2 strings (we need to iterate the characters in the string).
 */

//: [Next](@next)
