//
//  TestButton.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI


//component example
struct TestButton: View{
    var text: String = ""
    
    var body: some View{
        Text(text)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .font(.headline)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Color.auraSkinPrimaryColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}


#Preview {
    TestButton(text: "Test")
}
