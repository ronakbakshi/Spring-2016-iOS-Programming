
/**
@author: S524975
**/

import UIKit

//Question 0
func numEvens(values:[Int]) -> Int { //function to count number of even numbers in an array
    var count:Int = 0
    for value in values {
        if value % 2 == 0 { // logic for checking if number is even or not
            count++
        }
    }
        return count
}

print("The number of even numbers are: \(numEvens([]))")
print("The number of even numbers are: \(numEvens([15,18,22]))")
print("The number of even numbers are: \(numEvens([15,28, numEvens([15,28])]))")

//Question 1

func inOrder(inout num1:Int,inout num2:Int,inout num3:Int) { // function for sorting 3 numbers in ascending order
    var temp:Int
    if num1 < num2 {
        if num1 < num3 {
            if num2 > num3 {
                temp = num2
                num2 = num3
                num3 = temp
            }
        }
    }
    if num2 < num1 {
        if num2 < num3 {
            if num1 < num3 {
                temp = num1
                num1 = num2
                num2 = temp
            }
            else{
                temp = num1
                num1 = num2
                num2 = num3
                num3 = temp
            }
        }
    }
    if num3 < num1 {
        if num3 < num2 {
            if num1 < num2 {
                temp = num1
                num1 = num3
                num3 = num2
                num2 = temp
            }
            else{
                temp = num1
                num1 = num3
                num3 = temp
            }
        }
    }
}

var num1:Int = 1
var num2:Int = 0
var num3:Int = -1
inOrder(&num1,num2:&num2,num3:&num3)
print("num1:\(num1)  num2: \(num2)  num3:\(num3)")

//Question 2
func arraySum(arr1:[Int],arr2:[Int]) -> [Int]!{ // function for returning the sum of each value in 2 arrays in another array
    if arr1.count != arr2.count {
        return nil
    }
    else {
        var sum:[Int] = []
        for var i:Int=0; i<arr1.count; i++ {
            sum.append(arr1[i] + arr2[i])
            
        }
     return sum
    }
}

var x:[Int] = [15, 25]
var y:[Int] = [10, -3]
arraySum(x,arr2: y)
print("The resultant array is: \(arraySum(x,arr2: y))")

var a:[Int] = [0,3,5]
var b:[Int] = [3,2,0]
arraySum(a,arr2: b)
print("The resultant array is: \(arraySum(a,arr2: b))")



//Question 3
func findMissingInts(nums:Int ...) { //Function to print the missing numbers in array
    var missingNum:[Int] = []
    var min:Int
    var max:Int
    for var k:Int = 1; k < nums.count; k++ {
        if nums[k] - nums[k-1] > 1 {
            min = nums[k-1]
            max = nums[k]
            while min < max-1{
                missingNum.append(min+1)
                min++
            }
        }
    }
    var str:String=""
    for var i:Int=0; i < missingNum.count-1; i++ { // storing in a string
        str+=("\(missingNum[i]),")
    }
    str += ("\(missingNum[missingNum.count-1])")// storing the last value of array missingNum
    print(str)
}


findMissingInts(10,15)
findMissingInts(1,3,8,9,12)
findMissingInts(1,3,4,5,10)
findMissingInts(1,2,3,8)


