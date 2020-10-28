//
//  TextField.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/23/20.
//

import SwiftUI

struct BlogTextField: View {
    var placeholder: Text = Text("Leave me a message 🤙🏻")
    @State var text: String = ""
    let editingChanged: (Bool) -> Void
    let commit: () -> Void
    
    var body: some View {
        makeView()
    }
}

private extension BlogTextField {
     func makeView() -> some View {
        ZStack(alignment: .leading) {
            Color(Asset.color(asset: .blogTextFieldBackground))
                if text.isEmpty {
                 placeholder.foregroundColor(.gray)
                    .padding(.leading)
                }
            HStack {
                TextField(
                    "",
                    text: $text,
                    onEditingChanged: { isEditing in
                        if !isEditing { hideKeyboard() }
                        editingChanged(isEditing)
                    },
                    onCommit: {
                        hideKeyboard()
                        commit()
                    })
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Button(action: {
                    hideKeyboard()
                    commit()
                }, label: {
                    Text("Send")
                        .foregroundColor(.white)
                })
                .padding(.trailing)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .cornerRadius(8)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        BlogTextField(editingChanged: {_ in}, commit: {})
    }
}
