//
//  ViewController.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var studentTableView: UITableView!
    private var selectedIndex: IndexPath!
    private var studentDetails: [StudentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
        let studentArray = StudentViewModel.shared.studentDetails()
        for students in studentArray {
            studentDetails.append(students)
        }
    }
}

//MARK: - UpdateViewDelegates

extension ViewController: UpdateViewDelegates {
    
    func changeNameOfStudent(_ name: String) {
        studentDetails[selectedIndex.section].studentsName[selectedIndex.row] = name
        DispatchQueue.main.async {
            self.studentTableView.reloadRows(at: [self.selectedIndex], with: .none)
        }
    }
}

//MARK: - Table View Delegate and DataSource

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return TypeEnum.allCases.count
        return studentDetails.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentDetails[section].studentsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier, for: indexPath) as! StudentTableViewCell
        let name = studentDetails[indexPath.section].studentsName[indexPath.row]
        cell.studentName.text = name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath
        
        if let updateViewController = storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController {
            updateViewController.delegate = self
            let name = studentDetails[indexPath.section].studentsName[indexPath.row]
            updateViewController.studentName = name
            
            navigationController?.pushViewController(updateViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = studentDetails[section].studentBranch
        return sectionTitle
    }
}
