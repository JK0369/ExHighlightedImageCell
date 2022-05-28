//
//  MyCell.swift
//  ExHighlighted
//
//  Created by 김종권 on 2022/05/28.
//

import UIKit

final class MyCell: UITableViewCell {
  static let id = "MyCell"
  
  private let backgroundImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "background-normal")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: Initializer
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.contentView.addSubview(self.backgroundImageView)
    self.contentView.addSubview(self.label)
    
    NSLayoutConstraint.activate([
      self.backgroundImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.backgroundImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.backgroundImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
      self.backgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
    ])
    NSLayoutConstraint.activate([
      self.label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
    ])
  }
  
  override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    super.setHighlighted(highlighted, animated: animated)
    
    guard highlighted else { return }
    // UIView.animate를 사용하면 동작하지 않는것을 주의
    UIView.transition(
      with: self.backgroundImageView,
      duration: 0.08,
      options: .transitionCrossDissolve,
      animations: { self.backgroundImageView.image = UIImage(named: "background-highlighted") },
      completion: { _ in self.backgroundImageView.image = UIImage(named: "background-normal") }
    )
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.prepare(text: nil)
  }
  
  func prepare(text: String?) {
    self.label.text = text
  }
}
