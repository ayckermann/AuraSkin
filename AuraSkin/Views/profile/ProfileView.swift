//
//  ProfileView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingOptions = false
//    @State private var selection = "None"
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .none
    @AppStorage("isFirstTimeUser") var isFirstTimeUser: Bool = true

    
    var body: some View {
        
        NavigationStack {
            VStack {
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
                        .padding(.bottom, 100)
                    
                }
                .containerRelativeFrame([.horizontal])
                .background(.auroraGreen2)

                List {
                    Section {
                        ActionChooseSkin()
                            .foregroundStyle(.black)
                        navProfileList(img: "person.fill", title: "Check Your Skin", detail: "Quiz for determine your skin type", view: QuizView(quizFrom: .profile))
                    }
                    
                    Section {
                        navProfileList(img: "exclamationmark.triangle.fill", title: "Medical Disclaimer", detail: "Detail", view: MedicalDisclaimerView())
                        navProfileList(img: "checkmark.seal.fill", title: "Terms and Condition", detail: "Detail", view: TermsConditionView())
                    }
                    
                    Button(action: {
                        skinTypePersistance = .none
                        isFirstTimeUser =  true
                    }, label: {
                        Text("Reset skin tyoe")
                    })
                }
                .scrollContentBackground(.hidden)
                .offset(y: -80)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }

                            
        }

    }
    
    @ViewBuilder
    func navProfileList(img: String, title: String, detail: String, view: some View) -> some View {
        NavigationLink(destination: view) {
            HStack {
                Image(systemName: img)
                    .foregroundColor(.auroraGreen2)
                VStack(alignment: .leading) {
                    Text(title)
                    Spacer().frame(height: 3)
                    Text(detail)
                        .fontWeight(.light)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
