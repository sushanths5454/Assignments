import Foundation

var somelist: [[String: Any]] = [
    [
      "Name": "ABC",
      "Age": 20,
      "Branch": "ECE"
    ],
    [
      "Name": "DEF",
      "Age": 21,
      "Branch": "CS"
    ],
    [
      "Name": "GHI",
      "Age": 22,
      "Branch": "IS"
    ]
]
func dictionaryToArray(someValue: [[String: Any]]) -> [Any] {
    var arraydic = [Any] ()
for values in somelist {
    for (key,_) in values {
   //print(values["Name"])
        arraydic.append(values[key]!)
    }      
    } 
    return arraydic
}
print(dictionaryToArray(someValue:somelist ))

