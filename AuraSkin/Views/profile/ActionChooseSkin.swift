//
//  ActionChooseSkin.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 14/05/24.
//

import SwiftUI

struct ActionChooseSkin: View {
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        Button(action: {
            showingOptions = true
        }, label: {
            NavigationLink {
                Text("Skin Profile")
            } label: {
                HStack {
                    Image(systemName: "face.smiling.inverse")
                        .foregroundColor(.auroraGreen2)
                    VStack (alignment: .leading, content: {
                        Text("Skin Profile")
                        Spacer()
                            .frame(height: 3)
                        Text(selection)
                            .fontWeight(.light)
                            .font(.system(size: 12))
                            .foregroundStyle(.gray)
                    })
                }
            }
        })
        .confirmationDialog("Select Your Skin!", isPresented: $showingOptions, titleVisibility: .visible) {
            Button("Oily") {
                selection = "Oily"
            }

            Button("Dry") {
                selection = "Dry"
            }

            Button("Combination") {
                selection = "Combination"
            }
            
            Button("Normal") {
                selection = "Normal"
            }
        }
    }
}

#Preview {
    ActionChooseSkin()
}
