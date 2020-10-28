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
    case third = 160
}

enum CellType {
    case front, back
}

struct Cell: View {
    @EnvironmentObject var vm: CellViewModel
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
            if vm.isExpanded {
                Color.clear
                    .frame(height: vm.offset.rawValue)
            }
        }
    }
}


private extension Cell {
    func backCard() -> some View {
        CardView(
            field: BlogTextField(
                editingChanged: {_ in},
                commit: {
                    withAnimation {
                        vm.comment()
                    }
                }),
            content:
                Color(vm.imageColor ?? Asset.color(asset: .cardSecondaryBackground)),
            buttons: BlogInteractionView(
                action: { type in
                    switch type {
                    case .like:
                        vm.like()
                    case .comment:
                        withAnimation {
                            vm.comment()
                        }
                    case .favorite:
                        vm.addToFavorites()
                    case .post:
                        break
                    }
                }),
            mode: $vm.mode)
            .offset(y: vm.offset.rawValue)
    }
    
    func frontCard() -> some View {
        CardView<KFImage, AnimatedButton, BlogTextField>(
            field: nil,
            content: vm.image.resizable(),
            buttons: AnimatedButton(kind: .post, action: {
                withAnimation {
                    vm.isExpanded.toggle()
                    if vm.doubleExpanded {
                        vm.doubleExpanded.toggle()
                        vm.mode =  .front
                    }
                    vm.offset = vm.isExpanded ? .second : .first
                }
            }),
            mode: .constant(.front)
        )
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell().environmentObject(CellViewModel(model: PhotoModel(id: "1", altDescription: "2", urls: URLS(regular: "3", small: "4", thumb: "5"))))
    }
}
