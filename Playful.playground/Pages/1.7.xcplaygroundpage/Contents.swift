//: [Previous](@previous)

import Foundation

/* Question:
 Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
 */

func test() -> Bool {
  return true
}

let result = test()
print(result)

/* Discussion:
 ...


 Inner edge:
 ab -> ba -> da -> ca
 cd    cd    cb    db

 Outer edge:
 (1)     (2)     (3)     (4)
 abcd -> dhla -> pona -> miea
 efgh    efgb    efgb    nfgb
 ijkl    ijkc    ijkc    ojkc
 mnop    mnop    mlhd    plhd

 */

//: [Next](@next)
