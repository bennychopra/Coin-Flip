//
//  ContentView.swift
//  Coin Flip
//
//  Created by Benny Chopra on 11/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Coin Flip")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("Heads")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding()
                NavigationLink(destination: FlipView()) {
                    Text("Enter Coin Flipper")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
