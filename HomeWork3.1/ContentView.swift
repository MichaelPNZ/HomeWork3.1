//
//  ContentView.swift
//  HomeWork3.1
//
//  Created by Михаил Позялов on 19.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = 0.3
    @State private var yellow = 0.3
    @State private var green = 0.3
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .ignoresSafeArea()
            VStack {
                rgbLed
                    .foregroundColor(.red)
                    .contrast(red)
                rgbLed
                    .foregroundColor(.yellow)
                    .contrast(yellow)
                rgbLed
                    .foregroundColor(.green)
                    .contrast(green)
                Spacer()
                ZStack {
                    rectangle
                    Button(action: { buttonAction(); changeTextButton()}) {
                        Text(buttonText)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
    
    private var rgbLed: some View {
        Circle()
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }

    private var rectangle: some View {
        Capsule()
            .foregroundColor(.blue)
            .frame(width: 150, height: 50)
            .overlay(Capsule().stroke(Color.white, lineWidth: 4))
    }
    
    private func changeTextButton() {
        if buttonText == "START" {
            buttonText = "NEXT"
        }
    }
    
    private func buttonAction() {
        if red == 0.3 && yellow == 0.3 {
            red = 1.0
            green = 0.3
        } else if yellow == 0.3 {
            red = 0.3
            yellow = 1.0
        } else if green == 0.3 {
            yellow = 0.3
            green = 1.0
            red = 0.3
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
