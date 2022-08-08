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
    @IBOutlet weak var nameTF: UITextField!
    ///password
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var errorPaswordLbl: UILabel!
    @IBOutlet private weak var confirmPasswordTF: UITextField!
    @IBOutlet private weak var errorConformPasswordLbl: UILabel!
    ///passwordIndicator
    @IBOutlet private var strongPasswordIndicator: [UIView]!
    ///signUp Button
    @IBOutlet private weak var signUpButton: UIButton!
    ///FX-Label
    @IBOutlet weak var fxLabel: UIVisualEffectView!
    ///Complete message
    @IBOutlet weak var congratMessage: UILabel!
    ///Scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fxLabel.isHidden = true
        congratMessage.isEnabled = false
        hideKeyboardWhenTappedAround()
        startKeyboardObservers()
    }
    
    // MARK: - Properties
    
    private var validEmail = false {didSet{updateButtonAndFx()}}
    private var validConfirmPassword = false {didSet{updateButtonAndFx()}}
    private var strongPassword: PasswordStrength = .veryWeak {didSet{updateButtonAndFx()}}
    
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
    
    
    @IBAction func passwordAction(_ sender: UITextField) {
        if let password = sender.text,
               !password.isEmpty {
               strongPassword = VerificationService.isValidPassword(pass: password)
        }
        errorPaswordLbl.isHidden = strongPassword != .veryWeak
        strongPassIndicator()
        }
        
    
    @IBAction func confirmPasswordAction(_ sender: UITextField) {
        if let confirm = sender.text,
           !confirm.isEmpty,
           let confirmPass = passwordTF.text,
           !confirmPass.isEmpty {
           validConfirmPassword = VerificationService.isPassConfirm(pass1: confirmPass, pass2: confirm)
        }
        errorConformPasswordLbl.isHidden = validConfirmPassword
    }
    
    
    @IBAction func signInButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        if let email = emailTF.text,
           let name = nameTF.text,
           let password = passwordTF.text {
           let userModel = UserModel(name: name, email: email, password: password)
           performSegue(withIdentifier: "goToCode", sender: userModel)
        }
           
    }
    
    // MARK: - SetupPasswordIndicator
    
    private func strongPassIndicator() {
        strongPasswordIndicator.enumerated().forEach {index, view in
            if index <= (strongPassword.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    private func updateButtonAndFx() {
        signUpButton.isEnabled = validEmail && validConfirmPassword && strongPassword != .veryWeak
        fxLabel.isHidden = !signUpButton.isEnabled
        congratMessage.isEnabled = signUpButton.isEnabled
    }

    // MARK: - Keyboard Observers
    
    private func startKeyboardObservers() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc private func keyboardWillShow(notification: Notification) {
            guard let keyboardSize =
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else {
                return
            }
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }

        @objc private func keyboardWillHide() {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    
    // MARK: - Navigation

     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let verificationVC = segue.destination as? VerificationViewController,
           let userModel = sender as? UserModel {
            verificationVC.userModel = userModel
        }
    }

}

