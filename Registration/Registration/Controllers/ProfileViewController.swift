//
//  ProfileViewController.swift
//  Registration
//
//  Created by Igor Baidak on 7.08.22.
//

import UIKit

class ProfileViewController: UIViewController {
    var userModel: UserModel?
    @IBOutlet weak var infoUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        UserDefaultsService.deleteUserDefaults()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToEdit", sender: userModel)
    }
    
    private func setupUI() {
        guard let email = UserDefaults.standard.string(forKey: "email"),
              let name = UserDefaults.standard.string(forKey: "name") else { return }
        infoUser.text = "Welcome, dear \(name), your e-mail: \(email)"
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
