//
//  ContentView.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/16/20.
//

import SwiftUI

struct FeedView: View {
    @StateObject var vm = FeedViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.photoCollection, id: \.id) { item in
                    Cell().environmentObject(CellViewModel(model: item))
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
