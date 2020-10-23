//
//  Cell.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import SwiftUI

enum OffsetState: CGFloat {
    case first = 0
    case second = 60
    case third = 120
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
            content:
                Color(Asset.color(asset: .CardSecondaryBackground)),
            buttons: BlogInteractionView(
                action: { type in
                    if type == .like {
                        vm.like()
                    }
                    if type == .comment {
                        withAnimation {
                            vm.doubleExpanded.toggle()
                            vm.offset = vm.doubleExpanded ? .third : .second
                            vm.mode = vm.doubleExpanded ? .back : .front
                        }
                    }
                    if type == .favorite {
                        vm.addToFavorites()
                    }
                }),
            mode: $vm.mode)
            .offset(y: vm.offset.rawValue)
    }
    
    func frontCard() -> some View {
        CardView(
            content: vm.image.resizable(),
            buttons: AnimatedButton(
                kind: .post,
                action: {
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
