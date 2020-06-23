//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Kevin Torres on 22/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription,         preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
            }
        }
    }
}
