//: [Previous](@previous)

import Foundation

/* Question:
 Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
 */

func zeroMatrix(input: [[Int]]) -> [[Int]]? {
  // Check the size for correctness.
  let rowCount = input.count
  var colCount: Int?
  for i in input {
    if let count = colCount {
      if i.count != count { return nil }
    } else {
      colCount = i.count
    }
  }
  var output = input

  for i in 0..<rowCount {
    for j in 0..<colCount! {
      if input[i][j] == 0 {
        for ix in 0..<rowCount {
          output[ix][j] = 0
        }
        for jx in 0..<colCount! {
          output[i][jx] = 0
        }
      }
    }
  }

  return output
}

func printMatrix(_ input: [[Int]]) -> Void {
  for i in input {
    print(i)
  }
}

var input = [[1, 2, 3], [4, 5, 6]]
printMatrix(input)
print("--")
if let result = zeroMatrix(input: input) {
  printMatrix(result)
} else {
  print("Error")
}

print("------")

input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
printMatrix(input)
print("--")
if let result = zeroMatrix(input: input) {
  printMatrix(result)
} else {
  print("Error")
}

print("------")

input = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
printMatrix(input)
print("--")
if let result = zeroMatrix(input: input) {
  printMatrix(result)
} else {
  print("Error")
}

/* Discussion:
 Runtime complexity is O(M x N) for the best case scenario where there is no zero. Otherwise, it's O(M x N x (M+N)) when all of them is zero.
 */

//: [Next](@next)
