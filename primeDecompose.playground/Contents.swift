//: Playground - noun: a place where people can play

import UIKit


var lastPrime:Int = 1

func primeGenerator () -> Int {
    
    var isPrime = false
    
    while isPrime == false {
        
        lastPrime = lastPrime + 1
        
        for n:Int in 2...lastPrime {
            
            let module = lastPrime % n
            
            if module == 0 && n == lastPrime {
                isPrime = true
                break
            }
            else if module == 0 {
                break
            }
        }
    }
    
    return lastPrime
}


func usedPrimes(_ number:Int) -> [Int]{
    if number < 0 {
        return []
    }
    
    var prime:Int = primeGenerator()
    var module = 1
    var returnArr = [Int]()
    
    while prime <= number {
        
        module = number % prime
        
        if module == 0 {
            returnArr.append(prime)
        }
        
        prime = primeGenerator()
    }
    
    return returnArr
}

func decompose(_ number:Int) -> [Int:Int]{
    
    var returnDic = [Int:Int]()
    
    usedPrimes(number).forEach { prime in
        
        returnDic[prime] = 1
        
        var whileIs = true
        
        var power = 1
        
        while whileIs {
    
            let po:Double = pow(Double(prime), Double(power))
            let module = Double(number).truncatingRemainder(dividingBy:po)
            
            
            if module == 0 {
                returnDic[prime] = power
            }
            else {
                whileIs = false
            }
            
            power = power + 1
        }
    }
    
    return returnDic
}

decompose(2)

