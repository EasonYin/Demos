//
//  Solution.swift
//  leetCodeDemo
//
//  Created by 尹华东 on 2019/4/23.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

import Foundation

public class ListNode{
    public var val:Int?
    public var next: ListNode?
    public init(val:Int? = nil){
        self.val = val
        self.next = nil
    }
    
    func initListNodeWithArray(array:[Int]) -> ListNode {
        
        let node = ListNode(val: array[0])
        
        for i in (1..<array.count).reversed() {
            let tempNode = ListNode(val: array[i])
            tempNode.next = node.next
            node.next = tempNode
        }
        
        return node
    }
}

class Solution: NSObject {
    
    //1
    func twoSum(nums:[Int],target:Int) -> [Int] {
        
        /*
        var index1 = 0
        var index2 = 0

        for i in 0..<nums.count {
            for j in i+1..<nums.count{
                if nums[i]+nums[j] == target {
                    index1 = i
                    index2 = j

                }
            }
        }
        return [index1,index2]
        */
        
        var dict = [Int:Int]()
        for i in 0..<nums.count {
            if let indexFound = dict[target - nums[i]]{
                return [indexFound,i]
            }
            dict[nums[i]] = i
        }
        print("No vaild result found")
        return []
        
    }
    
    //2
    func addTwoNumbers(l1:ListNode?, l2:ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var headNode: ListNode?
        var nextNode: ListNode?
        var carry: Int = 0
        while node1 != nil || node2 != nil {
            let node1val = node1?.val ?? 0
            let node2val = node2?.val ?? 0
            node1 = node1?.next
            node2 = node2?.next
            var sum = node1val + node2val + carry
            carry = sum < 10 ? 0 : 1
            sum = sum % 10
            if nextNode == nil {
                nextNode = ListNode.init(val: sum)
                headNode = nextNode
            } else {
                nextNode?.next = ListNode.init(val: sum)
                nextNode = nextNode?.next
            }
        }
        if carry != 0 {
            nextNode?.next = ListNode.init(val: carry)
        }
        return headNode
    }
    
    //3
    func lengthOfLongestSubstring(s:String) -> Int {
        
        var returnCount = 0
        var tempDic = [Character:Int]()
        var leftIndex = 0
        let chars = Array(s)
        
        for rightIndex in 0..<chars.count {
            let tempOneString = chars[rightIndex]
            if let tempI = tempDic[tempOneString]{
                if tempI >= leftIndex{
                    leftIndex = tempI + 1
                }
            }
            tempDic[tempOneString] = rightIndex
            returnCount = max(rightIndex - leftIndex + 1, returnCount)
        }
        
        return returnCount

    }
    
    //4
    func findMedianSortedArrays(nums1:[Int],nums2:[Int]) -> Double {
        
        return 0
    }
    
    //26
    func removeDuplicates(nums:inout[Int]) -> Int {
        if nums.count == 0{
            return 0
        }
        
        var number = 0
         for i in 0..<nums.count {
            if nums[i] != nums[number]{
                number += 1
                nums[number] = nums[i]
            }
        }
        number += 1
        return number
    }
    
    
    
    
    
    
}
