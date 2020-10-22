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
    
    
    func lotties() -> (LottieView, LottieView) {
        switch self {
        case .front:
            return (LottieView(filename: "minus"), LottieView(filename: "plus") )
        default:
            return (LottieView(filename: "comment"), LottieView(filename: "comment") )
        }
    }
}



struct Cell: View {
    let vm: CellViewModel
    @State var isExpanded = false
    @State var doubleExpanded = false
    @State var offset = OffsetState.first
    @State var mode = CellType.none
    
    var body: some View {
        makeImage(isFavorite: vm.isFavorite)
    }
}

private extension Cell {
     func makeImage(isFavorite: Bool) -> some View {
        VStack {
            ZStack {
                CardView(action: {
                    self.doubleExpanded.toggle()
                    withAnimation {
                        mode = doubleExpanded ? .back : .none
                        offset = doubleExpanded ? .third : .second
                    }
                },
                content: Color.green,
                expanded: doubleExpanded,
                mode: $mode, kind: .comment)
                .offset(y: offset.rawValue)
                
                CardView(
                    action: {
                    withAnimation {
                        self.isExpanded.toggle()
                        if doubleExpanded {
                            doubleExpanded.toggle()
                            mode = .none
                        }
                        self.offset = isExpanded ? .second : .first
                    }
                },
                    content:
                    //                    KFImage(URL(string: vm.model.urls.small))
                    //                    .resizable()
                    Color.yellow,
                expanded: isExpanded,
                mode: .constant(.front),
                    kind: .post
                )
            }
            if isExpanded {
                Color.clear
                    .frame(height: offset.rawValue)
                
            }
        }
    }
}


        
        
        struct Cell_Previews: PreviewProvider {
            static var previews: some View {
                Cell(vm: CellViewModel(model: PhotoModel(id: "1", altDescription: "2", urls: URLS(regular: "3", small: "4", thumb: "5"))))
            }
        }
