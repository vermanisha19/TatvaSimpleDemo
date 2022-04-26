//
//  ViewController.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import UIKit

class ViewController: UIViewController, UpdateViewDelegates {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var selectedIndex : IndexPath!
    var studentInfo = [[StudentModel]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
        StudentViewModel.shared.getStudentDetails { studentArray in
            
            for value in TypeEnum.allCases {
                
                let student = studentArray.filter { $0.studentBranch == value.rawValue
                }
                self.studentInfo.append(student)
            }
        }
        
    }
    
    func changeNameOfStudent(name: String) {
        
        studentInfo[selectedIndex.section][selectedIndex.row].studentName = name
        studentTableView.reloadData()
    }
    
}

//MARK: - Table View Methods

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return TypeEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return studentInfo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = studentTableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier, for: indexPath) as! StudentTableViewCell

        let name = studentInfo[indexPath.section][indexPath.row]
        cell.studentName.text = name.studentName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = studentTableView.cellForRow(at: indexPath) as! StudentTableViewCell
        selectedIndex = tableView.indexPath(for: cell)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController {
            
            vc.delegate = self
            
            let name = studentInfo[indexPath.section][indexPath.row]
            vc.studentName = name.studentName
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let type = TypeEnum.allCases[section]
        let sectionTitle = type.rawValue
        return sectionTitle
    }
    
}

