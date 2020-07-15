//
//  InAppPurchaseTableViewController.swift
//  InAppPurchase
//
//  Created by Kevin Torres on 13/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import StoreKit

class InAppPurchaseTableViewController: UITableViewController, SKPaymentTransactionObserver {
    
    let productID = "com.KevinTMtz.InAppPurchase.PremiumQuotes"
    
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
        
        SKPaymentQueue.default().add(self)
        
        if isPurchased() {
            showPremiumQuotes()
        }
    }
    
    // MARK: - Table View Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPurchased() {
            return freeQuotes.count
        }
        return freeQuotes.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        
        if indexPath.row < freeQuotes.count {
            newCell.textLabel?.text = freeQuotes[indexPath.row]
            newCell.textLabel?.numberOfLines = 0
            newCell.textLabel?.textColor = .label
            newCell.accessoryType = .none
        } else {
            newCell.textLabel?.text = "Buy More Quotes"
            newCell.textLabel?.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            newCell.textLabel?.numberOfLines = 0
            newCell.accessoryType = .disclosureIndicator
        }
        
        return newCell
    }
    
    // MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == freeQuotes.count {
            buyPremiumQuotes()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - In App purchase methods
    
    func buyPremiumQuotes() {
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
        } else {
            print("Cannot make payments")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                showPremiumQuotes()
                
                SKPaymentQueue.default().finishTransaction(transaction)
            } else if transaction.transactionState == .failed {
                print("Transaction failed")
                
                if let error = transaction.error {
                    print("Error description: \(error.localizedDescription)")
                }
                
                SKPaymentQueue.default().finishTransaction(transaction)
            } else if transaction.transactionState == .restored {
                showPremiumQuotes()
                
                navigationItem.setRightBarButton(nil, animated: true)
                
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    
    func showPremiumQuotes() {
        UserDefaults.standard.set(true, forKey: productID)
        
        freeQuotes.append(contentsOf: premiunQuotes)
        tableView.reloadData()
    }
    
    func isPurchased() -> Bool {
        return UserDefaults.standard.bool(forKey: productID)
    }
    
    @IBAction func restorePress(_ sender: UIBarButtonItem) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}
