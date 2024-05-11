//
//  TestButton.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI


//component example
struct TestButton: View{
    var body: some View{
        Text("TEST")
            .font(.headline)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(width: 250)
            .padding()
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        
            
    }
}


#Preview {
    TestButton()
}
