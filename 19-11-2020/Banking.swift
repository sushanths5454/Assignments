
enum Gender {
  case Male, Female, Other 
}
enum AccountType {

    case VehicleLoan
    case PersonalLoan
    case CurrentAccount
    case SavingAccount
    case Fixed
    case Recurring
    case HouseLoan
 
}


class AcountManager: Person {
  var bank: Bank
  var detail = [String:CreateAccount]()

  init(bank: Bank, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
    self.bank = bank
    super.init(name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
  }

  func accountHoldersDetail() { // To display account detail of the customers
    detail = bank.sendAccountHolders()
    print("AccountNumber\t\t\t\t Name \t\t\t\temail\t\t\t\t accountType")
    for (key, value ) in detail {
      print("\(key)\t\t\t\t \(value.name)\t\t\t\t \(value.email)\t\t\t\t\(value.accountType)")

    }
  }

  func currentBalance(accountNumber: String) { // to check current balance of the customer whose account number is passed
    var accountBalance = bank.currentBalance(accountNumber: accountNumber)
    if(accountBalance != -1 ) {               // returm -1 if there is no account found or may be wrong account number
      print("The account Balance of the account number \(accountNumber ) is \(accountBalance)")
    } else {
      print("Entered wrong account number")
    }

  }


}




class CaSaAccountTransaction {    // to handle CaSa Account Transaction
  var balance = [String: Int] ()
  var transaction = [String: String] ()
  
  func addMoney(accountNumber: String, amount: Int) {      // add the amount to account
    if(balance.keys.contains(accountNumber)){
      
      if let temp = balance[accountNumber] as? Int {
        balance[accountNumber] = amount + temp
        if let detail = transaction[accountNumber] as? String {
          transaction[accountNumber] = detail + "\(accountNumber)\t\t\t\t0\t\t\t\t\(amount)\t\t\t\t\(amount + temp) \n"
        }
       // print(name["sum"])

      } else {
         print("Not possible")
      }
      
    } else {
      balance[accountNumber] = amount
      transaction[accountNumber] = "\(accountNumber)\t\t\t\t0\t\t\t\t\(amount)\t\t\t\t\(amount) \n"

    }
    

  }

  func debitMoney(accountNumber: String, amount: Int) {  // debit money from the account
    if(balance.keys.contains(accountNumber)){         // here balance is dictionary of [accountNumber: amount]
      
      if let temp = balance[accountNumber] as? Int {
        balance[accountNumber] = temp - amount
        if let detail = transaction[accountNumber] as? String {
          transaction[accountNumber] = detail + "\(accountNumber)\t\t\t\t\(amount)\t\t\t\t0\t\t\t\t\(temp - amount) \n"
        }

      } else {
         print("Not possible")
      } 
    } 
  }

  func displayTransaction(accountNumber: String) {
    print("accountNumber \t\twithdraw\t\t deposit\t\t balance")
    print("--------------------------------------------------------------")
    print(transaction[accountNumber] as! String)


  }
  
}


class LoanAccountTransaction { // to handle loan account transaction
  
  var balance = [String: Double] ()
  var transaction = [String: String] ()
  var interest: Int?

  func addLoanAmount(accountNumber: String, loanAmount: Double) { // loan is passed this amount is added to balance. 
    
    balance[accountNumber] = loanAmount // here balance contain loan amount

  }

  func depositeMoney(date: String, accountNumber: String, repayment: Double, interestRate: Double) {
     
    if(balance.keys.contains(accountNumber)) { 

      if let temp = balance[accountNumber] as? Double {
        
        var simpleInterest = (interestRate / (100 * 12)) * temp
        balance[accountNumber] = temp - repayment - simpleInterest

        if let detail = transaction[accountNumber] as? String {
          transaction[accountNumber] = detail + "\(date)\t\t\t\t\(repayment)\t\t\t\t\(simpleInterest)\t\t\t\t\(temp - repayment - simpleInterest) \n"
          
        } else {
          transaction[accountNumber] = "\(date)\t\t\t\t\(repayment)\t\t\t\t\(simpleInterest)\t\t\t\t\(temp - repayment - simpleInterest) \n"
          print(transaction[accountNumber] as! String)

        }

      } else {
         print("Not possible")
      }
      
    }
    else {
         print("Account number not present")
    }
    
   }

  
  func display(accountNumber: String) {
   
   print("date\t\t\t deposited amount\t\t\t Interest \t\t\t Remaining Balance")
   print("---------------------------------------------------------------------")
   print(transaction[accountNumber] as! String)
   
     
   
    
  }
}



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
  let accountType: AccountType
  var depositeAmount: Int
  static var count = 0

  init(accountType: AccountType, depositeAmount: Int, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
  
    self.accountType = accountType
    self.depositeAmount = depositeAmount
    
    super.init(name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
  }

  func accountNumberGenerator(bankCode: Int,accountCode: Int) -> String {
   CreateAccount.count = CreateAccount.count + 1
       
    return "\(bankCode)\(accountCode)0000\(CreateAccount.count)"

  }


}

protocol SendDetail {
  func sendAccountHolders() -> [String: CreateAccount]
  func currentBalance(accountNumber: String) -> Int

}

extension Bank: SendDetail {
  func sendAccountHolders() -> [String: CreateAccount] {
    return acountHolders
  }

  func currentBalance(accountNumber: String) -> Int {
    if let temp = casaTransaction.balance[accountNumber] as? Int {
      return temp
    } else {
      return -1
    }
  }

}

class Bank{
  var name: String
  var branch: String
  var bankCode: Int
  var acountHolders = [String: CreateAccount] ()// [acountnumner: CreateAccount]
  
  let casaTransaction =  CaSaAccountTransaction()
  let loanTransaction = LoanAccountTransaction()
  
 

  init(name: String, branch: String, bankCode: Int) {
    self.name = name
    self.branch = branch 
    self.bankCode = bankCode 
   
  }
  func generatingAccountNumber(accountType: AccountType, depositeAmount: Int, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) -> String {

    let temp = CreateAccount(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
      let accountNumber = temp.accountNumberGenerator(bankCode: bankCode, accountCode: 101)
      print(accountNumber)
      acountHolders[accountNumber] = temp
      return accountNumber
      

  }

  func createBankAccount(accountType: AccountType, depositeAmount: Int, name: String, address: String, gender: Gender, email: String, aadharNumber: Int, phoneNumber: Int) {
 
    if(accountType == AccountType.SavingAccount && depositeAmount >= 500) {
         let accountNumber = generatingAccountNumber(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)

         casaTransaction.addMoney(accountNumber: accountNumber , amount: depositeAmount)

    } else if(accountType == AccountType.CurrentAccount && depositeAmount >= 1000) {

      let accountNumber = generatingAccountNumber(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)

      casaTransaction.addMoney(accountNumber: accountNumber , amount: depositeAmount)

    } else if(accountType == AccountType.PersonalLoan || accountType == AccountType.VehicleLoan || accountType == AccountType.HouseLoan) {

      let accountNumber = generatingAccountNumber(accountType: accountType, depositeAmount: depositeAmount, name: name, address: address, gender: gender, email: email, aadharNumber: aadharNumber, phoneNumber: phoneNumber)
      print("fiiii \(accountNumber)")

      if(accountType == AccountType.PersonalLoan) {
        loanTransaction.addLoanAmount(accountNumber: accountNumber, loanAmount: 100000.0)
      } else if(accountType == AccountType.VehicleLoan) {
        loanTransaction.addLoanAmount(accountNumber: accountNumber, loanAmount: 300000.0)
      } else {
        loanTransaction.addLoanAmount(accountNumber: accountNumber, loanAmount: 500000.0)

      }

     
      //loanTransaction.display()



    } 
    else {
      print("the amount passed is below minimum balnace")
    }

    
    


  }
 

  func addAmount(accountNumber: String, amount: Int) {
  // print(amount + balance[accountNumber] as! Int)
      
      casaTransaction.addMoney(accountNumber: accountNumber , amount: amount)
     // displayTransactionDetail(accountNumber:accountNumber

     
 }

 func repaymentOfLoan(date: String, accountNumber: String, repayment: Double, interestRate: Double) {
   loanTransaction.depositeMoney(date: date, accountNumber: accountNumber, repayment: repayment, interestRate: interestRate)
  loanTransaction.display(accountNumber: accountNumber )


 }
    
 func displayAccountHolder() {
    for (key, value) in acountHolders {
      print("accountNumber= \(key) Name=\(value.name)")
      print(casaTransaction.balance["52091010002"])
  

    }
 }
  
  
  

  func displayTransactionDetail(accountNumber: String) {
    
    casaTransaction.displayTransaction(accountNumber: accountNumber)
    print(casaTransaction.balance["52091010002"])

  }
  func debitAmount(accountNumber: String, amount: Int) {
    casaTransaction.debitMoney(accountNumber: accountNumber, amount: amount)
  }
  
}

/*let bank1 = CaSaAccountTransaction()
bank1.addMoney(accountNumber: "123", amount: 123)
bank1.addMoney(accountNumber: "123", amount: 123)
bank1.addMoney(accountNumber: "246", amount: 123)
bank1.debitMoney(accountNumber: "246", amount: 123)
bank1.addMoney(accountNumber: "246", amount: 123)
bank1.displayTransaction(accountNumber: "123")*/


var canarabank = Bank(name: "Canara Bank", branch: "Udupi", bankCode: 5209)

canarabank.createBankAccount(accountType: AccountType.SavingAccount , depositeAmount: 500, name: "sushanth", address: "udupi", gender: Gender.Male, email: "sushanth@gmail.com", aadharNumber: 240930186384, phoneNumber: 9071989318)
//canarabank.addAmount(accountNumber: "52091010001", amount: 500)

canarabank.createBankAccount(accountType: AccountType.CurrentAccount, depositeAmount: 1000, name: "sujith", address: "udupi", gender: Gender.Male, email: "sujith@gmail.com", aadharNumber: 241930186384, phoneNumber: 9034489318)

canarabank.addAmount(accountNumber: "52091010002", amount: 1000)



canarabank.displayAccountHolder()

canarabank.addAmount(accountNumber: "52091010002", amount: 2000)
canarabank.addAmount(accountNumber: "52091010001", amount: 2200)
canarabank.displayTransactionDetail(accountNumber: "52091010001" )
canarabank.displayTransactionDetail(accountNumber: "52091010002" )
canarabank.debitAmount(accountNumber: "52091010002", amount: 100)
canarabank.displayTransactionDetail(accountNumber: "52091010002" )


let canaraBankManager = AcountManager(bank: canarabank, name: "shankar", address: "udupi", gender: Gender.Male, email: "shankar@gmail.com", aadharNumber: 241945186384, phoneNumber: 904434489318)
canaraBankManager.accountHoldersDetail()

canaraBankManager.currentBalance(accountNumber: "52091010001")

canarabank.createBankAccount(accountType: AccountType.HouseLoan, depositeAmount: 1000, name: "sujith", address: "udupi", gender: Gender.Male, email: "sujith@gmail.com", aadharNumber: 241930186384, phoneNumber: 9034489318)

canarabank.repaymentOfLoan(date: "12/11/1212", accountNumber: "520910100003", repayment: 10000.0, interestRate: 10.0)

canarabank.repaymentOfLoan(date: "12/12/1212", accountNumber: "520910100003", repayment: 10000.0, interestRate: 10.0)