//
//  ContentView.swift
//  ColorSelection
//
//  Created by Dmitry Parhomenko on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue: Double = 40
    @State private var greenSliderValue: Double = 120
    @State private var blueSliderValue: Double = 60
    
    var body: some View {
        ZStack{
            Color(.init(red: 0.1, green: 0.4, blue: 0.5))
                .ignoresSafeArea()
            VStack(spacing: 50) {
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
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}

struct RedSlidersView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack() {
            Text(sliderValue.formatted())
                .frame(width: 55)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .foregroundStyle(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 2))
            Slider(value: $sliderValue, in: 1...255, step: 1)
        }
    }
}
