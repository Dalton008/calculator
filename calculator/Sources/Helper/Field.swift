//
//  Field.swift
//  calculator
//
//  Created by Magic Jammie on 10/17/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

protocol Field: UIView {
	var text: String? { get set }
}

extension UITextField: Field {}
extension UILabel: Field {}
