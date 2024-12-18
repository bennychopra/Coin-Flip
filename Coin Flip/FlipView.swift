//
//  FlipView.swift
//  Coin Flip
//
//  Created by Benny Chopra on 12/17/24.
//

import SwiftUI

struct FlipView: View {
    @State private var coinSide = "Heads"
    @State private var isFlipping = false
    @State private var rotation = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            
            ZStack {
                Image("Heads")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
                    .opacity(coinSide == "Heads" ? 1 : 0)

                Image("Tails")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.brown)
                    .opacity(coinSide == "Tails" ? 1 : 0)
            }
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.easeInOut(duration: 0.8), value: rotation)
            
            
            Button(action: {
                flipCoin()
            }) {
                Text("Flip The Coin")
                    .font(.title2)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .disabled(isFlipping)

            
            Text("Result: \(coinSide)")
                .font(.title2)
                .bold()
        }
        .padding()
    }

    func flipCoin() {
        if !isFlipping {
            isFlipping = true
            withAnimation {
                rotation += 720
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                coinSide = Bool.random() ? "Heads" : "Tails"
                isFlipping = false
            }
        }
    }
}

#Preview {
    FlipView()
}
