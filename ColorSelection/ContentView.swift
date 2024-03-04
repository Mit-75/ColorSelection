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
    
    var body: some View {
        ZStack{
            Color(.init(red: 0.1, green: 0.4, blue: 0.5))
                .ignoresSafeArea()
            VStack(spacing: 60) {
                Color.init(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                    .frame(height: 170)
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 5))
                VStack {
                    RedSlidersView(sliderValue: $redSliderValue)
                        .tint(.red)
                    RedSlidersView(sliderValue: $greenSliderValue)
                        .tint(.green)
                    RedSlidersView(sliderValue: $blueSliderValue)
                        .tint(.blue)
                }
                Spacer()
            }
            .padding(10)
        }
    }
}

#Preview {
    ContentView()
}

struct RedSlidersView: View {
    @Binding var sliderValue: Double
    @State private var valueTF: String = "123"
    var body: some View {
        HStack() {
            Text(lround(sliderValue).formatted())
                .frame(width: 55)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .foregroundStyle(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 1))
            Slider(value: $sliderValue, in: 1...255, step: 1)
            TextField("", text: $valueTF)
                .textFieldStyle(.roundedBorder)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .frame(width: 55, height: 40)
        }
    }
}
