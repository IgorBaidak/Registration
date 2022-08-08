//
//  SignInViewController.swift
//  Registration
//
//  Created by Igor Baidak on 31.07.22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    @IBOutlet weak var errorEmailTF: UILabel!
    @IBOutlet weak var errorPasswordTF: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLogUser()
    }
    
    // MARK: - Properties
    
    private var validEmail = false
    private var strongPassword: PasswordStrength = .veryWeak
    
    @IBAction func emailTF(_ sender: UITextField) {
        if let email = sender.text,
            !email.isEmpty,
            VerificationService.isValidEmail(email: email){
            errorEmailTF.isHidden = true
        } else {
            errorEmailTF.isHidden = false
        }
    }
    
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextFiel.text,
           let userModel = UserDefaultsService.getUserModel(),
           email == userModel.email,
           password == userModel.password
        { performSegue(withIdentifier: "goToProfile", sender: nil) }
        
    }
    
    private func isLogUser() {
        if let userModel = UserDefaultsService.getUserModel()
        { performSegue(withIdentifier: "goToProfile", sender: nil) }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
