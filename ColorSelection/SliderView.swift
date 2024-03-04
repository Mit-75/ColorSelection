//
//  SliderView.swift
//  ColorSelection
//
//  Created by Dmitry Parhomenko on 04.03.2024.
//

import SwiftUI

struct SliderView: View {
    @State private var sliderValue: Double = 100
    let trackColor: Color
    var body: some View {
        HStack() {
            Text(sliderValue.formatted())
                .frame(width: 55)
                .font(.system(.title3, design: .rounded, weight: .heavy))
                .foregroundStyle(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2))
            Slider(value: $sliderValue, in: 1...255, step: 1)
                .tint(trackColor)
                
        }
    }
}
#Preview {
    SliderView(trackColor: .blue)
}
