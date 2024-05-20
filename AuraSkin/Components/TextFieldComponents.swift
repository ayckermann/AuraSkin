//
//  TextFieldComponents.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 19/05/24.
//

import SwiftUI

struct TextFieldComponents: View {
    @Binding var text: String
    var localizedStringKey: String = ""
    var prompt: String

    var body: some View {
        TextField(
            localizedStringKey,
            text: $text,
            prompt: Text(prompt)
        )
        .frame(height: 45)
        .padding(.horizontal, 15)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))

    }
}

#Preview {
    @State var text: String = ""
    return TextFieldComponents(text: $text, localizedStringKey: "product's name" , prompt: "product's name")
}
