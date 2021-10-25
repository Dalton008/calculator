//
//  Graph.swift
//  calculator
//
//  Created by Magic Jammie on 10/16/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class Graph {
	private let basikMath: BasikMath

	init() {
		basikMath = BasikMathImpl()
	}

	func makeViewController() -> UIViewController {
		TabBarController(calculateController: makeCalculateController(), tableController: TableController(), maketControler: MaketController())
	}

	func makeCalculateController() -> UIViewController {
		let presenter = ExpresionPresenterImp(basikMath: basikMath)
		let calulateView = CalculateController(presenter: presenter)
		presenter.attach(calulateView)
		return calulateView
	}
}
