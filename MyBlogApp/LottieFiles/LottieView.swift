//
//  LottieView.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/22/20.
//

import SwiftUI
import Lottie



struct LottieView: UIViewRepresentable {
    let filename: String
    
    
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.frame = view.frame
        view.addSubview(animationView)
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView , context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    typealias UIViewType = UIView
}
