//
//  DataStructers.swift
//  iOSInterviewPreparation
//
//  Created by apple on 27/04/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

class DataStructers{
    
    class func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            // If we get here, then the search key is not present in the array.
            return nil
            
        } else {
            // Calculate where to split the array.
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            
            // Is the search key in the left half?
            if a[midIndex] > key {
                return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
                
                // Is the search key in the right half?
            } else if a[midIndex] < key {
                return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
                
                // If we get here, then we've found the search key!
            } else {
                return midIndex
            }
        }
        
        /*var lowerBound = 0
         var upperBound = a.count
         while lowerBound < upperBound {
         let midIndex = lowerBound + (upperBound - lowerBound) / 2
         if a[midIndex] == key {
         return midIndex
         } else if a[midIndex] < key {
         lowerBound = midIndex + 1
         } else {
         upperBound = midIndex
         }
         }
         return nil*/
    }
    class func getSmallAndGreatestNumber() -> Void {
        
        let numbers = [145, 206, 116, 809, 540, 176]
        var i = 0
        var largest = numbers[0]
        var small = numbers[0]
        while i < numbers.count{
            
            if (numbers[i] > largest) {
                largest = numbers[i]
            }
            if (numbers[i] < small) {
                small = numbers[i]
            }
            i = i + 1
        }
        print("Maximum Number ====================\(largest)")// 809
        print("Minimum Number ====================\(small)")// 116
    }
    
    class func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        var temp: Character
        var dict: Dictionary<Character, Character> = Dictionary()
        dict["]"] = "["
        dict[")"] = "("
        dict["}"] = "{"
        for i in 0..<s.characters.count {
            temp = s[i]
            if temp == ")" || temp == "}" || temp == "]" {
                if stack.count == 0 || stack.last != dict[temp] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append(temp)
            }
        }
        if stack.count == 0 {
            return true
        } else {
            return false
        }
    }
    class func bubbleSort(){
        let array = [5,3,4,6,8,2,9,1,7,10,11]
        let sortedArray = NSMutableArray(array: array)
        var sortedAboveIndex = array.count
        
        repeat {
            var lastSwapIndex = 0
            
            for i in 1..<sortedAboveIndex {
                if (sortedArray[i - 1] as! Int) > (sortedArray[i] as! Int) {
                    sortedArray.exchangeObject(at: i, withObjectAt: i-1)
                    lastSwapIndex = i
                }
            }
            
            sortedAboveIndex = lastSwapIndex
            
        } while (sortedAboveIndex != 0)
        
        // [5, 3, 4, 6, 8, 2, 9, 1, 7, 10, 11]
        print(array)
        
        // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    }
    class func getIndices(array:[Int], targetValue:Int) -> [Int]?{
        var indices:[Int]!
        var map:[Int:Int] = [Int:Int]()
        for value in array {
            let index = array.index(of: value)
            let substractionResult = targetValue - value
            if  map.keys.contains(substractionResult){
                indices = [Int]()
                indices.append(map[substractionResult]!)
                indices.append(index!)
                return indices
            }
            //Value is saved as Key
            map[value] = index
        }
        return indices
    }
    
    class func getAllSubsets(array:[Int], targetValue:Int) -> [Int]{
        var indices:[Int]  = [Int]()
        var map:[Int:Int] = [Int:Int]()
        for value in array {
            let index = array.index(of: value)
            let substractionResult = targetValue - value
            if  map.keys.contains(substractionResult){
                indices.append(map[substractionResult]!)
                indices.append(index!)
                continue
            }
            //Value is saved as Key
            map[value] = index
        }
        return indices
    }
    class func getSingleNumberFromSortedArray(array:[Int]) -> Int{
        var lo = 0, hi = array.count/2
        while lo < hi {
            let m = (lo + hi) / 2;
            if array[2*m] != array[2*m+1]{
                hi = m
            }else{
                lo = m + 1
            }
        }
        return array[2*lo];
        
    }
    class func findAnItemFromSortedArray(array:[Int], targetValue:Int) -> Int{
        
        var lowerIndex = 0;
        var upperIndex = array.count - 1
        
        while (true) {
            let currentIndex = (lowerIndex + upperIndex)/2
            if(array[currentIndex] == targetValue) {
                return currentIndex
            } else if (lowerIndex > upperIndex) {
                return array.count
            } else {
                if (array[currentIndex] > targetValue) {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }
    class func checkForAnagram(firstString: String, secondString: String) -> Bool {
        
        let lowerCasedFirstString = firstString.lowercased()
        let lowerCasedSecondString = secondString.lowercased()
        
        if lowerCasedFirstString.characters.count != lowerCasedSecondString.characters.count {
            return false
        } else {
            for character in lowerCasedFirstString.characters {
                if lowerCasedSecondString.characters.contains(character){
                    return true
                } else {
                    return false
                }
            }
            return false
        }
    }
    class func stringIsAnagram(string1: String, string2 : String) -> Bool {
        
        func countedSet(string: String) -> NSCountedSet {
            let array = string.characters.map { (character) -> String in
                return String(character)
            }
            return NSCountedSet(array: array)
        }
        return countedSet(string: string1).isEqual(countedSet(string: string2))
    }
    class func polynodryme(number:Int) -> Bool{
        var palindromeX: Int = 0
        var tmp: Int = number
        while tmp > 0 {
            if palindromeX >= Int.max / 10 {
                return false
            }
            palindromeX = palindromeX * 10 + tmp % 10
            tmp = tmp / 10
        }
        return palindromeX == number
    }
    class func getUniqueCharatersLength(inputString:String) -> Int{
        var newString = ""
        for character in inputString.characters{
            
            if !newString.contains("\(character)") {
                newString = newString + "\(character)"
            }
        }
        print(newString)
        return newString.characters.count
    }

}
