//
//  ForgotPasswordViewController.swift
//  ProjectWeidlinger
//
//  Created by Sebastian Weidlinger on 26.06.21.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 2
        resetButton.layer.cornerRadius = 10
        
        setUpElements()
    }
    
    func setUpElements(){
        
        //Hide error Label
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String?{
        
        //check that all fields are filled returns error message if not filled
        if emailLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please enter your Email"
        }
        return nil
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        let validate = validateFields()
        
        if validate != nil{
            showError(validate!)
        }
        else{
            let email = emailLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().sendPasswordReset(withEmail: email!)
            errorLabel.text = "An Email to reset your Password has been sent!"
            errorLabel.textColor = UIColor.systemGreen
            errorLabel.alpha = 1
        }
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
