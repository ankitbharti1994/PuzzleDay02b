import Foundation

public struct Utility {
    
    /// convert the string to array of array of Int, check the input in README.md file
    ///
    /// - Parameter inputString: pass the multiline string in row & column style
    /// - Returns: return the array of array of int
    public static func convertStringToArrayOfInt(_ inputString: String) -> [[Int]] {
        
        let arrayOfString = inputString.components(separatedBy: "\n")
            .map { $0.components(separatedBy: " ")
                .filter { !$0.isEmpty} }
        
        var arrayOfArrayInt = [[Int]]()
        
        for stringValue in arrayOfString {
            var arrayOfInt = [Int]()
            for character in stringValue {
                arrayOfInt.append(Int("\(character)")!)
            }
            arrayOfArrayInt.append(arrayOfInt)
        }
        
        return arrayOfArrayInt
    }
    
    
    /// The goal is to find the only two numbers in each row where one evenly divides the other - that is, where the result of the division operation is a whole number. They would like you to find those numbers on each line, divide them, and add up each line's result.
    ///
    /// - Parameter input: pass the input parameter as array of array of int
    /// - Returns: return the final result as Int
    public static func sumOfEvenlyDividedNumbersInSpreadsheet(input: [[Int]]) -> Int {
        
        func findDividened(inputValue: [Int]) -> Int {
            let result = inputValue.map { (number) in
                inputValue.filter {
                    return $0 % number == 0
                }
                }.filter {
                    return $0.count == 2
            }
            
            guard let firstMatch = result.first else { return 0 }
            
            guard let maxValue = firstMatch.max(), let minValue = firstMatch.min(), minValue > 0 else {
                return 0
            }
            return maxValue / minValue
        }
        
        let result = input.map {
            findDividened(inputValue: $0)
        }
        
        let finalResult = result.reduce(0) {
            return $0 + $1
        }
        
        return finalResult
    }
}
