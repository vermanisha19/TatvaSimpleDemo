//
//  StudentModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation

struct StudentModel : Codable {
    
    var studentName : String
    let studentBranch : String
}

enum TypeEnum : String, CaseIterable {

    case branchIt = "Branch-IT"
    case branchEc = "Branch-EC"
}
