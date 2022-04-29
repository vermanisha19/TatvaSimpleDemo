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
    private var studentDetails: [[StudentData]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
        let studentArray = StudentViewModel.shared.studentDetails()
        for value in TypeEnum.allCases {
            let students = studentArray.filter { $0.studentBranch == value.rawValue
            }
            studentDetails.append(students)
        }
    }
}

//MARK: - UpdateViewDelegates

extension ViewController: UpdateViewDelegates {
    
    func changeNameOfStudent(_ name: String) {
        studentDetails[selectedIndex.section][selectedIndex.row].studentName = name
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
        return studentDetails[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier, for: indexPath) as! StudentTableViewCell
        let name = studentDetails[indexPath.section][indexPath.row]
        cell.studentName.text = name.studentName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath
        
        if let updateViewController = storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController {
            updateViewController.delegate = self
            let name = studentDetails[indexPath.section][indexPath.row]
            updateViewController.studentName = name.studentName
            navigationController?.pushViewController(updateViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let type = TypeEnum.allCases[section]
        let sectionTitle = type.rawValue
        return sectionTitle
    }
}
