//
//  MainViewController.swift
//  calculator
//
//  Created by Magic Jammie on 10/11/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    var label = UILabel()
    var firstTextField = UITextField()
    var secondTextField = UITextField()
    
    enum arithmeticSigns {
        case plus, minus, division, multiplication
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myLabel()
        firstTextField = myTextField(textField: firstTextField, x: 60, y: 125, width: 120, height: 30, string: "first num")
        secondTextField = myTextField(textField: secondTextField, x: 230, y: 125, width: 120, height: 30, string: "second num")
    }

    private func myLabel()
    {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 100)
        label.textAlignment = NSTextAlignment.center
        label.text = "I'm a calculator"
        self.view.addSubview(label)
        label.backgroundColor = .white
    }
    
    private func myTextField(textField: UITextField, x: Int, y: Int, width: Int, height: Int, string: String) -> UITextField
    {
        var textFieldWork = textField
        let textFieldFrame = CGRect(x: x, y: y, width: width, height: height)
        textFieldWork = UITextField(frame: textFieldFrame)
        textFieldWork.borderStyle = UITextField.BorderStyle.roundedRect
//        firstTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldWork.textAlignment = .center
        textFieldWork.placeholder = string
        
        self.view.addSubview(textFieldWork)
        return textFieldWork
    }
    
    
}
