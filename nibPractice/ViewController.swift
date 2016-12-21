//
//  ViewController.swift
//  nibPractice
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyboardCard: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        storyboardCard.topLabel?.text = "K"
        storyboardCard.topLabel?.textColor = .white
        storyboardCard.bottomLabel?.text = storyboardCard.topLabel.text
        storyboardCard.bottomLabel?.textColor = storyboardCard.topLabel?.textColor
        storyboardCard.bottomLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
        
        storyboardCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        storyboardCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 222).isActive = true
        
        storyboardCard.translatesAutoresizingMaskIntoConstraints = false
    }
}

