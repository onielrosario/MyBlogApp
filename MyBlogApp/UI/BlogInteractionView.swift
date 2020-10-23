//
//  BlogInteractionView.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI

struct BlogInteractionView: View {
    let types = [ButtonKind.like, .comment, .favorite]
    let action: (ButtonKind) -> Void
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(types.indices, id: \.self) { index in
                makeButton(
                    type: types[index],
                    action: {
                    action(types[index])
                })
                Spacer()
            }
        }
    }
}

extension BlogInteractionView {
    
    func makeButton(
        type: ButtonKind,
        action: @escaping () -> Void
    ) -> some View {
        AnimatedButton(
            kind: type,
            action: {
              action()
            })
            .frame(width: 60, height: 60)
    }
}

struct BlogInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        BlogInteractionView(action: { _ in
            
        })
    }
}
