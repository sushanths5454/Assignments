import Foundation

func power(x: Int, n: Int) -> Int {
    var powerOf : Int = 1
    if n == 0 {
        return 1
    }
    else {
        return x * power(x: x, n: n-1)
        
    }
    
}

print(power(x: 2, n: 3))