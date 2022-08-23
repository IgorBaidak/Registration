//
//  EditUserDataViewController.swift
//  Registration
//
//  Created by Igor Baidak on 8.08.22.
//

import UIKit

class EditUserDataViewController: UIViewController {
    
    @IBOutlet weak var newEmailTF: UITextField!
    @IBOutlet weak var errorNewEmailLbl: UILabel!
    
    @IBOutlet weak var newNameTF: UITextField!
    
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var errorPasswordLbl: UILabel!
    
    
    @IBOutlet var passwordIndicator: [UIView]!
    
    
    @IBOutlet weak var newConfirmPassword: UITextField!
    @IBOutlet weak var errorConfirmPass: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var userModel: UserModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    
    private var validEmail = false {didSet{updateButtonAndFx()}}
    private var validConfirmPassword = false {didSet{updateButtonAndFx()}}
    private var strongPassword: PasswordStrength = .veryWeak {didSet{updateButtonAndFx()}}
    
    private func strongPassIndicator() {
        passwordIndicator.enumerated().forEach {index, view in
            if index <= (strongPassword.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    private func updateButtonAndFx() {
        saveButton.isEnabled = validEmail && validConfirmPassword && strongPassword != .veryWeak
    }
    
    @IBAction func newEmail(_ sender: UITextField) {
        if let email = sender.text,
            !email.isEmpty,
            VerificationService.isValidEmail(email: email){
            validEmail = true
        } else {
            validEmail = false
        }
        errorNewEmailLbl.isHidden = validEmail
    }
    
    
    @IBAction func newName(_ sender: UITextField) {
        
    }
    
    @IBAction func newPassword(_ sender: UITextField) {
        if let password = sender.text,
               !password.isEmpty {
               strongPassword = VerificationService.isValidPassword(pass: password)
        }
        errorPasswordLbl.isHidden = strongPassword != .veryWeak
        strongPassIndicator()
    }
    
    
    @IBAction func newConfirmPass(_ sender: UITextField) {
        if let confirm = sender.text,
           !confirm.isEmpty,
           let confirmPass = newPasswordTF.text,
           !confirmPass.isEmpty {
           validConfirmPassword = VerificationService.isPassConfirm(pass1: confirmPass, pass2: confirm)
        }
        errorPasswordLbl.isHidden = validConfirmPassword
    }
    
    
    // MARK: - Navigation


}
