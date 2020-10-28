//
//  BlogOptionView.swift
//  MyBlogApp
//
//  Created by Oniel Rosario on 10/25/20.
//

import SwiftUI

struct BlogOptionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Profile")
                Text("Share")
                Text("Message")
                Text("Profile")
            }
            .padding()
            Spacer()
        }
        .background(Color.blue)
        .cornerRadius(8)
        .frame(width: 150)
    }
}

struct BlogOptionView_Previews: PreviewProvider {
    static var previews: some View {
        BlogOptionView()
    }
}
