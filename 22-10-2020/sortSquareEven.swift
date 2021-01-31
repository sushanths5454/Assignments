import Foundation

let isEven = {
    (value: Int) -> Bool
    in 

    if (value % 2 == 0){//Leave a space before the flower bracket
        return true
    }
    return false
 }

let squareNumber = {
    (value : Int) -> Int 

    in //Do not have a blank line before the 'in' statement. The parameter type declaration and 'in' should be together.
    var square = value * value
    return square
    
}
let sortNumber = {
    (value: [Int]) -> [Int]
    
    in //Do not have a blank line before the 'in' statement. The parameter type declaration and 'in' should be together.
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
    sortNumber(evenNumberSquareList) //The original array is not modified at all. So, I dont think it will print the sorted array at all.

    return evenNumberSquareList

}

var numberlist = [1,4,3,6,7,96,8,7]
print(sortEvenSquare(numberlist))



