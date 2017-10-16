//: [Previous](@previous)

import Foundation

/* Question:
 Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
 */

func rotateMatrix(input: [[Int]]) -> [[Int]]? {
  // Check to ensure that it's an NxN matrix.
  var matrixCount = input.count
  for row in input {
    if row.count != matrixCount {
      return nil
    }
  }
  if matrixCount == 0 || matrixCount == 1 { return input }

  var output = input
  let lastIndex = matrixCount-1

  // With the way the algorithm works, we need to exclude the last index (i.e. 0..<lastIndex).

  // Swap the top row with the rightmost column
  for i in 0..<lastIndex {
    (output[0][i], output[i][lastIndex]) = (output[i][lastIndex], output[0][i])
  }

  // Swap the top row with the bottom row
  for i in 0..<lastIndex {
    (output[0][i], output[lastIndex][lastIndex-i]) = (output[lastIndex][lastIndex-i], output[0][i])
  }

  // Swap the top row with the leftmost column
  for i in 0..<lastIndex {
    (output[0][i], output[lastIndex-i][0]) = (output[lastIndex-i][0], output[0][i])
  }

//  print(output)

  // Build the inner matrix
  var innerMatrix: [[Int]] = Array(repeatElement(Array(repeatElement(0, count: matrixCount-2)), count: matrixCount-2))
  for i in 1..<lastIndex {
    for j in 1..<lastIndex {
      innerMatrix[i-1][j-1] = input[i][j]
    }
  }
  if let innerResult = rotateMatrix(input: innerMatrix) {
//    print(innerResult)
    innerMatrix = innerResult
  }

  // Combine the result into output
  for i in 1..<lastIndex {
    for j in 1..<lastIndex {
      output[i][j] = innerMatrix[i-1][j-1]
    }
  }

  return output
}

func printMatrix(_ input: [[Int]]) -> Void {
  for i in input {
    print(i)
  }
}

if let result = rotateMatrix(input: [[1, 2], [3, 4]]) {
  printMatrix(result)
} else {
  print("Error")
}

if let result = rotateMatrix(input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]) {
  printMatrix(result)
} else {
  print("Error")
}

if let result = rotateMatrix(input: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]) {
  printMatrix(result)
} else {
  print("Error")
}

/* Discussion:
 We could start by looking at a few small examples below:

 Inner edge:
 ab -> ba -> da -> ca
 cd    cd    cb    db

 Outer edge:
 (1)     (2)     (3)     (4)
 abcd -> dhla -> pona -> miea
 efgh    efgb    efgb    nfgb
 ijkl    ijkc    ijkc    ojkc
 mnop    mnop    mlhd    plhd

 And, it can be done in place:

 (1)    (2)    (3)    (4)
 abc -> cfa -> ih. -> gd.
 def    ..b    ...    h..
 ghi    ...    .fc    i..

 We just need to:
 - swap the top row with the rightmost column
 - swap the top row with the bottom row
 - swap the top row with the leftmost column
 (and do it for the inner (N-1)x(N-1) matrix)

 We assume that the input is an array of array of characters / numbers.

 The runtime complexity for the multiple "for loops" is O(4N) and then we recurse to N-1, N-2, etc.
 Thus, in total the runtime complexity is O( 4 (N * N+1 / 2)), maybe O(N log N)

 But apparently, the algorithm is O(N^2) since any algorithm must touch all N^2 elements.
 */

//: [Next](@next)
