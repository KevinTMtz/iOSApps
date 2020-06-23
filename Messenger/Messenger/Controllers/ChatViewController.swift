//
//  ChatViewController.swift
//  Messenger
//
//  Created by Kevin Torres on 22/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    var messages: [Message] = [
        Message(sender: "45@k.com", body: "Hello! 😄"),
        Message(sender: "45@n.com", body: "Hi! 😎"),
        Message(sender: "45@k.com", body: "How you doing?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        title = Constants.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel?.text = messages[indexPath.row].body
        
        if messages[indexPath.row].sender == "45@k.com" {
            cell.messageLabel?.textAlignment = .right
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
// For the user to be able to interact with the cells
//extension ChatViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
