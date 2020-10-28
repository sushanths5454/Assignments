import Foundation

print("Hello World")
class MovieBookingCounter {
    var maxSeat = 30
    static var seatCount: Int = 0
    var moviename: String
  
    var balconySeat: Bool
    var numberOfTicket: Int
    init(moviename: String, balconySeat: Bool, numberOfTicket: Int){
        self.moviename = moviename
        //self.ticketPrice = ticketPrice
        self.balconySeat = balconySeat
        self.numberOfTicket = numberOfTicket
        MovieBookingCounter.seatCount += numberOfTicket
        
    } 
    func displayMovueList() {
        print("The Movie which available:\n 1.avengersEndgame\n 2.Kedernath\n 3.Kirik Party")
    }
    func bookingStatus() {
        if(MovieBookingCounter.seatCount < maxSeat) {
            print(MovieBookingCounter.seatCount)
            print("Seat is availbale.You can book a ticket")
        } else {
            print("Housefull")
        }
    }
    func totalPrice() {
        if(balconySeat) {
            var totalPrice = numberOfTicket * 120
            print("the total amount=\(totalPrice)")
        } else {
            var totalPrice = numberOfTicket * 100
            print("the total amount=\(totalPrice)")
        }
    }

}


let movie1 = MovieBookingCounter(moviename: "kedernath", balconySeat: false, numberOfTicket: 25) 
//movie1.displayMovueList()
movie1.bookingStatus()
movie1.totalPrice()

let movie2 = MovieBookingCounter(moviename: "kedernath", balconySeat: false, numberOfTicket: 4) 
//movie1.displayMovueList()
movie2.bookingStatus()