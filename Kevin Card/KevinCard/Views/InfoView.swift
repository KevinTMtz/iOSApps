//
//  InfoView.swift
//  KevinCard
//
//  Created by Kevin Torres on 25/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

// MARK: - InfoView

struct InfoView: View {
    let imageName: String
    let textStr: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .frame(width: ScreenSizes.screenWidth * 0.7, height: 60, alignment: .center)
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 3, x: 0, y: 0)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(ScreenSizes.kevinColor)
                    Text(textStr)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
        )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(imageName: "person.fill", textStr: "Kevin Torres")
            .previewLayout(.sizeThatFits)
    }
}
