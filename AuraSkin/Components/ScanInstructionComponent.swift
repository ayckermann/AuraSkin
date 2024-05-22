//
//  ScanInstructionComponent.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 20/05/24.
//

import SwiftUI

enum ArrowAlignment {
    case bottomLeft
    case bottomMid
    case bottomRight
}


struct ScanInstructionComponent: View {
    var nextFunction: () -> Void
    var text: String
    var arrow: ArrowAlignment
    
    
    @Binding var index: Int

    var body: some View {
        
        ZStack {
            SpeechBubble(cornerRadius: 16, arrowAlignment: arrow)
                .fill(.greenAccent)
                .frame(width: 250)
                .frame(maxHeight: 120)

            VStack {
                Text(text)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    
                HStack {
                    Button(action: {
                        nextFunction()
                    }, label: {
                        Text(index != 3 ? "Next" : "Got it!")
                            .foregroundStyle(.black)
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    })
                    
                    Spacer()
                    
                    PageControl(item: 3, index: $index)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
            .frame(maxWidth: 250)
            
        }
    }
}


struct SpeechBubble: Shape {
    let cornerRadius: CGFloat
    let arrowAlignment: ArrowAlignment

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start drawing the bubble
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        
        // Top left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        
        // Left side
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius))
        
        // Bottom left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        // Bottom side with arrow
        switch arrowAlignment {
        case .bottomLeft:
            path.addLine(to: CGPoint(x: rect.minX + 20, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + 30, y: rect.maxY + 10))
            path.addLine(to: CGPoint(x: rect.minX + 40, y: rect.maxY))
            
        case .bottomMid:
            let arrowMid = rect.midX
            path.addLine(to: CGPoint(x: arrowMid - 10, y: rect.maxY))
            path.addLine(to: CGPoint(x: arrowMid, y: rect.maxY + 10))
            path.addLine(to: CGPoint(x: arrowMid + 10, y: rect.maxY))
            
        case .bottomRight:
            path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX - 30, y: rect.maxY + 10))
            path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.maxY))
        }
        
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
        
        // Bottom right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        // Right side
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius))
        
        // Top right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
        
        // Top side
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        
        return path
    }
}

struct PageControl: View {
    var item: Int
    @Binding var index: Int

    var body: some View {
        HStack {
            ForEach(1...item, id: \.self) { i in
                if i == index {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 8)
                        .foregroundStyle(.white)
                } else {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 8)
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(15)
    }
}

#Preview {
    ScanInstructionComponent(nextFunction: testButton, text: "Or manually input ingredients", arrow: .bottomMid, index: .constant(1))
}


