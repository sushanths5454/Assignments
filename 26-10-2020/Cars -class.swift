import Foundation

print("Hello World")

class Cars {
    var carBrand: String
    var carModel: String
    var carColor: String
    var carPrice: Int
    let discount: Int = 7
    init() {
        carBrand = "maruthi"
        carModel = "swift"
        carColor = "white"
        carPrice = 500000
    }
    init(carBrand: String, carModel: String, carColor: String, carPrice:Int) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carColor = carColor
        self.carPrice = carPrice

    }
    func detailOfBookedCar() {
	print("th)
        print(carBrand)
        print(carModel)
    }
}

let car1 = Cars(carBrand: "audi", carModel: "Q3", carColor: "white", carPrice: 123456)
car1.detailOfBookedCar()
