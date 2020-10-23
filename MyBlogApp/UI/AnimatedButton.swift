//
//  AnimatedButton.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI


enum ButtonKind {
    case like, comment, favorite, post
}

struct AnimatedButton: View, Identifiable {
    let id = UUID()
    @State var kind: ButtonKind
    @State var selected = false
    @State var action: () -> Void
    private let customFrame: CGFloat = 60
    
    var body: some View {
        Button(action: {
            selected.toggle()
            self.action()
        }, label: {
            if selected {
                makeButton()
                    .frame(
                        width: customFrame,
                        height: customFrame
                    )
            } else {
                makeButton()
                    .frame(
                        width: customFrame,
                        height: customFrame
                    )
            }
        })
    }
}

private extension AnimatedButton {
    @ViewBuilder func makeButton() -> some View {
        switch kind {
        case .post:
            LottieView(
                filename: selected ? "minus" : "plus"
            )
            .colorInvert()
        case .like:
            LottieView(
                filename: selected ? "heartAnimation" : "heartAnimationWhite"
            )
        case .comment:
            LottieView(
                filename: selected ? "comment" : "comment"
            )
        case .favorite:
            LottieView(
                filename: selected ? "star" : "starWhite"
            )
        }
    }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton(
            kind: .post,
            selected: true,
            action: {})
    }
}
