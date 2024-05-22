//
//  ScanInstructionView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 20/05/24.
//

import SwiftUI

struct ScanInstructionView: View {
    
    @State var instructionIndex: Int = 1
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader{ proxy in
            ZStack{
                if instructionIndex == 1 {
                    ScanInstructionComponent(nextFunction: {
                        instructionIndex = 2
                    }, text: "Take a picture of your skincare Ingredients", arrow:.bottomRight, index: $instructionIndex)
                    .position(
                        x: proxy.frame(in: .named("camerabox")).midX,
                        y:proxy.frame(in: .named("camerabox")).midY - 200
                    )
                }
                else if instructionIndex == 2 {
                    ScanInstructionComponent(nextFunction: {
                        instructionIndex = 3
                    }, text: "Or import from your gallery", arrow: .bottomLeft, index: $instructionIndex)
                    .position(
                        x: proxy.frame(in: .named("photospicker")).minX + 170,
                        y:proxy.frame(in: .named("photospicker")).midY + 140
                    )
                    
                    
                }
                
                else if instructionIndex == 3 {
                    ScanInstructionComponent(nextFunction: {
                        instructionIndex = 0
                    }, text: "Or manually input ingredients", arrow: .bottomRight, index: $instructionIndex)
                    .position(
                        x: proxy.frame(in: .named("manualbutton")).minX + 230,
                        y:proxy.frame(in: .named("manualbutton")).midY + 140
                    )
                    .coordinateSpace(name: "instruction3")
                    
                }
                
                
                
                
            }
            
        }
        .onAppear(){
            if instructionIndex == 0{
                self.dismiss()
            }
        }
        
    }
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

#Preview {
    ScanInstructionView()
}
