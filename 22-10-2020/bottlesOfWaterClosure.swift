import Foundation



var bottlesOfWater = {
    (number : Int)
    in
    var n = number
    while(n>0 ){
        print("\(n) bottles of water on the wall,\n \(n) bottles of water,\n ya’ take one down, ya’ pass it around,\n \(n-1) bottles of water on the wall.")
        print("\n")
        n -= 1 
        
   }
    print("\(n) bottles of water on the wall,\n \(n) bottles of water,\n ya’ take one down, ya’ pass it around,\n \(n-1) bottles of water on the wall.")
    print("\n")
  
    
}

bottlesOfWater(10)