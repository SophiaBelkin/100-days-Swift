//
//  ViewController.swift
//  PinchToScale
//
//  Created by Sophia Lu on 6/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let size: CGFloat = 200
    /// anonymous closure
    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemPink
        return myView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubview()
    }

    private func loadSubview() {
        view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        myView.center = view.center
        addGesture()
    }
    
    private func addGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch))
        myView.addGestureRecognizer(pinchGesture)
       
    }
    
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed {
            let scale = gesture.scale
            myView.frame = CGRect(x: 0, y: 0, width: size * scale, height: size * scale)
            myView.center = view.center
        }
    }
}

