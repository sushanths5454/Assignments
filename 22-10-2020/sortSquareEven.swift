import Foundation

let isEven = {
    (value: Int) -> Bool
    in 

    if (value % 2 == 0){
        return true
    }
    return false
 }

let squareNumber = {
    (value : Int) -> Int 

    in
    var square = value * value
    return square
    
}
let sortNumber = {
    (value: [Int]) -> [Int]
    
    in
    var value1 = value
    value1.sort()
    return value1

}

let sortEvenSquare = {
    (numberList: [Int]) -> [Int]
    in 

    var evenNumberSquareList = [Int]()
    for value in numberList {
        if isEven(value) {
            evenNumberSquareList.append(squareNumber(value))
        }
    }
    sortNumber(evenNumberSquareList)

    return evenNumberSquareList

}

var numberlist = [1,4,3,6,7,96,8,7]
print(sortEvenSquare(numberlist))



