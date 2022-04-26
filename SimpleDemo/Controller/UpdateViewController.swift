//
//  UpdateViewController.swift
//  SimpleDemo
//
//  Created by MAC106 on 25/04/22.
//

import UIKit
protocol UpdateViewDelegates : AnyObject {
    
    func changeNameOfStudent(name : String)
}

class UpdateViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var nameTxt: UITextField!
    
    weak var delegate : UpdateViewDelegates?
    var studentName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTxt.text = studentName!
        nameTxt.delegate = self
        
        setLeftPadding()
    }
   
    func setLeftPadding() {
    
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.nameTxt.frame.height))
        nameTxt.leftView = paddingView
        nameTxt.leftViewMode = UITextField.ViewMode.always
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        if nameTxt.text != "" {
          
            delegate?.changeNameOfStudent(name: nameTxt.text!)
            navigationController?.popViewController(animated: true)
        }
        else {
            nameTxt.placeholder = "Please Write Something.."
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

}
