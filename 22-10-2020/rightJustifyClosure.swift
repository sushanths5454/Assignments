import Foundation

print("Hello World")

var rightJustify = {
    (initialString: String) -> String 
    in 

    var stringNeeded: String = ""
    
    for _ in 1 ... 70 - initialString.count {
        stringNeeded += " "
    }
    stringNeeded += initialString

    return stringNeeded

}

print(rightJustify("sushanth"))






