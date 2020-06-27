//
//  ContentView.swift
//  Roll Dices SwiftUI
//
//  Created by Kevin Torres on 26/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State var leftDiceNum: Int = Int.random(in: 1...6)
    @State var rightDiceNum: Int = Int.random(in: 1...6)
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Dice")
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                    .font(.system(size: 70))
                
                Spacer()
                
                HStack {
                    DiceView(n: leftDiceNum)
                    DiceView(n: rightDiceNum)
                }
                
                Spacer()
                
                Button(action: {
                    self.leftDiceNum = Int.random(in: 1...6)
                    self.rightDiceNum = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 35))
                        .multilineTextAlignment(.center)
                        .lineLimit(-1)
                        .padding(.horizontal, 15.0)
                        .frame(width: 160.0, height: 70.0)
                }
                .background(Color(red: 0.12, green: 0.15, blue: 0.18))
                .cornerRadius(100)
                
//                Text("Or shake your phone")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 15))
//                    .padding()
            
                Spacer()
            }
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - DiceView

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .frame(width: 120, height: 120, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .padding(.horizontal)
    }
}
