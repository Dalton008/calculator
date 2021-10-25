//
//  TabBarController.swift
//  calculator
//
//  Created by Magic Jammie on 10/18/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

	private let calculateController: UIViewController
	private let tableController: UIViewController
	private let maketControler: UIViewController
	
	init(calculateController: UIViewController, tableController: UIViewController, maketControler: UIViewController) {
		self.calculateController = calculateController
		self.tableController = tableController
		self.maketControler = maketControler
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		calculateController.title = "Calculator"
		tableController.title = "Table"
		maketControler.title = "Maket"
		self.setViewControllers([calculateController, tableController, maketControler], animated: false)
	}
}
