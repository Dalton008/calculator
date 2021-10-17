//
//  BaseMathImpl.swift
//  calculator
//
//  Created by Magic Jammie on 10/16/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

final class BasikMathImpl: BasikMath {
    
    func resolve(_ expresion: Expresion) -> Int {
        let result = expresion.currentOperation
        switch result {
            case .plus:
                return expresion.lshArgument + expresion.rshArgument
            case .minus:
                return expresion.lshArgument - expresion.rshArgument
            case .multiplication:
                return expresion.lshArgument * expresion.rshArgument
            case .division:
                return expresion.lshArgument / expresion.rshArgument
        }
    }
}
