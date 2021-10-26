//
//  ExpresionView.swift
//  calculator
//
//  Created by Magic Jammie on 10/16/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

protocol ExpresionView: AnyObject {
	var currentExpresion: Expresion? { get } // nil если в однои из полей не цифры ил	 пусто
	func setExpresion(_ result: Int)
	func showAlert()
	func spinnerStartAnimation()
	func spinnerStopAnimation()
}
