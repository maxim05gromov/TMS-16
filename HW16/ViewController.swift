//
//  ViewController.swift
//  HW16
//
//  Created by Максим Громов on 13.08.2024.
//

import UIKit

class ViewController: UIViewController {
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange, .cyan]
    let radius: CGFloat = 50
    
    lazy var circle = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.frame = .init(x: 0, y: 0, width: radius * 2, height: radius * 2)
        circle.layer.cornerRadius = radius
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showCircle))
        circle.addGestureRecognizer(recognizer)
        view.addSubview(circle)
        showCircle()
    }
    @objc func showCircle(){
        let maxX = view.frame.width - radius * 2
        let maxY = view.frame.height - radius * 2
        
        circle.frame.origin = .init(x: CGFloat.random(in: 0...maxX), y: CGFloat.random(in: 0...maxY))
        var colors = self.colors
        if let index = colors.firstIndex(of: circle.backgroundColor ?? UIColor.black){
            colors.remove(at: index)
        }
        circle.backgroundColor = colors.randomElement()
    }


}

