//
//  StudentModel.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import Foundation

struct StudentModel: Codable {
    
    var branchIT: [String]
    let branchEC: [String]
}

enum TypeEnum: String, CaseIterable {
    
    case branchIt = "BranchIT"
    case branchEc = "BranchEC"
}
