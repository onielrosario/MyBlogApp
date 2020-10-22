//
//  Cell.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import SwiftUI
import KingfisherSwiftUI

enum OffsetState: CGFloat {
    case first = 0
    case second = 60
    case third = 120
}

struct Cell: View {
    let vm: CellViewModel
    @State var isExpanded = false
    @State var doubleExpanded = false
    @State var offset = OffsetState.first
    
    var body: some View {
        makeImage(isFavorite: vm.isFavorite)
    }
}

private extension Cell {
    func makeImage(isFavorite: Bool) -> some View {
        VStack {
            ZStack {
                ZStack {
                    Color.green
                    .frame(height: 300)
                        .cornerRadius(8)
                    VStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.doubleExpanded.toggle()
                                offset =  doubleExpanded ? .third : .second
                            }
                        }, label: {
                            Text("Double Expand")
                        })
                    }
                    .padding(.bottom, 30)
                    .frame(height: 300)
                    if doubleExpanded {
                        Color.clear
                            .frame(height: 60)
                    }
                    
                }
                .offset(y: offset.rawValue)
                
                ZStack {
                    //                KFImage(URL(string: vm.model.urls.small))
                    //                    .resizable()
                    Color.yellow
                        .cornerRadius(8)
                        .frame(height: 300)
                    VStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isExpanded.toggle()
                                if doubleExpanded {
                                    doubleExpanded.toggle()
                                }
                                self.offset =  isExpanded ? .second : .first
                            }
                        }, label: {
                            Text("Expand")
                        })
                    }
                    .padding(.bottom, 30)
                    .frame(height: 300)
                }
                
            }
//            if isExpanded {
                Color.clear
                    .frame(height: offset.rawValue)
//        }
        }
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(vm: CellViewModel(model: PhotoModel(id: "1", altDescription: "2", urls: URLS(regular: "3", small: "4", thumb: "5"))))
    }
}
