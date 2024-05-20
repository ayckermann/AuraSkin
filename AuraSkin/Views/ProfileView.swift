//
//  ProfileView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("Hi, Aurora!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.all, 25)
                    .foregroundColor(.auroraGreen4)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.auroraGreen4)
                    .padding(.bottom, 40)
            }
            .containerRelativeFrame([.horizontal])
            .background(.auroraGreen2)
            
            List {
                Section {
                    ActionChooseSkin()
                }
                
                NavigationLink {
                    MedicalDisclaimerView()
                } label: {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.auroraGreen2)
                        VStack (alignment: .leading, content: {
                            
                            Text("Medical Disclaimer")
                            Spacer()
                                .frame(height: 3)
                            Text("Detail")
                                .fontWeight(.light)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        })
                    }
                }
                
                NavigationLink {
                    TermsConditionView()
                } label: {
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.auroraGreen2)
                        VStack (alignment: .leading, content: {
                            
                            Text("Terms and Condition")
                            Spacer()
                                .frame(height: 3)
                            Text("Detail")
                                .fontWeight(.light)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        })
                    }
                }
            }
        } detail: {
            Text("Select Profile")
        }
    }
}


#Preview {
    ProfileView()
}
