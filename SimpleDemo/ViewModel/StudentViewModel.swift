//
//  StudentViewModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation


struct StudentViewModel {
 
    static var shared = StudentViewModel()
    var studentData = [StudentModel]()
    var data  = [
         
            ["Nisha","Branch-IT"],
            ["Mishika","Branch-EC"],["Neha","Branch-EC"],
            ["Vishwa","Branch-IT"],["Abhishek","Branch-IT"],
            ["Yash","Branch-EC"],["Shrutik","Branch-IT"],
            ["Anshu","Branch-IT"],
           ["Pooja","Branch-EC"],["Bhawana","Branch-EC"]

    ]
    
    mutating func getStudentDetails(completion : @escaping([StudentModel]) -> Void ) {
         
         for value in data {
             
             let studentObject = StudentModel(studentName: value[0], studentBranch: value[1])
             studentData.append(studentObject)
         }
        completion(studentData)
    }
   
}

