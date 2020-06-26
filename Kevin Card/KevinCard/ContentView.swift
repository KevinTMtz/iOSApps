//
//  ContentView.swift
//  KevinCard
//
//  Created by Kevin Torres on 25/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

// MARK: - ScreenSizes

struct ScreenSizes{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    static let kevinColor = Color(red: 0.43, green: 0.33, blue: 0.82)
}


// MARK: - ContentView

struct ContentView: View {
    var body: some View {
        ZStack {
            ScreenSizes.kevinColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("WWDC")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .shadow(color: Color.black, radius: 5, x: 0, y: 0)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Kevin Torres")
                    .font(Font.custom("Lalezar-Regular", size: 50))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Software Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                DividerWithSize(heigthDiv: 20, colorDiv: ScreenSizes.kevinColor)
                
                InfoView(imageName: "envelope.fill", textStr: "torresmtzkevin@gmail.com")
                DividerWithSize(heigthDiv: 5, colorDiv: ScreenSizes.kevinColor)
                InfoView(imageName: "person.fill", textStr: "LinkedIn: kevintorresmtz")
                DividerWithSize(heigthDiv: 5, colorDiv: ScreenSizes.kevinColor)
                InfoView(imageName: "person.fill", textStr: "Codeforces: KevinTMtz")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
