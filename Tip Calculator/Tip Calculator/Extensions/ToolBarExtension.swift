//
//  ToolBarExtension.swift
//  Tip Calculator
//
//  Created by Kevin Torres on 16/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

extension UIViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([space, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }
}
