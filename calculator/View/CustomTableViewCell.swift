//
//  CustomTableViewCell.swift
//  calculator
//
//  Created by Magic Jammie on 10/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {

	let mainLabel = UILabel()
	let firstButton = UIButton()
	let secondButton = UIButton()
	let myTextLable = UILabel()
	
	init(id: String, text: String) {
		super.init(style: .default, reuseIdentifier: nil)
		addLabel()
		addFirstButton()
		addSecondButton()
		addTextLabel(text: text)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addLabel() {
		self.setupConstraints(label: mainLabel, topAnchor: self.topAnchor, botAnchor: self.bottomAnchor, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 16, trailingConst: -16, heightConst: nil, widthConst: nil)
	}

	private func addFirstButton() {
		let constY = NSLayoutConstraint(item: firstButton, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		mainLabel.setupConstraints(label: firstButton, topAnchor: nil, botAnchor: nil, leftAnchor: mainLabel.leadingAnchor, rightAnchor: nil, topConst: nil, botConst: nil, leadingConst: 8, trailingConst: nil, heightConst: 30, widthConst: 30)
		NSLayoutConstraint.activate([constY])
		firstButton.setImage(UIImage(named: "1"), for: .normal)
	}

	private func addSecondButton() {
		let constY = NSLayoutConstraint(item: secondButton, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		mainLabel.setupConstraints(label: secondButton, topAnchor: nil, botAnchor: nil, leftAnchor: nil, rightAnchor: mainLabel.trailingAnchor, topConst: nil, botConst: nil, leadingConst: nil, trailingConst: -4, heightConst: 30, widthConst: 30)
		NSLayoutConstraint.activate([constY])
		secondButton.setImage(UIImage(named: "2"), for: .normal)
	}
	
	private func addTextLabel(text: String) {
		myTextLable.text = text
		mainLabel.setupConstraints(label: myTextLable, topAnchor: mainLabel.topAnchor, botAnchor: mainLabel.bottomAnchor, leftAnchor: firstButton.trailingAnchor, rightAnchor: secondButton.leadingAnchor, topConst: 8, botConst: -8, leadingConst: 8, trailingConst: -4, heightConst: nil, widthConst: nil)
		myTextLable.lineBreakMode = NSLineBreakMode.byWordWrapping
		myTextLable.numberOfLines = 0
	}
}
