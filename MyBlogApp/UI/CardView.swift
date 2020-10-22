//
//  CardView.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI


struct CardView<ImageContent: View>: View {
    let action: () -> Void
    var content: ImageContent
    @State var expanded: Bool
    @Binding var mode: CellType
    let kind: ButtonKind
    var body: some View {
        ZStack {
            content
            .frame(height: 300)
                .cornerRadius(8)
            VStack(spacing: 12) {
                Spacer()
                AnimatedButton(
                    kind: kind,
                    selected: expanded,
                    action: {
                        self.action()
                    })
                    .frame(width: 60, height: 60)
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
            action: {
                
            },
            content: Color.yellow,
            expanded: true,
            mode: .constant(.front),
            kind: .post)
    }
}


