//
//  DividerWithSize.swift
//  KevinCard
//
//  Created by Kevin Torres on 25/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

// MARK: - DividerWithSize

struct DividerWithSize: View {
    let heigthDiv: CGFloat
    let colorDiv: Color
    
    var body: some View {
        Rectangle()
            .frame(width: ScreenSizes.screenWidth * 0.7, height: heigthDiv, alignment: .center)
            .foregroundColor(colorDiv)
    }
}

struct DividerWithSize_Previews: PreviewProvider {
    static var previews: some View {
        DividerWithSize(heigthDiv: 30, colorDiv: ScreenSizes.kevinColor)
            .previewLayout(.sizeThatFits)
    }
}
