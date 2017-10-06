//: [Previous](@previous)

import Foundation

/* Question:
 One Away: There are three types of edits that can be performed on strings: insert a character, remove a character and replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
 Example:
 pale, ple -> true
 pales, pale -> true
 pale, bale -> true
 pale, bake -> false
 */

func oneAway(input1: String, input2: String) -> Bool {
  let count1 = input1.count
  let count2 = input2.count
  let maxCount = max(count1, count2)
  var oneEditAlready = false

  var count1Offset = 0
  var count2Offset = 0

  if abs(count1 - count2) > 1 { return false }

  for i in 0..<maxCount {
    let input1Index = input1.index(input1.startIndex, offsetBy: i + count1Offset)
    let input2Index = input2.index(input2.startIndex, offsetBy: i + count2Offset)

    if input1Index >= input1.endIndex || input2Index >= input2.endIndex {
      if oneEditAlready { return false }
      oneEditAlready = true
      continue
    }

    let input1Char = input1[input1Index]
    let input2Char = input2[input2Index]

    if input1Char == input2Char { continue }

    // The characters are different.
    if oneEditAlready { return false }
    oneEditAlready = true

    if count1 == count2 {
      continue
    } else if count1 > count2 {
      count2Offset = -1
    } else if count1 < count2 {
      count1Offset = -1
    }
  }

  return true
}

print(oneAway(input1: "pale", input2: "ple"))
print(oneAway(input1: "pales", input2: "pale"))
print(oneAway(input1: "pale", input2: "bale"))
print(oneAway(input1: "pale", input2: "bake"))

/* Discussion:
 The runtime complexity is O(n). I'm not happy with this solution. It seems very convoluted.
 */

//: [Next](@next)

