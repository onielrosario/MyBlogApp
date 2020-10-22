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
    @State var selected: Bool
    @State var action: () -> Void
    
    var body: some View {
        Button(action: {
            selected.toggle()
            self.action()
        }, label: {
            if selected {
                makeButton()
            } else {
                makeButton()
            }
        })
    }
}

private extension AnimatedButton {
    @ViewBuilder func makeButton() -> some View {
        switch kind {
        case .post:
            selected ? LottieView(filename: "minus").colorInvert() : LottieView(filename: "plus").colorInvert()
        case .like:
            LottieView(filename: selected ? "heartAnimation" : "heartAnimationWhite")
        case .comment:
            LottieView(filename: selected ? "comment" : "comment")
        case .favorite:
            LottieView(filename: selected ? "star" : "starWhite")
        }
    }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton(
            kind: .post,
            selected: true,
            action: {
                print("klk")
            })
    }
}
