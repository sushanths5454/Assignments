import Foundation

import Foundation

func dict(someValue: [String: [String: Any]], detailToFetch: String) {
    var splittedKeys = detailToFetch.components(separatedBy: ":")
    
    print("The detail required is ")
    if(splittedKeys.count == 1){

        print(someValue[splittedKeys[0]]!)

    } else if(splittedKeys.count == 2){

        print(someValue[splittedKeys[0]]! [splittedKeys[1]]!)

     }
    else {
       var temp = someValue[splittedKeys[0]]! [splittedKeys[1]]! 
       var newdic: [String: Any] = temp as! [String: Any] 
     
      print(newdic[splittedKeys[2]]!)
       
    }

}
var someValue: [String: [String: Any]] = [
    "ABC001": [
      "Name": "ABC",
      "Age": 20,
      "Branch": "ECE",
      "Marks": [
        "Physics": 30,
        "Chemistry": 40,
        "Maths": 50
      ]
    ],
    "ABC002": [
      "Name": "DEF",
      "Age": 21,
      "Branch": "CS",
      "Marks": [
        "Physics": 31,
        "Chemistry": 41,
        "Maths": 51
      ]
    ],
    "ABC003":[
      "Name": "GHI",
      "Age": 22,
      "Branch": "IS",
      "Marks": [
        "Physics": 32,
        "Chemistry": 42,
        "Maths": 52
      ]
    ]

]
var detailToFetch = "ABC003:Marks:Physics"


dict(someValue: someValue, detailToFetch: detailToFetch )