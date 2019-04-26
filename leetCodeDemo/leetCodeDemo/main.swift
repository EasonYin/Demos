//
//  main.swift
//  LeetCodeDemo
//
//  Created by 尹华东 on 2019/4/23.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

import Foundation

print("Hello, World!")

let solution = Solution()

//1
print("1=======")
print(solution.twoSum(nums: [1,2,5,5,11], target: 6))

//2
print("2=======")
let tempL1 = ListNode().initListNodeWithArray(array: [2,4,3])
let tempL2 = ListNode().initListNodeWithArray(array: [5,6,4])
let addTwoNumbers = solution.addTwoNumbers(l1: tempL1, l2: tempL2)
print(addTwoNumbers?.val as Any)

//3
print("3=======")
print(solution.lengthOfLongestSubstring(s: "abcabcdd"))

//26
print("26=======")
var duplicatesArray = [1,1,2,2,3,3]
print(solution.removeDuplicates(nums: &duplicatesArray))
