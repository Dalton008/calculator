//
//  MaketController.swift
//  calculator
//
//  Created by Magic Jammie on 10/19/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class MaketController: UIViewController {

	private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: 1102)
	
	private var scrollView = UIScrollView()
	private var containerView = UIView()
	
	private let mainTopLabel = UILabel()
	private let mainTitle = UILabel()
	private let mainTitleName = UILabel()
	private let mainSaveButton = UIButton()

	private let labelForTabbar = UILabel()
	private let mainTabbar = UILabel()
	private var introButton = UIButton()
	private var ingredientsButton = UIButton()
	private var stepsButton = UIButton()
	
	private let introView = UIView()
	private let ingredientsView = UIView()
	private let stepsView = UIView()
	
	private let titleMenuNameLabel = UILabel()
	private let titleName = UILabel()
	private let menuName = UILabel()
	
	private let cookTimeLabel = UILabel()
	private let cookTime = UILabel()
	private let minutesLabel = UILabel()
	private let minutes = UILabel()
	private let minutesNum = UILabel()
	private let hoursLabel = UILabel()
	private let hours = UILabel()
	private let hoursNum = UILabel()
	
	private let imageLabel = UILabel()
	private var imageView = UIImageView()
	private let pencilButton = UIButton()
	
	private let descriptionLabel = UILabel()
	private let descTitle = UILabel()
	private let desc = UILabel()
	
	private let difServeLabel = UILabel()
	private let difLable = UILabel()
	private let difTitle = UILabel()
	private let difName = UILabel()
	private let serveeLable = UILabel()
	private let serveTitle = UILabel()
	private let countPeople = UILabel()
	
	private let toggleLable = UILabel()
	private let toggleTitle = UILabel()
	private let switchButton = UISwitch()
	
	private let sourceLable = UILabel()
	private let sourceLableTitle = UILabel()
	private let sourceDesc = UILabel()
	
	private let URLLabel = UILabel()
	private let URLTitle = UILabel()
	private let URLDesc = UILabel()
	
	private var ingredientsTable = UITableView()
	private var ingredientsData = [String]()
	
	private var stepsTable = UITableView()
	private var stepsData = [String]()
	
	override func viewDidLoad() {
		self.view.backgroundColor = .white
		createScrollView()
		createContainerView()

		containerView.setupConstraints(label: mainTopLabel, topAnchor: containerView.topAnchor, botAnchor: nil, leftAnchor: containerView.leadingAnchor, rightAnchor: containerView.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 112, widthConst: nil)
		mainTopLabel.setupConstraints(label: mainTitle, topAnchor: mainTopLabel.topAnchor, botAnchor: nil, leftAnchor: mainTopLabel.leadingAnchor, rightAnchor: mainTopLabel.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: 0, heightConst: 60, widthConst: nil)
		creteMainTitleName()
		createMainSaveButton()
		mainTopLabel.setupConstraints(label: labelForTabbar, topAnchor: nil, botAnchor: mainTopLabel.bottomAnchor, leftAnchor: mainTopLabel.leadingAnchor, rightAnchor: mainTopLabel.trailingAnchor, topConst: nil, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: 52, widthConst: nil)
		labelForTabbar.setupConstraints(label: mainTabbar, topAnchor: labelForTabbar.topAnchor, botAnchor: nil, leftAnchor: labelForTabbar.leadingAnchor, rightAnchor: labelForTabbar.trailingAnchor, topConst: 0, botConst: nil, leadingConst: 8, trailingConst: -8, heightConst: 52, widthConst: nil)
		createIntroButton()
		createIngredientsButton()
		createStepsButton()

		//MARK: intro button view
		containerView.setupConstraints(label: introView, topAnchor: mainTopLabel.bottomAnchor, botAnchor: containerView.bottomAnchor, leftAnchor: containerView.leadingAnchor, rightAnchor: containerView.trailingAnchor, topConst: 2.5, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		introView.setupConstraints(label: titleMenuNameLabel, topAnchor: introView.topAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 16, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 48, widthConst: nil)
		createTitleName()
		createMenuName()
		introView.setupConstraints(label: cookTimeLabel, topAnchor: introView.topAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 88, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 74, widthConst: nil)
		createCookTime()
		cookTimeLabel.setupConstraints(label: minutesLabel, topAnchor: cookTimeLabel.topAnchor, botAnchor: cookTimeLabel.bottomAnchor, leftAnchor: cookTimeLabel.leadingAnchor, rightAnchor: nil, topConst: 26, botConst: 0, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: 164)
		createMinutes()
		createMinutesNum()
		cookTimeLabel.setupConstraints(label: hoursLabel, topAnchor: cookTimeLabel.topAnchor, botAnchor: cookTimeLabel.bottomAnchor, leftAnchor: nil, rightAnchor: cookTimeLabel.trailingAnchor, topConst: 26, botConst: 0, leadingConst: nil, trailingConst: 0, heightConst: nil, widthConst: 164)
		createHours()
		createHoursNum()
		introView.setupConstraints(label: imageLabel, topAnchor: introView.topAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 186, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 207.88, widthConst: nil)
		createImageView()
		createPencilButton()
		introView.setupConstraints(label: descriptionLabel, topAnchor: imageLabel.bottomAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 24, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 172, widthConst: nil)
		createDescTitle()
		createDesc()
		introView.setupConstraints(label: difServeLabel, topAnchor: descriptionLabel.bottomAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 24, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 52, widthConst: nil)
		difServeLabel.setupConstraints(label: difLable, topAnchor: difLable.topAnchor, botAnchor: difLable.bottomAnchor, leftAnchor: difLable.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: 159.5)
		createDifTitle()
		createDifName()
		difServeLabel.setupConstraints(label: serveeLable, topAnchor: difServeLabel.topAnchor, botAnchor: difServeLabel.bottomAnchor, leftAnchor: nil, rightAnchor: difServeLabel.trailingAnchor, topConst: 0, botConst: 0, leadingConst: nil, trailingConst: 0, heightConst: nil, widthConst: 159.5)
		createServeTitle()
		createCountPeople()
		introView.setupConstraints(label: toggleLable, topAnchor: difServeLabel.bottomAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 24, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 24.65, widthConst: nil)
		createToggleTitle()
		introView.setupConstraints(label: switchButton, topAnchor: toggleLable.topAnchor, botAnchor: toggleLable.bottomAnchor, leftAnchor: nil, rightAnchor: toggleLable.trailingAnchor, topConst: 0, botConst: 0, leadingConst: nil, trailingConst: 0, heightConst: nil, widthConst: nil)
		createSourceLabel()
		createSourceLabelTitle()
		createSourceDesc()
		introView.setupConstraints(label: URLLabel, topAnchor: sourceLable.bottomAnchor, botAnchor: nil, leftAnchor: introView.leadingAnchor, rightAnchor: introView.trailingAnchor, topConst: 24, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 48, widthConst: nil)
		createURLTitle()
		createURLDesc()
		
		//MARK: ingredients view
		createIngredientsView()
		
		//MARK: steps view
		createStepsView()
		
	}

	private func createScrollView () {
		scrollView.backgroundColor = .white
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(scrollView)
		NSLayoutConstraint.activate([
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
			scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0)
		])
	}

	private func createContainerView(){
		containerView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.addSubview(containerView)
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
			containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
			containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0),
			containerView.heightAnchor.constraint(equalToConstant: 1058),
			containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
		])
	}

	private func creteMainTitleName() {

		mainTitleName.text = "Recipe Form"
		mainTitleName.textAlignment = .center
		mainTitle.setupConstraints(label: mainTitleName, topAnchor: mainTitle.topAnchor, botAnchor: mainTitle.bottomAnchor, leftAnchor: mainTitle.leadingAnchor, rightAnchor: mainTitle.trailingAnchor, topConst: 16.5, botConst: -16.5, leadingConst: 68, trailingConst: -68, heightConst: nil, widthConst: nil)
	}

	private func createMainSaveButton() {
		mainSaveButton.setTitle("Save", for: .normal)
		mainSaveButton.setTitleColor(.orange, for: .normal)
		mainSaveButton.sizeToFit()
		view.setupConstraints(label: mainSaveButton, topAnchor: mainTitle.topAnchor, botAnchor: mainTitle.bottomAnchor, leftAnchor: nil, rightAnchor: mainTitle.trailingAnchor, topConst: 20, botConst: -20, leadingConst: nil, trailingConst: -16, heightConst: nil, widthConst: 40)
	}

	private func createIntroButton() {
		introButton.backgroundColor = .orange
		introButton.setTitle("Intro", for: .normal)
		introButton.layer.cornerRadius = 16
		introButton.addTarget(self, action: #selector(didTapIntroButton), for: .touchUpInside)
		view.setupConstraints(label: introButton, topAnchor: mainTabbar.topAnchor, botAnchor: mainTabbar.bottomAnchor, leftAnchor: mainTabbar.leadingAnchor, rightAnchor: nil, topConst: 8, botConst: -8, leadingConst: 8, trailingConst: nil, heightConst: nil, widthConst: 103)
	}

	private func createIngredientsButton() {
		ingredientsButton.backgroundColor = .white
		ingredientsButton.setTitle("Ingredients", for: .normal)
		ingredientsButton.setTitleColor(.black, for: .normal)
		ingredientsButton.layer.cornerRadius = 16
		ingredientsButton.addTarget(self, action: #selector(didTapIngredientsButton), for: .touchUpInside)
		view.setupConstraints(label: ingredientsButton, topAnchor: mainTabbar.topAnchor, botAnchor: mainTabbar.bottomAnchor, leftAnchor: mainTabbar.leadingAnchor, rightAnchor: mainTabbar.trailingAnchor, topConst: 8, botConst: -8, leadingConst: 119.5, trailingConst: -119.5, heightConst: nil, widthConst: nil)
	}

	private func createStepsButton() {
		stepsButton.backgroundColor = .white
		stepsButton.setTitle("Steps", for: .normal)
		stepsButton.setTitleColor(.black, for: .normal)
		stepsButton.layer.cornerRadius = 16
		stepsButton.addTarget(self, action: #selector(didTapStepsButton), for: .touchUpInside)
		view.setupConstraints(label: stepsButton, topAnchor: mainTabbar.topAnchor, botAnchor: mainTabbar.bottomAnchor, leftAnchor: nil, rightAnchor: mainTabbar.trailingAnchor, topConst: 8, botConst: -8, leadingConst: nil, trailingConst: -8, heightConst: nil, widthConst: 104)
	}

	@objc private func didTapIntroButton() {
		changeIngredientsButton()
		changeStepsButton()
		introButton.backgroundColor = .orange
		introButton.setTitleColor(.white, for: .normal)
		UIView.transition(with: introView, duration: 0.5, options: [.transitionCrossDissolve], animations: {
			self.ingredientsView.isHidden = true
			self.introView.isHidden = false
			self.stepsView.isHidden = true
		}, completion: nil)
	}
	
	@objc private func didTapIngredientsButton() {
		changeIntroButton()
		changeStepsButton()
		ingredientsButton.backgroundColor = .orange
		ingredientsButton.setTitleColor(.white, for: .normal)
		
		UIView.transition(with: ingredientsView, duration: 0.5, options: [.transitionCrossDissolve], animations: {
			self.introView.isHidden = true
			self.stepsView.isHidden = true
			self.ingredientsView.isHidden = false
		}, completion: nil)
	}
	
	@objc private func didTapStepsButton() {
		changeIntroButton()
		changeIngredientsButton()
		stepsButton.backgroundColor = .orange
		stepsButton.setTitleColor(.white, for: .normal)
		
		UIView.transition(with: stepsView, duration: 0.5, options: [.transitionCrossDissolve], animations: {
			self.introView.isHidden = true
			self.stepsView.isHidden = false
			self.ingredientsView.isHidden = true
		}, completion: nil)
	}
	
	private func changeIngredientsButton() {
		ingredientsButton.backgroundColor = .white
		ingredientsButton.setTitleColor(.black, for: .normal)
	}
	
	private func changeStepsButton() {
		stepsButton.backgroundColor = .white
		stepsButton.setTitleColor(.black, for: .normal)
	}
	
	private func changeIntroButton() {
		introButton.backgroundColor = .white
		introButton.setTitleColor(.black, for: .normal)
	}

	//MARK: intro button
	private func createTitleName() {
		titleName.text = "Title"
		titleMenuNameLabel.setupConstraints(label: titleName, topAnchor: titleMenuNameLabel.topAnchor, botAnchor: titleMenuNameLabel.bottomAnchor, leftAnchor: titleMenuNameLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -30, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}

	private func createMenuName() {
		menuName.text = "Menu Makan Malam: Sup Makaroni"
		titleMenuNameLabel.setupConstraints(label: menuName, topAnchor: titleMenuNameLabel.topAnchor, botAnchor: titleMenuNameLabel.bottomAnchor, leftAnchor: titleMenuNameLabel.leadingAnchor, rightAnchor: titleMenuNameLabel.trailingAnchor, topConst: 24, botConst: 4, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createCookTime() {
		cookTime.text = "Cook Time"
		cookTime.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		cookTimeLabel.setupConstraints(label: cookTime, topAnchor: cookTimeLabel.topAnchor, botAnchor: nil, leftAnchor: cookTimeLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createMinutes() {
		minutes.text = "minutes"
		minutes.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		minutesLabel.setupConstraints(label: minutes, topAnchor: minutesLabel.topAnchor, botAnchor: minutesLabel.bottomAnchor, leftAnchor: minutesLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -30, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createMinutesNum() {
		minutesNum.text = "40"
		minutesLabel.setupConstraints(label: minutesNum, topAnchor: minutesLabel.topAnchor, botAnchor: minutesLabel.bottomAnchor, leftAnchor: minutesLabel.leadingAnchor, rightAnchor: minutesLabel.trailingAnchor, topConst: 24, botConst: -4, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createHours() {
		hours.text = "hours"
		hours.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		hoursLabel.setupConstraints(label: hours, topAnchor: hoursLabel.topAnchor, botAnchor: hoursLabel.bottomAnchor, leftAnchor: hoursLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -30, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createHoursNum(){
		hoursNum.text = "0"
		hoursLabel.setupConstraints(label: hoursNum, topAnchor: hoursLabel.topAnchor, botAnchor: hoursLabel.bottomAnchor, leftAnchor: hoursLabel.leadingAnchor, rightAnchor: hoursLabel.trailingAnchor, topConst: 24, botConst: -4, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createImageView() {
		let image = UIImage(named: "image.png")
		imageView = UIImageView(image: image)
		imageLabel.setupConstraints(label: imageView, topAnchor: imageLabel.topAnchor, botAnchor: imageLabel.bottomAnchor, leftAnchor: imageLabel.leadingAnchor, rightAnchor: imageLabel.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createPencilButton() {
		pencilButton.backgroundColor = .white
		pencilButton.layer.cornerRadius = 8
		introView.setupConstraints(label: pencilButton, topAnchor: imageLabel.topAnchor, botAnchor: nil, leftAnchor: nil, rightAnchor: imageLabel.trailingAnchor, topConst: 15.5, botConst: nil, leadingConst: nil, trailingConst: -14, heightConst: 48, widthConst: 48)

		let imagePencil = UIImage(named: "pencil")
		let viewImage = UIImageView(image: imagePencil)
		pencilButton.setupConstraints(label: viewImage, topAnchor: pencilButton.topAnchor, botAnchor: pencilButton.bottomAnchor, leftAnchor: pencilButton.leadingAnchor, rightAnchor: pencilButton.trailingAnchor, topConst: 6, botConst: -6, leadingConst: 6, trailingConst: -6, heightConst: nil, widthConst: nil)
	}

	private func createDescTitle() {
		descTitle.text = "Description "
		descTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		descriptionLabel.setupConstraints(label: descTitle, topAnchor: descriptionLabel.topAnchor, botAnchor: nil, leftAnchor: descriptionLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: nil, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createDesc() {
		desc.text = "Membuat hidangan dengan bahan sayuran bisa jadi pilihan Sahabat Mallika. Sup makaroni dengan sayuran juga sangat cocok menu hidangan makan malam hari ini. Berikut bahan dan cara membuat sup makaroni. "
		desc.lineBreakMode = NSLineBreakMode.byWordWrapping
		desc.numberOfLines = 0
		descriptionLabel.setupConstraints(label: desc, topAnchor: descriptionLabel.topAnchor, botAnchor: descriptionLabel.bottomAnchor, leftAnchor: descriptionLabel.leadingAnchor, rightAnchor: descriptionLabel.trailingAnchor, topConst: 24, botConst: -4, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}

	private func createDifTitle() {
		difTitle.text = "Difficulty"
		difTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		difLable.setupConstraints(label: difTitle, topAnchor: difLable.topAnchor, botAnchor: difLable.bottomAnchor, leftAnchor: difLable.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -34, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createDifName() {
		difName.text = "Easy"
		difLable.setupConstraints(label: difName, topAnchor: difLable.topAnchor, botAnchor: difLable.bottomAnchor, leftAnchor: difLable.leadingAnchor, rightAnchor: nil, topConst: 24, botConst: -8, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createServeTitle() {
		serveTitle.text = "Serve "
		serveTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		serveeLable.setupConstraints(label: serveTitle, topAnchor: serveeLable.topAnchor, botAnchor: serveeLable.bottomAnchor, leftAnchor: serveeLable.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -34, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}
	
	private func createCountPeople() {
		countPeople.text = "2 People"
		serveeLable.setupConstraints(label: countPeople, topAnchor: serveeLable.topAnchor, botAnchor: serveeLable.bottomAnchor, leftAnchor: serveeLable.leadingAnchor, rightAnchor: serveeLable.trailingAnchor, topConst: 24, botConst: -8, leadingConst: 0, trailingConst: -30, heightConst: nil, widthConst: nil)
	}

	private func createToggleTitle() {
		toggleTitle.text = "Publish to Community?"
		toggleTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		toggleLable.setupConstraints(label: toggleTitle, topAnchor: toggleLable.topAnchor, botAnchor: toggleLable.bottomAnchor, leftAnchor: toggleLable.leadingAnchor, rightAnchor: toggleLable.trailingAnchor, topConst: 3.32, botConst: -3.32, leadingConst: 0, trailingConst: 187, heightConst: nil, widthConst: nil)
	}

	private func createSourceLabel() {
		sourceLable.translatesAutoresizingMaskIntoConstraints = false
		introView.addSubview(sourceLable)
		
		NSLayoutConstraint.activate([
			sourceLable.topAnchor.constraint(equalTo: toggleLable.bottomAnchor, constant: 24),
			sourceLable.leadingAnchor.constraint(equalTo: introView.leadingAnchor, constant: 16),
			sourceLable.trailingAnchor.constraint(equalTo: introView.trailingAnchor, constant: -16),
			sourceLable.heightAnchor.constraint(equalToConstant: 48)
		])
	}

	private func createSourceLabelTitle() {
		sourceLableTitle.text = "Source"
		sourceLableTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		sourceLable.setupConstraints(label: sourceLableTitle, topAnchor: sourceLable.topAnchor, botAnchor: sourceLable.bottomAnchor, leftAnchor: sourceLable.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -30, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}

	private func createSourceDesc() {
		sourceDesc.text = "Fimela"
		sourceLable.setupConstraints(label: sourceDesc, topAnchor: sourceLable.topAnchor, botAnchor: sourceLable.bottomAnchor, leftAnchor: sourceLable.leadingAnchor, rightAnchor: sourceLable.trailingAnchor, topConst: 24, botConst: -8, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}

	private func createURLTitle() {
		URLTitle.text = "URL"
		URLTitle.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		URLLabel.setupConstraints(label: URLTitle, topAnchor: URLLabel.topAnchor, botAnchor: URLLabel.bottomAnchor, leftAnchor: URLLabel.leadingAnchor, rightAnchor: nil, topConst: 0, botConst: -30, leadingConst: 0, trailingConst: nil, heightConst: nil, widthConst: nil)
	}

	private func createURLDesc() {
		URLDesc.text = "https://www.fimela.com/lifestyle-relationsh"
		URLDesc.textColor = UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1)
		URLLabel.setupConstraints(label: URLDesc, topAnchor: URLLabel.topAnchor, botAnchor: URLLabel.bottomAnchor, leftAnchor: URLLabel.leadingAnchor, rightAnchor: URLLabel.trailingAnchor, topConst: 24, botConst: -4, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}

	//MARK: ingredients view
	private func createIngredientsView() {
		containerView.setupConstraints(label: ingredientsView, topAnchor: mainTopLabel.bottomAnchor, botAnchor: containerView.bottomAnchor, leftAnchor: containerView.leadingAnchor, rightAnchor: containerView.trailingAnchor, topConst: 2.5, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		ingredientsView.isHidden = true

		ingredientsData.append(contentsOf:[
			"Bahan",
			"1 buah wortel, potong-potong",
			"5 potong sayap ayam",
			"200 gr makaroni atau fusilli",
			"air secukupnya",
			"Bumbu",
			"3 siung bawang putih, cincang",
			"2 siung bawang merah, iris tipis",
			"1 batang daun bawang, potong-potong",
			"1 sdt gula1 sdt garam",
			"1/2 sdt kaldu bubuk",
			"1/2 sdt pala bubuk",
			"1/2 sdt lada bubuk",
			"1 batang seledri"
		])
		ingredientsView.addSubview(ingredientsTable)
		ingredientsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		ingredientsTable.delegate = self
		ingredientsTable.dataSource = self
		ingredientsTable.separatorStyle = .none
	}
	
	//MARK: steps view
	private func createStepsView () {
		containerView.setupConstraints(label: stepsView, topAnchor: mainTopLabel.bottomAnchor, botAnchor: containerView.bottomAnchor, leftAnchor: containerView.leadingAnchor, rightAnchor: containerView.trailingAnchor, topConst: 2.5, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		stepsView.isHidden = true
		
		stepsData.append(contentsOf: [
			"Cara Memasak",
			"Setelah dicuci bersih, rebus sayap ayam hingga matang dengan 500 ml air. Buang busanya dan saring untuk dijadikan kaldu. ",
			"Tumis bawang putih, bawang merah dan daun bawang hingga harum. Masukkan pala dan lada bubuk, tumis sebentar. Matikan api. ",
			"Rebus lagi air kaldu, masukkan makaroni dan masak hingga setengah matang. Masukkan wortel dan masak hingga mendidih. ",
			"Masukkan bumbu dan daun seledri. Masak hingga semua bahan matang dan kuah sedap."
		])
		stepsView.addSubview(stepsTable)
		stepsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		stepsTable.delegate = self
		stepsTable.dataSource = self
		stepsTable.separatorStyle = .none
	}
}

extension MaketController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if tableView == ingredientsTable {
			return ingredientsData.count
		}
		if tableView == stepsTable {
			return stepsData.count
		}
		return 15
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if tableView == ingredientsTable {
			let cell = CustomTableViewCell(id: "\(indexPath.row)", text: (ingredientsData[indexPath.row]))
			cell.selectionStyle = .none
			return cell
		}
		if tableView == stepsTable {
			let cell = CustomTableViewCell(id: "\(indexPath.row)", text: (stepsData[indexPath.row]))
			cell.selectionStyle = .none
			return cell
		}
		return UITableViewCell()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		ingredientsTable.frame = ingredientsView.bounds
		stepsTable.frame = stepsView.bounds
	}
}
