import Foundation

func oddSum(n: Int)-> Int {
    if n == 1 {
        return 1
    }
    else {
        if n % 2 != 0 {
            return n + oddSum(n: n-1)
        }
        else {
            return oddSum(n: n-1)
        }
    }
}

var s = oddSum(n: 5)

print(s)