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

enum CellType {
    case front, back, none
}

struct Cell: View {
    let vm: CellViewModel
    @State var isExpanded = false
    @State var doubleExpanded = false
    @State var offset = OffsetState.first
    @State var mode = CellType.none
    
    var body: some View {
        makeImage()
    }
}

private extension Cell {
    func makeImage() -> some View {
        VStack {
            ZStack {
                backCard()
                frontCard()
            }
            if isExpanded {
                Color.clear
                    .frame(height: offset.rawValue)
                
            }
        }
    }
}


private extension Cell {
    func backCard() -> some View {
        CardView(
            content: Color(Asset.color(asset: .CardSecondaryBackground)),
            buttons: BlogInteractionView(
                action: { index in
                    if index == 1 {
                        withAnimation {
                            doubleExpanded.toggle()
                            offset = doubleExpanded ? .third : .second
                            mode = doubleExpanded ? .back : .none
                        }
                    }
                }),
            mode: $mode)
            .offset(y: offset.rawValue)
    }
    
    func frontCard() -> some View {
        CardView(
            content:
                ZStack {
                    KFImage(URL(string: vm.model.urls.small))
                        .resizable()
                },
            buttons: AnimatedButton(
                kind: .post,
                action: {
                    withAnimation {
                        isExpanded.toggle()
                        if doubleExpanded {
                            doubleExpanded.toggle()
                            mode =  .none
                        }
                        offset = isExpanded ? .second : .first
                    }
                }),
            mode: .constant(.front)
        )
    }
    
    
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(vm: CellViewModel(model: PhotoModel(id: "1", altDescription: "2", urls: URLS(regular: "3", small: "4", thumb: "5"))))
    }
}
