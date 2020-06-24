//
//  Constants.swift
//  Messenger
//
//  Created by Kevin Torres on 23/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

struct Constants {
    static let appName = "Kevin Chat 📬"
    static let registerSegue = "RegisterToChat"
    static let logInSegue = "LogInToChat"
    
    static let cellIdentifier = "ReusableCell"
    
    static let cellNibName = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct Colors {
        static let defaultBlue = "defaultBlue"
    }
}
