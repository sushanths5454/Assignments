import Foundation

print("Hello Wrld")

class Restaurent {
    var itemName: String
    var quantity: Int 
    var price: Int 
    var acOrNonAc: Bool

    init(itemName: String, quantity: Int, price: Int, acOrNonAc: Bool) {
        self.itemName = itemName
        self.quantity = quantity
        self.price = price
        self.acOrNonAc = acOrNonAc
    }
    func billAmount() {
        if(acOrNonAc) {
            var total = (quantity * price) + 30
            print(total)
        } else {
            var total = (quantity * price) 
            print(total)

        }
    } 
}

let restaurent = Restaurent(itemName: "biriyani", quantity: 2, price: 150, acOrNonAc: true)
restaurent.billAmount()





