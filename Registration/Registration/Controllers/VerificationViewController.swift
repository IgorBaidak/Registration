//
//  VerificationViewController.swift
//  Registration
//
//  Created by Igor Baidak on 31.07.22.
//

import UIKit

class VerificationViewController: UIViewController {
    ///User Model
    var userModel: UserModel?
    ///Generation Secret Code
    let secretCode = Int.random(in: 100000...999999)
    ///Verification Label
    @IBOutlet weak var verificationLbl: UILabel!
    ///Code TextField
    @IBOutlet weak var codeTF: UITextField!
    ///ErrorSecretCodeTF
    @IBOutlet weak var errorSecretCodeTF: UILabel! { didSet {errorSecretCodeTF.isHidden = true}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataUsr()
        
    }
    
    @IBAction func codeTF(_ sender: UITextField) {
        guard let code = sender.text,
              let codeInt = Int(code),
              codeInt == secretCode else { let isHidden = sender.text!.count >= 6
                                               errorSecretCodeTF.isHidden = !isHidden
            return
        }
        performSegue(withIdentifier: "goToHello", sender: nil)
    }
    
    private func setupDataUsr() {
        let nameUser = userModel?.name ?? "Dear user"
        let emailUser = userModel?.email ?? "your e-mail"
        verificationLbl.text = "\(nameUser) please enter code \(secretCode) from \(emailUser)"
    }
    
    // MARK: - Show Alert
    
//        private func showAlert(title: String, message: String) {
//            let alert = UIAlertController(title: title,
//                                          message: message,
//                                          preferredStyle: .actionSheet)
//            let okAlert = UIAlertAction(title: "Ok", style: .default) { _ in self.codeTF.text = ""}
//            alert.addAction(okAlert)
//            present(alert, animated: true)
//        }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? HelloViewController else { return }
        vc.userModel = userModel
    }

    
}
