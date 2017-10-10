//: [Previous](@previous)

import Foundation

/* Question:
 Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
 */

func zeroMatrix(input: [[Int]]) -> [[Int]]? {
  // Check the size for correctness.
  var matrixCount: Int?
  for i in input {
    if let count = matrixCount {
      if i.count != count { return nil }
    } else {
      matrixCount = i.count
    }
  }

  return input
}

func printMatrix(_ input: [[Int]]) -> Void {
  for i in input {
    print(i)
  }
}

if let result = zeroMatrix(input: [[1, 2], [3, 4]]) {
  printMatrix(result)
} else {
  print("Error")
}

if let result = zeroMatrix(input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]) {
  printMatrix(result)
} else {
  print("Error")
}

if let result = zeroMatrix(input: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]) {
  printMatrix(result)
} else {
  print("Error")
}
/* Discussion:
 ...
 */

//: [Next](@next)
