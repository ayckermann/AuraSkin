//
//  TermsConditionView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 20/05/24.
//

import SwiftUI

struct TermsConditionView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Terms and Condition")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5)
                Text("Welcome to AuraSkin! These terms and conditions outline the rules and regulations for the use of AuraSkin. By using this app we assume you accept these terms and conditions. Do not continue to use AuraSkin if you do not agree to take all of the terms and conditions stated on this page. The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: 'Client', 'You' and 'Your' refers to you, the person log on this website and compliant to the Company’s terms and conditions. ")
                Text("License")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                Text("Unless otherwise stated, AuraSkin and/or its licensors own the intellectual property rights for all material on AuraSkin. All intellectual property rights are reserved. You may access this from AuraSkin for your own personal use subjected to restrictions set in these terms and conditions. \nYou must not: \n- Republish material from AuraSkin \n- Sell, rent or sub-license material from AuraSkin \n- Reproduce, duplicate or copy material from AuraSkin \n- Redistribute content from AuraSkin")
            }
            .padding(30)
        }
    }
}

#Preview {
    TermsConditionView()
}
