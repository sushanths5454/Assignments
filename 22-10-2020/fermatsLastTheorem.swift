import Foundation

var checkFormat = {
    (a: Int, b: Int, c: Int, n: Int) -> Bool 
    in

    var condition: Bool = false

    for i in 2 ... n{
	 if pow(Double(a), Double(i)) + pow(Double(b), Double(i)) == pow(Double(c), Double(i)) {
         condition = true
         return condition
         break
         }
    } 

    return false
}

if checkFormat(10, 20, 20,10){
    print("Holy smokes, Fermat was wrong!")
}
else{
    print("No, that doesn’t work.")
}