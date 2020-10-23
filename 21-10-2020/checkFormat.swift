import Foundation

func checkFormat(a: Int, b: Int, c: Int, n: Int) -> Bool {
    var condition: Bool = false

    for i in 2 ... n {
	 if pow(Double(a), Double(i)) + pow(Double(b), Double(i)) == pow(Double(c), Double(i)) {
         
		return true
         }
    } 

    return false
}

if checkFormat(a: 10, b: 20, c: 20, n: 10) {

    print("Holy smokes, Fermat was wrong!")
}
else {

    print("No, that doesn’t work.")
}