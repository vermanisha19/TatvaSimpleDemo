//
//  UpdateViewController.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import UIKit
protocol UpdateViewDelegates: AnyObject {

    func changeNameOfStudent(_ name: String)
}

class UpdateViewController:UIViewController {

    @IBOutlet private weak var saveBtn: UIButton!
    @IBOutlet private weak var nameTxt: UITextField!
    
    weak var delegate: UpdateViewDelegates?
    var studentName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let studentName = studentName {
            nameTxt.text = studentName
        }
        nameTxt.delegate = self
        setLeftPadding()
    }
   
   private func setLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.nameTxt.frame.height))
        nameTxt.leftView = paddingView
        nameTxt.leftViewMode = UITextField.ViewMode.always
    }
    
    @IBAction private func saveBtnPressed(_ sender: Any) {
        if let name = nameTxt.text, !name.isEmpty {
            delegate?.changeNameOfStudent(name)
            navigationController?.popViewController(animated: true)
        } else {
            nameTxt.layer.borderColor = UIColor.red.cgColor
            nameTxt.layer.borderWidth = 1.0
        }
    }
}

//MARK: - UITextFieldDelegate

extension UpdateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameTxt.layer.borderColor = UIColor.clear.cgColor
        nameTxt.layer.borderWidth = 1.0
    }
}
