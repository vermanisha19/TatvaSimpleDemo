//
//  StudentModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation

struct StudentModel: Codable {
    
    var studentBranch: String
    var studentsName: [String]
}

enum TypeEnum: String, CaseIterable {

    case branchIT = "BranchIT"
    case branchEC = "BranchEC"
}
