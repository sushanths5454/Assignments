import Foundation

var checkFormat = {
    (a: Int, b: Int, c: Int, n: Int) -> Bool 
    in

    var condition: Bool = false

    for i in 2 ... n{ //Leave a blank space before the flower bracket
	 if pow(Double(a), Double(i)) + pow(Double(b), Double(i)) == pow(Double(c), Double(i)) {
		 //Instead of assinging 'true' to condition and then returning condition, you can directly return true.
         condition = true
         return condition
		 //Since you are returning in the previous line, break statement will never be expecuted.
         break
		 //All the 3 lines above should have one additional tab space
         }
    } 

    return false
}

if checkFormat(10, 20, 20,10){//Leave a blank space before the flower bracket
    print("Holy smokes, Fermat was wrong!")
}
else{//Leave a blank space before the flower bracket
    print("No, that doesn’t work.")
}
