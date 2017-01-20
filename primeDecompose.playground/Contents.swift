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


func primePower(number:Int, prime:Int) -> Int {
    
    let module = number % prime
    
    if module == 0 {
        var power = 0
        var returnPower:Int = 1
        var module:Double = 0
        
        while module == 0 {
            
            module = {
                let po:Double = pow(Double(prime), Double(power))
                return Double(number).truncatingRemainder(dividingBy:po)
            }()
            
            if module == 0 {
                returnPower = power
            }
            
            power = power + 1
        }
        return returnPower
    } else {
        return 0
    }
}

func decompose(_ number:Int) -> [Int:Int]{
    
    var returnDic = [Int:Int]()
    
    var totalDecompose = 1
    
    while totalDecompose < number {
        let prime = primeGenerator()
        let primePow = primePower(number: number, prime: prime)
        if primePow != 0 {
            returnDic[prime] = primePow
            totalDecompose = {
                let p = pow(Decimal(prime), primePow)
                let r = NSDecimalNumber(decimal: p)
                return totalDecompose * Int(r)
            }()
        }
    }
    
    return returnDic
}

decompose(86240)

