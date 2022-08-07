//
//  UIViewControllerExtension.swift
//  Registration
//
//  Created by Igor Baidak on 2.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
    }

@objc func dismissKeyboard() {
    view.endEditing(true)
    }
    
}



