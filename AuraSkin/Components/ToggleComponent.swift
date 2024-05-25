//
//  ToggleComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 24/05/24.
//

import SwiftUI

struct ToggleComponent: View {
    var text: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(text, isOn: $isOn)
            .frame(height: 45)
            .tint(.accentColor)
            .padding([.leading, .trailing], 15)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
            .padding(.bottom)
    }
}

#Preview {
    @State var isOn: Bool = true

    return ToggleComponent(text: "Currently used", isOn: $isOn)
}
