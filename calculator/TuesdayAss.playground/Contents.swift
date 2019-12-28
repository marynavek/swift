import UIKit

//automatically generate fibonacci number at the given position
func fibonacci (position: Int) -> Int {
    var value = 0
    var fibArray = [Int]()
    fibArray.append(0)
    fibArray.append(1)
    
    
    if position == 1 {
        value = fibArray[0]
    }
    else if position == 2 {
        value = fibArray[1]
    }
    else{
        let it = position+1
        for count in 2..<it {
            fibArray.append(0)
            fibArray[count] = fibArray[count-2] + fibArray[count-1]
        }
        value = fibArray[position-1]
    }
    return value
}

print(fibonacci(position: 8))

//determine whether the number is prime or not
func primes (number : Int) -> String {
    var check = 0
    var count = 0
    var result : String = ""
    if number == 1 || number == 0 {
     result = "The number is prime"
    }
    else{
        for divide in 1..<number+1 {
            check = number % divide
            if check == 0 {
                count += 1
            }
        }
         if count > 2 {
            result = "The number is not prime"
        }
        else {
          result = "The number is prime"}
    }
   
    return result
}

print(primes(number : 13 ))

//calculate factorial of the given number

func factorial (fact: Int) -> Int {
    var value = 1
    for i in 1...fact {
        value = value*i
    }
    return value
}

print (factorial(fact: 5))

//calculate the appearance of the prime numbers
func primes (number : Int) -> Int {
    var check = 0
    var count = 0
    var result : Int = 0
    if number == 1 || number == 0 {
     result = 1
    }
    else{
        for divide in 1..<number+1 {
            check = number % divide
            if check == 0 {
                count += 1
            }
        }
         if count > 2 {
            result = 0
        }
        else {
          result = 1}
    }
   
    return result
}

func countPrimes(begin : Int, end : Int ) -> Int{
    var occurence = 0
    var checkNum = 0
    for number in begin...end{
        checkNum = primes(number: number)
        if checkNum == 1 {
            occurence += 1
        }
    }
    return occurence
}

print(countPrimes(begin : 5, end : 10 ))

//count occurences of each character in the given string
func countChar(word : String){
    var count : [Character : Int] = [:]
    for item in word {
        print(item)
       count[item, default: 0] += 1
    }
    for (key, value) in count {
    print("The character \(key) occured \(value) in the string \(word)")
    }
}

print(countChar(word : "fbdsbgsdgfvsj"))



