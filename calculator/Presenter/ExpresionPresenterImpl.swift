//
//  ExpresionPresenterImpl.swift
//  calculator
//
//  Created by Magic Jammie on 10/16/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

final class ExpresionPresenterImp: ExpresionPresenter {
    private weak var view: ExpresionView?
    private let basickMath: BasikMath
    
    init(basikMath: BasikMath) {
          self.basickMath = basikMath
    }
    
    func attach(_ view: CalculateController) {
        self.view = view
    }
    
    func resolveExpresion() {
        
        guard let expresion = view?.currentExpresion else {
            view?.showAlert()
            return
        }
        
        let result = basickMath.resolve(expresion)
        view?.setExpresion(result)
    }
}
