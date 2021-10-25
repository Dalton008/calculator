//
//  TableController.swift
//  calculator
//
//  Created by Magic Jammie on 10/18/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	private let tableView = UITableView()
	private var	data = [String]()
	private var refreshControll = UIRefreshControl()

	override func viewDidLoad() {
		super.viewDidLoad()
		addFiveElement()
		view.addSubview(tableView)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.delegate = self
		tableView.dataSource = self

		refreshControll.tintColor = .red
		refreshControll.attributedTitle = NSAttributedString(string: "Update")
		refreshControll.addTarget(self, action: #selector(updateTable), for: .valueChanged)
		tableView.refreshControl = refreshControll
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableView.frame = view.bounds
	}

	private func addFiveElement()
	{
		for _ in 0..<5 {
			data.append("Text")
		}
	}

	@objc private func updateTable() {
			self.refreshControll.endRefreshing()
			self.addFiveElement()
			self.tableView.reloadData()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		data.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = data[indexPath.row]
		return cell
	}
}
