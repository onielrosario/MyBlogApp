//
//  CardView.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI


struct CardView<ImageContent: View, Button: View>: View {
    var content: ImageContent
    var buttons: Button
    @Binding var mode: CellType
    var body: some View {
        ZStack {
            content
            .frame(height: 300)
                .cornerRadius(8)
            VStack(spacing: 12) {
                Spacer()
               buttons
                if mode == .back {
                    Text("Im here")
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .padding(.bottom, 2)
                        .transition(.asymmetric(insertion: .scale, removal: .scale))
                }
            }
            .frame(height: 300)
        }
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(
            content: Color.yellow,
            buttons: AnimatedButton(
                kind: .post,
                action: {
                    
                }),
            mode: .constant(.back))
    }
}


