//
//  ViewController.swift
//  Marathon6
//
//  Created by Diyor Tursunov on 18/11/24.
//

import UIKit

class ViewController: UIViewController {
    let animator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.6)
    
    let square = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        square.backgroundColor = .systemBlue
        square.layer.cornerRadius = 10
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.widthAnchor.constraint(equalToConstant: 100),
            square.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_: )))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        animator.addAnimations {
            self.square.center = gestureRecognizer.location(in: gestureRecognizer.view)
            self.square.transform = .identity.rotated(by: .pi / 8)
        }
        
        animator.addAnimations({
            self.square.transform = .identity
        }, delayFactor: 0.3)

        animator.startAnimation()
    }

}

