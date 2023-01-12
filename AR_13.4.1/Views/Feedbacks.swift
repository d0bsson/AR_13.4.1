//
//  Feedback.swift
//  AR_13.4.1
//
//  Created by Дэвид Бердников on 08.01.2023.
//

import SwiftUI

struct Feedbacks: View {
    
    private let feedbacks = Feedback.getFeedbacks()
    
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                VStack {
                    FeedbackExample()
                    FeedbackExample()
                    FeedbackExample()
                    FeedbackExample()
                    FeedbackExample()
                }
                .frame(alignment: .bottom)
            }
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedbacks()
    }
}

struct FeedbackExample: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: WIDTH - 8, height: HEIGHT/5, alignment: .bottom)
                .foregroundColor(.whiteAR)
                .addBorder(.red, width: 3, cornerRadius: 20)
            
        }
    }
}

extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }
