//
//  LogInViewController.swift
//  Messenger
//
//  Created by Kevin Torres on 22/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailLabel.text, let password = passwordLabel.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription,         preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: Constants.logInSegue, sender: self)
                }
            }
        }
    }
}
