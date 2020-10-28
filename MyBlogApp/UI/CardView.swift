//
//  CardView.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI

struct CardView<ImageContent: View, AnimatedButton: View, Field: View>: View {
    var field: Field?
    var content: ImageContent
    var buttons: AnimatedButton
    @Binding var mode: CellType
    private let height: CGFloat = 300
    private let spacing: CGFloat = 12
    
    var body: some View {
        ZStack {
            content
            .frame(height: height)
                .cornerRadius(8)
            VStack(spacing: spacing) {
                HStack {
                    Button(action: {
                        print("profile hit")
                    }, label: {
                        Image(uiImage: Asset.image(asset: .profile))
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50, alignment: .center)
                    })
                    .padding()
                 // set the offset here...
                    Spacer()
                }
                Spacer()
               buttons
                if mode == .back {
                    field
                    .padding()
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
                }
            }
            .frame(height: height)
        }
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView<Color, AnimatedButton, BlogTextField>(
            content: Color.yellow,
            buttons: AnimatedButton(
                kind: .post,
                action: {}),
            mode: .constant(.back))
    }
}


