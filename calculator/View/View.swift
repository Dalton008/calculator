//
//  View.swift
//  calculator
//
//  Created by Magic Jammie on 10/15/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class CalculateController: UIViewController {
        
    var presenter: ExpresionPresenter?
    
    var label = UILabel()
    var firstTextField = UITextField()
    var secondTextField = UITextField()
    var buttonGetResult = UIButton()
    private var pickerArithmeticSigns = UIPickerView()
    var pickerTextField = UITextField()
    var resultLabel = UILabel()
    var spinner = UIActivityIndicatorView()
    var currentExpresion: Expresion? {
        guard let lshArg = Int(firstTextField.text!), let rshArg = Int(secondTextField.text!), let currentOperation = currentOperation else { return nil }
        return Expresion(lshArgument: lshArg, rshArgument: rshArg, currentOperation: currentOperation)
    }
        
    init(presenter: ExpresionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currentOperation: ArithmeticSigns? {
        let operationNumber = pickerArithmeticSigns.selectedRow(inComponent: 0)
        return ArithmeticSigns.init(rawValue: operationNumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        firstTextField = myTextField(textField: firstTextField, x: 60, y: 125, width: 120, height: 30, string: "first num")
        secondTextField = myTextField(textField: secondTextField, x: 230, y: 125, width: 120, height: 30, string: "second num")
        spinner = createSpinner()
        getResultButton()
        resultLabel.frame = CGRect(x: 150, y: 250, width: 120, height: 30)
        self.view.addSubview(resultLabel)
        pickerArithmeticSigns = choiceUIElement()
        myLabel()
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
    
    private func myLabel()
    {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        label.center = CGPoint(x: 100, y: 100)
        label.textAlignment = NSTextAlignment.center
        label.text = "I'm a calculator"
        self.view.addSubview(label)
        label.backgroundColor = .white
    }
    
    func createSpinner() -> UIActivityIndicatorView
    {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.frame = CGRect(x: 190, y: 160, width: 40, height: 40)
        spinner.color = UIColor.lightGray
        self.view.addSubview(spinner)
        return spinner
    }
    
    @objc
    private func buttonDidTap() {
        spinner.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.presenter?.resolveExpresion()
            self.spinner.stopAnimating()
        }
    }
    
    private func getResultButton()
    {
        buttonGetResult = UIButton(type: .roundedRect)
        buttonGetResult.frame = CGRect(x: 145, y: 200, width: 120, height: 30)
        buttonGetResult.setTitle("Get result", for: .normal)
        buttonGetResult.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        self.view.addSubview(buttonGetResult)
    }
    
    func choiceUIElement() -> UIPickerView {
        var picker = UIPickerView()
        picker = UIPickerView(frame: CGRect(x: 190, y: 120, width: 35, height: 40))
        picker.dataSource = self
        picker.delegate = self
        pickerTextField.inputView = picker
        self.view.addSubview(picker)
        return picker
    }
}

extension CalculateController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ArithmeticSigns.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ArithmeticSigns(rawValue: row)?.description
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = ArithmeticSigns(rawValue: row)?.description
    }
}

extension CalculateController: ExpresionView {
    
    func showAlert(){
        let ac = UIAlertController(title: "Error", message: "Wrong value", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
    func setExpresion(_ result: Int){
        self.resultLabel.text = "\(result)"
    }
}
