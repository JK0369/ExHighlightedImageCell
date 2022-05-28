//
//  ViewController.swift
//  ExHighlighted
//
//  Created by 김종권 on 2022/05/28.
//

import UIKit

class ViewController: UIViewController {
  private let tableView: UITableView = {
    let view = UITableView()
    view.allowsSelection = true
    view.backgroundColor = .clear
    view.separatorStyle = .none
    view.bounces = true
    view.showsVerticalScrollIndicator = true
    view.contentInset = .zero
    view.register(MyCell.self, forCellReuseIdentifier: MyCell.id)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var items = (0...20).map(String.init(_:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.tableView)
    NSLayoutConstraint.activate([
      self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
    ])
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.items.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.id, for: indexPath) as! MyCell
    cell.prepare(text: self.items[indexPath.row])
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    250
  }
}
