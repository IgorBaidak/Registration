//
//  CreateAccountViewController.swift
//  Registration
//
//  Created by Igor Baidak on 31.07.22.
//

import UIKit

class CreateAccountViewController: UIViewController {

    // MARK: - @IBOutlet
    
    ///email
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var errorEmailLbl: UILabel!
    ///name
    @IBOutlet private weak var nameTF: UITextField!
    ///password
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var errorPaswordLbl: UILabel!
    @IBOutlet private weak var confirmPasswordTF: UITextField!
    @IBOutlet private weak var errorConformPasswordLbl: UILabel!
    ///passwordIndicator
    @IBOutlet private var strongPasswordIndicator: [UIView]!
    ///signUp Button
    @IBOutlet private weak var signUpButton: UIButton!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Properties
    
    private var validEmail = false
    private var validConfirmPassword = false
    private var strongPassword: PasswordStrength = .veryWeak
    
    // MARK: - @IBAction
    
    @IBAction func emailAction(_ sender: UITextField) {
        if let email = sender.text,
            !email.isEmpty,
            VerificationService.isValidEmail(email: email){
            validEmail = true
        } else {
            validEmail = false
        }
        errorEmailLbl.isHidden = validEmail
    }
    
    @IBAction func nameAction(_ sender: UITextField) {
        
    }
    
    @IBAction func passwordAction(_ sender: UITextField) {
        if let password = sender.text,
           !password.isEmpty {
           strongPassword = VerificationService.isValidPassword(pass: password)
        }
        errorPaswordLbl.isHidden = strongPassword == .veryWeak
        }
        
    
    @IBAction func confirmPasswordAction(_ sender: UITextField) {
        
    }
    
    @IBAction func signInButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


