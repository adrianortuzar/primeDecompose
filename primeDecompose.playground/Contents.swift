//: Playground - noun: a place where people can play

import UIKit


func decompose(_ number: Int) -> String {
    
    var tmpNumber = number
    var result = ""
    var total = 1
    
    
    for primeCandidate in 2...tmpNumber {
        
        var power = 0
        while tmpNumber % primeCandidate == 0 {
            
            tmpNumber /= primeCandidate
            
            power += 1
        }
        
        if (power != 0) {
            
            result += "(" + String(primeCandidate)
            result += power > 1 ? "**"+String(power):""
            result += ")"
            
            total = {
                return total * Int(pow(Double(primeCandidate), Double(power)))
            }()
            
            if total == number {
                break
            }
        }
    }
    return result
}

decompose(86240)
