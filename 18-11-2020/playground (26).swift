import Foundation


enum Gender {
  case Male, Female, Other 
}
enum CaSa {
  case CurrentAccount, SavingAccount
}


class Transaction {
  var value = [String: Int]() // [AccountNumber: Balnacce]
  var tem = [Int]()// array containg [withdrawMoney, deposit, balance] 
  var trans = [String: [[Int]]] ()

  func addMoney(deposite: Int, accountNumber: String) {
    tem.append(0) // since withdraws is zero
    if (value.keys.contains(accountNumber)) { // checking if already trasnction occured 
      if let temp = value[accountNumber] as? Int { // value contains accountnumber and Balance 
        value[accountNumber] = temp + deposite
        tem.append(deposite)
        tem.append(temp + deposite)
       

      } else {
        print("failed")
      }
      
    }
    else {      // if this is the first transaction
      value[accountNumber] = deposite
       tem.append(deposite)
        tem.append(deposite)
    }
    var tempo = [[Int]]()
    
    tempo.append(tem)
    trans[accountNumber] = tempo
    
  }


  func withdrawMoney(amount: Int, accountNumber: String) {
    tem.append(amount)
    if (value.keys.contains(accountNumber)) {
      if let temp = value[accountNumber] as? Int {
        if(temp < 1000){
         value[accountNumber] = temp - amount
         tem.append(0)
         tem.append(temp - amount)
        }
        else {
          print(" Account is having below minimum value")
        }
      } else {
        print("failed")
    
    } 
      
 }
  
    
  var tempo = [[Int]]()
    
  tempo.append(tem)
  trans[accountNumber] = tempo // this contains transaction in the form of [Accountnumber: [[withdraw,deposit, balance]]]
    
  }




  func display(num: String) {
    print("accountnumber: withdraws deposit balance")
    print(trans)// not completed just to check the value
    
    
   }
   
 
  

}







/*class Transaction {
  
  var balanace = [String: Int] () //[AccountNumber: Balnacce]
  var transactionsDetail = [String:[String: [[Int]]]]()
  //[AccountNumber:[Date:[withdraws, deposite,Balnacce]
   //                       [withdraws, deposite,Balnacce]]]

  func updateTransaction(accountNumber: String, date: String, withdraws: Int, deposite: Int, balanaceToDeposite: Int) {
    var transactions = [[Int]]()
    //if let balance1 = balanaceToDeposite as? Int {
     var transaction = [withdraws, deposite, balanaceToDeposite] 
     transactions.append(transaction)
     print(transactions)
    // print(type(of: transactions))
     var temp1 = [String: [[Int]]] ()
    temp1[date] = transactions
    transactionsDetail[accountNumber] = temp1 
    
    
  }


  


 
  func depositeMoney(date: String, accountNumber: String, amount: Int) {
    if(balanace.keys.contains(accountNumber)) {
      if let temp = balanace[accountNumber] as? Int {

        balanace[accountNumber] = temp + amount
         updateTransaction(accountNumber: accountNumber, date: date, withdraws: 0, deposite: amount, balanaceToDeposite: temp + amount )
      }
      else {
       print("failed")
      }
      
    }
    else {
      balanace[accountNumber] = amount
      updateTransaction(accountNumber: accountNumber, date: date, withdraws: 0, deposite: amount, balanaceToDeposite: balanace[accountNumber] as! Int )
    }





  }
  func displayTransactions(accountNumber: String) {
    if let temp = transactionsDetail[accountNumber]  {
      for (_, values) in temp {
        for value in values {
          print(value)
        }
      }
      print(type(of: temp))
  }else { print("hi")}
  }


}*/


class Person {
    var name: String
    var address: String
    let gender: Gender
    var email : String
    var aadharNumber: Int
    var phoneNumber: Int

    init(name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
        
        self.name = name
        self.address = address
        self.gender = gender
        self.email = email
        self.aadharNumber = aadharNumber
        self.phoneNumber = phoneNumber
    }
}

class CreateAccount: Person {
  let accountType: CaSa
  var depositeAmount: Int

  init(accountType: CaSa, depositeAmount: Int, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
  
    self.accountType = accountType
    self.depositeAmount = depositeAmount
    super.init(name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber,    phoneNumber: phoneNumber)
  }

  func accountNumberGenerator(bankCode: Int) -> String {
    
    return "\(bankCode)10100011\(1234)"

  }


}

class Bank {
  var name: String
  var branch: String
  var bankCode: Int
  var acountHolders = [String: CreateAccount] ()// [acountnumner: CreateAccount]
  var balance = [String: Int]()
  var transaction = [String: Transaction] ()

  init(name: String, branch: String, bankCode: Int) {
    self.name = name
    self.branch = branch 
    self.bankCode = bankCode 
   
  }

  func createBankAccount(accountType: CaSa, depositeAmount: Int, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
  
    if(accountType == CaSa.SavingAccount && depositeAmount >= 500) {
      let temp = CreateAccount(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
      let accountNumber = temp.accountNumberGenerator(bankCode: bankCode)
      acountHolders[accountNumber] = temp
      balance[accountNumber] = depositeAmount
       

    }

    else if(accountType == CaSa.SavingAccount && depositeAmount >= 1000) {
      let temp = CreateAccount(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
      let accountNumber = temp.accountNumberGenerator(bankCode: bankCode)
      acountHolders[accountNumber] = temp
      let t1 = Transaction()

      t1.addMoney(deposite: depositeAmount, accountNumber: accountNumber)
      

         }

    else {
      print("the amount passed is below minimum balnace")
    }

    
    


  }

  func addAmount(date: String, accountNumber: String, amount: Int) {
  // print(amount + balance[accountNumber] as! Int)
  
  let t1 = Transaction()

   t1.addMoney(deposite: amount, accountNumber: accountNumber)
   

     
 }
    

  func displayAccountHolder() {
    for (key, value) in acountHolders {
      print("accountNumber= \(key) Name=\(value.name)")
      print(balance)

    }
  }

  
}

let canarabank = Bank(name: "Canara Bank", branch: "Udupi", bankCode: 5209)

canarabank.createBankAccount(accountType: CaSa.SavingAccount, depositeAmount: 500, name: "sushanth", address: "udupi", gender: Gender.Male, email: "sushanth@gmail.com", aadharNumber: 240930186384, phoneNumber: 9071989318)


canarabank.displayAccountHolder()
canarabank.addAmount(date: "12/12/12", accountNumber: "5209101000111234", amount: 1000)
//canarabank.addMoney(date: "12/12/12", accountNumber: "5209101600230", amount: 5000)

//let t1 = Transactions()
///t1.depositeMoney(date: "12/12/12", accountNumber: "23534664575756", amount: 1000)
//t1.depositeMoney(date: "11/12/12", accountNumber: "23534664575756", amount: 6000)
//t1.depositeMoney(date: "13/12/12", accountNumber: "23534664575756", amount: 1000)
//t1.displayTransactions(accountNumber: "23534664575756")
