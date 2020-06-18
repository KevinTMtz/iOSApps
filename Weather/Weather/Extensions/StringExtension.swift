//
//  StringExtension.swift
//  Weather
//
//  Created by Kevin Torres on 17/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
