//
//  MainViewController.swift
//  calculator
//
//  Created by Magic Jammie on 10/11/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    var firstTextFieldText = Int()
    var secondTextFieldText = Int ()
    var result = Int()
    
    var label = UILabel()
    var firstTextField = UITextField()
    var secondTextField = UITextField()
    var resultTextField = UILabel()
    var buttonGetResult = UIButton()
    var pickerArithmeticSigns = UIPickerView()
    
    
    
//    enum arithmeticSigns: String,  {
//        case plus = "+"
//        case minus = "-"
//        case division = "/"
//        case multiplication = "*"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myLabel()
        firstTextField = myTextField(textField: firstTextField, x: 60, y: 125, width: 120, height: 30, string: "first num")
        secondTextField = myTextField(textField: secondTextField, x: 230, y: 125, width: 120, height: 30, string: "second num")
        getResultButton()
        self.view.addSubview(resultTextField)
        pickerArithmeticSigns = UIPickerView(frame: CGRect(x: 190, y: 120, width: 35, height: 40))
//        pickerArithmeticSigns.center = view.center
        pickerArithmeticSigns.dataSource = self
        pickerArithmeticSigns.delegate = self
        self.view.addSubview(pickerArithmeticSigns)
        
    }

    private func myLabel()
    {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
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
        textFieldWork.textAlignment = .center
        textFieldWork.placeholder = string
        
        self.view.addSubview(textFieldWork)
        return textFieldWork
    }
    
    private func getResultButton()
    {
        buttonGetResult = UIButton(type: .roundedRect)
        buttonGetResult.frame = CGRect(x: 145, y: 200, width: 120, height: 30)
        buttonGetResult.setTitle("Get result", for: .normal)
        buttonGetResult.addTarget(self, action: #selector(operation), for: .touchUpInside)
        self.view.addSubview(buttonGetResult)
    }
    
    @objc private func operation()
    {
        self.firstTextFieldText = Int(firstTextField.text!)!
        self.secondTextFieldText = Int(secondTextField.text!)!
        self.result = self.firstTextFieldText + self.secondTextFieldText
        
//        var result = firstTextFieldText + secondTextFieldText
    }
}

protocol Printable {
    var description: String { get }
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate
{

//    @IBOutlet weak var pickerView: UIPickerView!
    
    enum ArithmeticSigns: Int, Printable {
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ArithmeticSigns(rawValue: row)?.description
    }
    
}

//extension MainViewController: UIPickerViewDelegate
//{
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return ArithmeticSigns(raw)
//    }
//}
