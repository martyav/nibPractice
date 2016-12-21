//
//  Card.swift
//  nibPractice
//
//  Created by Marty Avedon on 12/20/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class Card: UIView {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let view = Bundle.main.loadNibNamed("Card", owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.frame = self.bounds
            
            backgroundColor = .black
            
            layer.cornerRadius = 5.0
            layer.masksToBounds = true
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.black.cgColor
            
            heightAnchor.constraint(equalToConstant: 150).isActive = true
            widthAnchor.constraint(equalToConstant: 107).isActive = true
            
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
