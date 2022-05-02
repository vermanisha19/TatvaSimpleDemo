//
//  StudentViewModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation

struct StudentViewModel {
    
    static var shared = StudentViewModel()
    private var studentInfo: [StudentModel] = []
    
    private let data = [
        "BranchIT": [
            "Nisha",
            "Mishika",
            "Abhishek",
            "Mukesh",
            ""
        ],
        "BranchEC": [
            "Bhawana",
            "Pooja",
            "Ashish",
            "Ankit",
            "Yash"
        ],
    ]
    
    mutating func studentDetails() -> [StudentModel] {
        for value in data {
            let students = StudentModel(studentBranch: value.key, studentsName:  value.value)
            studentInfo.append(students)
        }
        return studentInfo
    }
}

