//
//  LottieView.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI
import Lottie



struct LottieView: UIViewRepresentable {
    @State var filename: String
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView , context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    typealias UIViewType = UIView
}
