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

	private var presenter: ExpresionPresenter?

	private let	topConstant: CGFloat = 20
	private let	heightConstant: CGFloat = 30

	private var expressionView = UIView()
	private lazy var firstTextField: UITextField = {
		return createTextField()
	}()
	private lazy var secondTextField: UITextField = {
		return createTextField()
	}()
	private lazy var buttonGetResult: UIButton = {
		var button = UIButton()
		button.backgroundColor = .blue
		button = UIButton(type: .roundedRect)
		button.setTitle("Get result", for: .normal)
		button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
		return button
	}()
	private var pickerArithmeticSigns = UIPickerView()
	private var resultLabel = UILabel()
	private var spinner = UIActivityIndicatorView()
	var currentExpresion: Expresion? {
		guard let lshArg = Int(firstTextField.text!), let rshArg = Int(secondTextField.text!), let currentOperation = currentOperation else { return nil }
		return Expresion(lshArgument: lshArg, rshArgument: rshArg, currentOperation: currentOperation)
	}

	init(presenter: ExpresionPresenter) {
		super.init(nibName: nil, bundle: nil)
		self.pickerArithmeticSigns = choiceUIElement()
		self.presenter = presenter
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func createTextField() -> UITextField {
		let textFieldView = UITextField()
		textFieldView.borderStyle = .roundedRect
		textFieldView.textAlignment = .center
		return textFieldView
	}

	private var currentOperation: ArithmeticSigns? {
		let operationNumber = pickerArithmeticSigns.selectedRow(inComponent: 0)
		return ArithmeticSigns.init(rawValue: operationNumber)
	}
	
	private func choiceUIElement() -> UIPickerView {
		pickerArithmeticSigns.delegate = self
		return pickerArithmeticSigns
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.setupConstraints(label: expressionView, topAnchor: view.topAnchor, botAnchor: nil, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 120, botConst: nil, leadingConst: 40, trailingConst: -40, heightConst: 200, widthConst: nil)
		expressionView.setupConstraints(label: firstTextField, topAnchor: expressionView.topAnchor, botAnchor: nil, leftAnchor: expressionView.leadingAnchor, rightAnchor: nil, topConst: topConstant, botConst: nil, leadingConst: 15, trailingConst: nil, heightConst: heightConstant, widthConst: 110)
		expressionView.setupConstraints(label: secondTextField, topAnchor: expressionView.topAnchor, botAnchor: nil, leftAnchor: nil, rightAnchor: expressionView.trailingAnchor, topConst: topConstant, botConst: nil, leadingConst: nil, trailingConst: -15, heightConst: heightConstant, widthConst: 110)
		expressionView.setupConstraints(label: pickerArithmeticSigns, topAnchor: expressionView.topAnchor, botAnchor: nil, leftAnchor: firstTextField.trailingAnchor, rightAnchor: secondTextField.leadingAnchor, topConst: 10, botConst: nil, leadingConst: 10, trailingConst: -10, heightConst: 50, widthConst: nil)
		createSpinner()
		getResultButton()
	}

	private func createSpinner() {
		spinner = UIActivityIndicatorView(style: .medium)
		spinner.color = UIColor.lightGray
		expressionView.addSubview(spinner)
		spinner.translatesAutoresizingMaskIntoConstraints = false
		expressionView.addConstraint(NSLayoutConstraint(item: spinner, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: expressionView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
		expressionView.addConstraint(NSLayoutConstraint(item: spinner, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: expressionView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
	}

	private func getResultButton() {
		view.setupConstraints(label: buttonGetResult, topAnchor: nil, botAnchor: expressionView.bottomAnchor, leftAnchor: expressionView.leadingAnchor, rightAnchor: expressionView.trailingAnchor, topConst: nil, botConst: -20, leadingConst: 60, trailingConst: -60, heightConst: 30, widthConst: nil)
	}

	@objc
	private func buttonDidTap() {
			self.presenter?.resolveExpresion()
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
}

extension CalculateController: ExpresionView {

	func showAlert() {
		let ac = UIAlertController(title: "Error", message: "Wrong value", preferredStyle: .alert)
		let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		ac.addAction(cancel)
		present(ac, animated: true, completion: nil)
	}

	func setExpresion(_ result: Int) {
		self.resultLabel.text = "\(result)"
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
			view.endEditing(true)
	}

	func spinnerStartAnimation() {
		self.spinner.startAnimating()
	}

	func spinnerStopAnimation() {
		self.spinner.stopAnimating()
	}
}
