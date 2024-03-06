//
//  ContentView.swift
//  ColorSelection
//
//  Created by Dmitry Parhomenko on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var displayText = "###"
    
    var body: some View {
        ZStack{
            Color(.init(red: 0.1, green: 0.4, blue: 0.5))
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Color.init(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                .frame(height: 170)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 5))
                Text(displayText)
                    .frame(width: 300, height: 45)
                    .font(.system(.title3, design: .rounded, weight: .heavy))
                    .foregroundStyle(.white)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 1))
                    
                VStack {
                    SlidersView(sliderValue: $redSliderValue)
                        .tint(.red)
                    SlidersView(sliderValue: $greenSliderValue)
                        .tint(.green)
                    SlidersView(sliderValue: $blueSliderValue)
                        .tint(.blue)
                    ButtonView()
                }
                Spacer()
            }
            .padding(15)
        }
    }
}

#Preview {
    ContentView()
}

struct SlidersView: View {
    @Binding var sliderValue: Double
    @State private var valueTF: String = ""
    var body: some View {
        HStack() {
            Text(lround(sliderValue).formatted())
                .frame(width: 55)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .foregroundStyle(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 1))
            Slider(
                value: $sliderValue,
                in: 1...255,
                step: 1) { editing in
                    valueTF = lround(sliderValue).formatted()
                }
            TextField("", text: $valueTF)
                .textFieldStyle(.roundedBorder)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .frame(width: 55, height: 40)
        }
    }
    private func getDisplayText() {
        
    }
}

struct ButtonView: View {
    var body: some View {
        Button(action: {})  {
            Text("Done")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .frame(width: 100, height: 45)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.white, lineWidth: 3))
        .shadow(radius: 10)
        .padding(25)
    }
    
}
