//
//  StudentViewModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation

struct StudentViewModel {
    
    static var shared = StudentViewModel()
    private var studentInfo: [StudentData] = []
    
    private let data = [
        "BranchIT":
            ["Nisha","Mishika","Abhishek","Mukesh","Neha"],
        "BranchEC":
            ["Bhawana","Pooja","Ashish","Ankit","Ashish"],
    ]
    
    mutating func studentDetails() -> [StudentData] {
        for value in data.keys {
            let student = data[value]
            if let student = student {
                for name in student {
                  let studentData = StudentData(studentName: name, studentBranch: value)
                  studentInfo.append(studentData)
                }
            }
        }
        return studentInfo
    }
}

