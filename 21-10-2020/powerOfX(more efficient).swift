import Foundation

func powerOfX(x: Int, n: Int)-> Int{
    if n==0{
        return 1
    
    }else {
        if n % 2 == 0{  
        return  power(x: x, n: n/2) * power(x: x, n: n/2)  
        }
        else
        {
           return  power(x: x, n: n/2) * power(x: x, n: n/2) * x
        }
    }
       
}

print(power(x: 2, n: 5))