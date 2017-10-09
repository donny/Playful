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
  var output = input

  for i in 0..<(matrixCount-1) {
    // Swap 0,i with the rightmost column j,(matrixCount-1)
    (output[0][i], output[i][matrixCount-1]) = (output[i][matrixCount-1], output[0][i])
  }

  print(output)

  return input
}

if let result = rotateMatrix(input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]) {
  print(result)
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
 */

//: [Next](@next)
