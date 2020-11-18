
import Foundation

class PersonDetail {
    var id: Int
    var name: String
    var address: String
    let gender: String

    init(id: Int, name: String, address: String, gender: String) {
        self.id = id
        self.name = name
        self.address = address
        self.gender = gender
    }
}

class StaffDetail: PersonDetail {
    var qualification: String
    var workingTime: Int 
    var salary: Int

    init(id: Int, name: String, address: String, gender: String,qualification: String, workingTime: Int, salary: Int ) {
        self.qualification = qualification
        self.workingTime = workingTime
        self.salary = salary
        super.init(id : Int, name: String, address: String, gender: String)
    }
}

class Lecturer: StaffDetail {
    var branch: String
    var subjectHandling = [String] ()

    init(id: Int, name: String, address: String, gender: String ,qualification: String, workingTime: Int, salary: Int, branch: String, subjectHandling: [String] ) {
        self.branch = branch
        self.subjectHandling = subjectHandling
        super.init(id: Int, name: String, address: String, gender: String ,qualification: String, workingTime: Int, salary: Int )
    }

    func conductClass(sem: Int, subjectName: String) {
     // condcuting classes   
    }
    func evaluation(studnetId: String, sem: Int, subjectName: String) {
        // evaluating
    }
    func declareResults() {
        // declaring results of students

    }
}

class Branch {
    var branchHead: String
    var studentCount: Int
    var facultyCount: Int

    init(branchHead: String, studentCount: Int, facultyCount: Int) {
        self.branchHead = branchHead
        self.studentCount = studentCount
        self.facultyCount = facultyCount
    }

    func setTimeTable(sem: Int){
        // setting time table 
    }

    func conductTest() {
        // condcuting  the test
    }

    func uploadMarks(id: Int sem: Int, subject: String) {
      // uploading internal marks to university
    }

    func studentDetail(id : Int, sem: Int ) {
        //get branch  student detail

    }

    func facultyDetail(id: Int) {
      // to get faculty detail
    }

    func viewResult() {
      // viewing the results of the
    }

}

class Accounts: StaffDetail {

 
  // 
  var workingTime : String

   init(workingTime: String, id: Int, name: String, address: String, gender: String ,qualification: String, workingTime: Int, salary: Int ) {
     self.workingTime = workingTime
     super.init(id: Int, name: String, address: String, gender: String ,qualification: String, workingTime: Int, salary: Int )

   }


  func admitStudnet() {
    // admitting the studnet

  }
  func receivePyment() {

    // receiving the payment

  }

  func remainingFeeAmount() {
    // check for remaining fee amount
  }

  func creditsalary() {
    // credit salrty to staff 
  }

}


class student: PersonDetail {
  var modeOfAdmission : String // CET or Managaement
  var feeAmount: Int

  init(modeOfAdmission: String, feeAmount, id: Int, name: String, address: String, gender: String) { 
    self.modeOfAdmission = modeOfAdmission
    self.feeAmount = feeAmount
    super.init(id: Int, name: String, address: String, gender: String)
  }

  func fillApplicationForm() {
    // filling application to join college
  }

  func payFee(amount: Int) {
    // paying the fee amount ot college
  }

  func attendClass(sem: Int, subject: String) {
    // atteding the class 
  }

  func takeTest(sem: Int, subject: String) {
    // taking test
  }

  func checkresult() {

    // checking exam result
  }


}


class College {
  let id : String
  var name: String
  var address : String
  var principle; String
  var telephone: Int
  var email: Int
  init(id : String, name: String, address : String, principle; String, telephone: Int,email: Int) {
    self.id = id
    self.name = name
    self.address = address
    self.principle = principle
    self.telephone = telephone
    self.email = email

  }

  func hireStaff() {
    // hiring staff(Teaching and Non teaching staff)
  }

  func developementProgram() {
    // organizing developement programs for studnets and faculty
  }
  func infrastructureDevelopment() {

    // developing the infrastrucutre of the college
  }

  func uploadStudentDetails() {
    // uploading student detail to the university
  }

}

class university: College {

  func addCollege(id: Int, name: String) {
    // adding new college 

  }

  func examTimeTable() {
    // setting time table for university external exam 

  }
  func announceResult() {
    // result of the students
  }

  func provideDegree() {
    // provide degree to the student 

  }


}




