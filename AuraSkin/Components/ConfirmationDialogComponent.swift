//
//  ConfirmationDialogComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 25/05/24.
//

import SwiftUI

struct ConfirmationDialogComponent: View {
    @Binding var selectedOption: String
    @State private var showingOptions: Bool = false

    var confirmationDialogTitle: String
    var items: [String]

    var body: some View {
        Button {
            showingOptions = true
        } label: {
            HStack {
                Text(selectedOption)

                Spacer()

                Image(systemName: "chevron.down")
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            .frame(height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1)
            )
        }
        .onAppear {
            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .accent
        }
        .confirmationDialog(confirmationDialogTitle, isPresented: $showingOptions, titleVisibility: .visible) {
            ForEach(items, id: \.self) { item in
                Button(item) {
                    selectedOption = item
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    @State var selectedOptions: String = "Facial Wash"
    
    return ConfirmationDialogComponent(selectedOption: $selectedOptions, confirmationDialogTitle: "Select category", items: productCategory)
}
