//
//  Graph.swift
//  calculator
//
//  Created by Magic Jammie on 10/16/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

class Graph {
    private let basikMath: BasikMath
    init() {
        basikMath = BasikMathImpl()
    }
    func makeViewController() -> CalculateController {
        let presenter = ExpresionPresenterImp(basikMath: basikMath)
        let calulateView = CalculateController(presenter: presenter)
        presenter.attach(calulateView)
        return calulateView
    }
}
