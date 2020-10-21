import Foundation
func rightJustify(stringPassed: String){
    var stringNeeded : String = ""

    for _ in 1 ... 70-S.length {
        stringNeeded.append(" ")
    }
    stringNeeded.append(stringPassed)

    print(stringNeeded)


}

rightJustify(stringPassed: "sushanth")