//
//  StringCalculatorViewModel.swift
//  StringCalculator
//
//  Created by Akshay Sonawane on 28/06/25.
//

import Foundation

class StringCalculatorViewModel {
    
    //    MARK:- Variable Declaration
    private let stringCalculator: StringCalculator
    var onResult: ((String) -> Void)?
    var onError: ((String) -> Void)?
    
    init(stringCalculator: StringCalculator = StringCalculator()) {
        self.stringCalculator = stringCalculator
    }
    
    //    Function to Calculate String Input
    func calculate(_ input: String)  {
        do {
            let sum = try stringCalculator.add(input)
            onResult?("\(sum)")
            onError?("")
        } catch {
            onResult?("")
            onError?("\(error.localizedDescription)")
        }
    }
}

// String Calculation Logic with negative number errors
class StringCalculator {
    
    //    function to add string numbers and give result or error
    func add(_ numbers: String) throws -> Int {
        
        var input = numbers
        var delimiters = [",", "\n"]
        var sum = 0
        var negativeNumbers: [Int] = []
        
        //        Empty String return 0
        if numbers.isEmpty {
            return 0
        } else {
            //            Handle custom delimiter formats: eg:- //\n1;2
            if input.hasPrefix(("//")) {
                let parts = input.components(separatedBy: "\n")
                if parts.count > 1 {
                    let delimiter = parts[0].dropFirst(2)
                    delimiters.append(String(delimiter)) // added given delimiters
                    input = parts[1]
                }
            }
            //            Saparate the numbers with the given delimiters
            let components = input.components(separatedBy: CharacterSet(charactersIn: delimiters.joined()))
            
            //            Add negative values to the array if availabe
            for number in components {
                if let intValue = Int(number) {
                    if intValue < 0 {
                        negativeNumbers.append(intValue)
                    }
                    sum += intValue
                }
            }
            //            Throw Error for negative numbers
            if !negativeNumbers.isEmpty {
                throw NSError(domain: "Invalid Input", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Negative numbers not allowed: \(negativeNumbers.map { String($0)}.joined(separator: ","))"])
            }
            return sum
        }
    }
}
