//
//  UIView+extensions.swift
//  calculator
//
//  Created by Magic Jammie on 10/17/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func createField(
		field: Field,
		topConst: CGFloat,
		leftConst: CGFloat,
		widthConst: CGFloat,
		heightConst: CGFloat,
		text: String = "",
		backgroundColor: UIColor
	) {
		field.backgroundColor = backgroundColor
		field.text = text
		field.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(field)
		
        let top = NSLayoutConstraint(item: field, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: topConst)
        
        let left = NSLayoutConstraint(item: field, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: leftConst)
        
        let width = NSLayoutConstraint(item: field, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: widthConst)
         
        let heigh = NSLayoutConstraint(item: field, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: heightConst)
        
        let constrains: [NSLayoutConstraint] = [top, width, heigh, left]
        
        NSLayoutConstraint.activate(constrains)
	}
}
