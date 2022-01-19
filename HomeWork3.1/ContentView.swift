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
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
            VStack {
                redLed
                    .contrast(red)
                    .padding(.top, 20.0)
                yellowLed
                    .contrast(yellow)

                greenLed
                    .contrast(green)
                Spacer()
                ZStack {
                    rectangle
                    Button(action: { buttonAction()}) {
                        Text("START")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    func buttonAction() {
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
    
    private var redLed: some View {
        Circle()
            .foregroundColor(.red)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private var yellowLed: some View {
        Circle()
            .foregroundColor(.yellow)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private var greenLed: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private var rectangle: some View {
        Capsule()
            .foregroundColor(.blue)
            .frame(width: 150, height: 50)
            .overlay(Capsule().stroke(Color.white, lineWidth: 4))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
