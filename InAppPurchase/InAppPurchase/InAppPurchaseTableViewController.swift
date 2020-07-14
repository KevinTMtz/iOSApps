//
//  InAppPurchaseTableViewController.swift
//  InAppPurchase
//
//  Created by Kevin Torres on 13/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class InAppPurchaseTableViewController: UITableViewController {
    
    var freeQuotes = [
        "“Live as if you were to die tomorrow. Learn as if you were to live forever.” – Mahatma Gandhi",
        "“That which does not kill us makes us stronger.” – Friedrich Nietzsche",
        "“Be who you are and say what you feel, because those who mind don’t matter and those who matter don’t mind.” – Bernard M. Baruch",
        "“If opportunity doesn’t knock, build a door.” – Milton Berle"
    ]
    
    let premiunQuotes = [
        " “We must not allow other people’s limited perceptions to define us.” – Virginia Satir",
        "“Do what you can, with what you have, where you are.” – Theodore Roosevelt",
        "“Be yourself; everyone else is already taken.” – Oscar Wilde",
        "“If you cannot do great things, do small things in a great way.” – Napoleon Hill"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        freeQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        
        newCell.textLabel?.text = freeQuotes[indexPath.row]
        newCell.textLabel?.numberOfLines = 0
        
        return newCell
    }
    
    @IBAction func restorePress(_ sender: UIBarButtonItem) {
        
    }
}
