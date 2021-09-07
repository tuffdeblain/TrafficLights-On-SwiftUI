//
//  ContentView.swift
//  TrafficLights On SwiftUI
//
//  Created by Сергей Кудинов on 07.09.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}


struct ContentView: View {
    
    @State var currentLight = CurrentLight.red
    @State var buttonText = "Start"
    @State var redSatus = 0.3
    @State var yellowStatus = 0.3
    @State var greenStatus = 0.3
    let lightIsOn = 1.0
    let lightIsOff = 0.4
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack(spacing: -4) {
                        ColorCircle(color: .red, opacity: redSatus)
                        ColorCircle(color: .yellow, opacity: yellowStatus)
                            .padding()
                        ColorCircle(color: .green, opacity: greenStatus)
                    }
                Spacer()
                Button(action: {
                    if  buttonText  == "Start" {
                        buttonText = "Next"
                    }
                    
                    switch currentLight {
                    case .red:
                        redSatus = lightIsOn
                        greenStatus = lightIsOff
                        currentLight = .yellow
                    case .yellow:
                        yellowStatus = lightIsOn
                        redSatus = lightIsOff
                        currentLight = .green
                    case .green:
                        greenStatus = lightIsOn
                        yellowStatus = lightIsOff
                        currentLight = .red
                    }
                    
                }, label: {
                    Text(buttonText)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 230)
                                .stroke(Color.white, lineWidth: 5)
                        )
                        .clipShape(Capsule())
                        
                })
            }
        }
    }
}

//private var tapButton: some View {
//
//    Button(action: {
//        print("salam")
//        if  buttonText  == "Start" {
//            buttonText = "Next"
//        }
//
//        switch currentLight {
//        case .red:
//            redSatus = lightIsOn
//            greenStatus = lightIsOff
//            currentLight = .yellow
//        case .yellow:
//            yellowStatus = lightIsOn
//            redSatus = lightIsOff
//            currentLight = .green
//        case .green:
//            greenStatus = lightIsOn
//            yellowStatus = lightIsOff
//            currentLight = .red
//        }
//
//    }, label: {
//        Text(buttonText)
//            .bold()
//            .foregroundColor(.white)
//            .frame(width: 150, height: 50)
//            .background(Color.blue)
//
//            .overlay(
//                RoundedRectangle(cornerRadius: 230)
//                    .stroke(Color.white, lineWidth: 5)
//            )
//            .clipShape(Capsule())
//
//    })
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

