import Foundation

//Dont leave too many blank spaces unnecessarily

var bottlesOfWater = {
    (number : Int)
    in
    //Instead of assiging number to another variable 'n', you can decrement 'number' itself. Check how to modify the input parameter of any function.
    //What if the number was negative? You should check for error in input parameter.
    
    var n = number
    
    //Leave a blank space before and after logiccal/comparison operators
    while(n>0 ){
        print("\(n) bottles of water on the wall,\n \(n) bottles of water,\n ya’ take one down, ya’ pass it around,\n \(n-1) bottles of water on the wall.")
        print("\n")
        n -= 1 
        
   }
    print("\(n) bottles of water on the wall,\n \(n) bottles of water,\n ya’ take one down, ya’ pass it around,\n \(n-1) bottles of water on the wall.")
    print("\n")
  
    
}

bottlesOfWater(10)
