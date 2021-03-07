import UIKit
//var n = 50
//var time = 600
//    for i in 1...(n+2) {
//        time = time + (10 * i)
//        for _ in stride(from: i, to: n, by: 1) {
//            time = time + (20 * i)
//        }
//    }
//    print("resul : \(10 * (n * n * n) + 65 * (n * n) + 135 * n + 690)")
//    print("time : \(time)")
//
/*
 Input: nums =
         [3,1,2,10,1]
         [1,1,2,3,10]
 Output: [3,4,6,16,17]
 */
//LeetCode

//let nums = [1, 2, 3, 4]
//let nums = [1, 1, 1, 1]
//let nums = [3,1,2,10,1]
//var resultArray = [Int]()
//
//func runningSum(_ nums: [Int]) -> [Int] {
//    var tempsum = 0
//    for i in 0..<nums.count {
//
//        resultArray.append((tempsum + nums[i]))
//        tempsum += nums[i]
//    }
//    print("resultArray : \(resultArray)")
//    return resultArray
//}
//runningSum(nums)

/*
Example 1:

Input: nums = [2,5,1,3,4,7], n = 3
Output: [2,3,5,4,1,7]
Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
Example 2:

Input: nums = [1,2,3,4,4,3,2,1], n = 4
Output: [1,4,2,3,3,2,4,1]
Example 3:

Input: nums = [1,1,2,2], n = 2
Output: [1,2,1,2]
*/

//let nums = [2,5,1,3,4,7]
let nums = [1,2,3,4,4,3,2,1]
//let nums = [1,1,2,2]
func SpiltToArray(_ nums : [Int]) -> [Int]{
    var resultArray = Array<Int>()
    let divide = nums.count / 2
    for i in 0...2 {
        resultArray.append(nums[i])
        resultArray.append(nums[i + divide])
    }
    print("resultArray : \(resultArray)")
    return resultArray
}
SpiltToArray(nums)


