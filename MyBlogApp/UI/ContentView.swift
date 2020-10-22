//
//  ContentView.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.photoCollection, id: \.id) { item in
                    Cell(vm: CellViewModel(model: item))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
