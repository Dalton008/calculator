//
//  MainModel.swift
//  calculator
//
//  Created by Magic Jammie on 10/15/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

enum ArithmeticSigns: Int {
	case plus = 0
	case minus = 1
	case division = 2
	case multiplication = 3
	static var count: Int { return ArithmeticSigns.multiplication.rawValue + 1 }
	
	var description: String {
		switch self {
		case .plus: return "+"
		case .minus: return "-"
		case .division: return "/"
		case .multiplication: return "*"
		}
	}
}

struct Expresion {
	let lshArgument: Int
	let rshArgument: Int
	let currentOperation: ArithmeticSigns
}
