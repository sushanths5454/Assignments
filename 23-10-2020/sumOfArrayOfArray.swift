import Foundation

func sumOfArray(list: [Any]) -> Int {
    var sum = 0
    for value in list {
        var temp = value
        if let temp = value as? [Any] {
            sum += sumOfArray(list: temp)
        } else {
            if let temp = value as? Int {
                sum += temp
            }
        }
    }

    return sum
}

var list:[Any] = [ 
    2,
  [3, 5, 8], 
  [4, 5], 
  [
    [8, 1, 9, 5],
    [2, 4],
  ]
]

print(sumOfArray(list:list))