//
//  HelloViewController.swift
//  Registration
//
//  Created by Igor Baidak on 7.08.22.
//

import UIKit

class HelloViewController: UIViewController {

    ///User Model
    var userModel: UserModel?
    ///Info Label
    @IBOutlet private weak var infoLbl: UILabel!
    ///Continue Button
    @IBOutlet private weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonAction() {
        guard let userModel = userModel else {
            return
        }

        UserDefaultsService.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        let name = userModel?.name ?? "Dear User"
        infoLbl.text = "\(name), welcome to my first Application."
    }

}
