import Foundation

var sumOfOddNumbers: ((Int) -> Int) = {
    (number)
    in 
    var sum: Int = 0

    for i in 1 ... number {
        if i % 2 != 0 {
            sum += i
        }

    }
    return sum
}

print(sumOfOddNumbers(5))


