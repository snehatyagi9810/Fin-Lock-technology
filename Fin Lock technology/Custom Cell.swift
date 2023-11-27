//
//  Custom Cell.swift
//  Fin Lock technology
//
//  Created by Sneh on 26/11/23.
//

import Foundation
import UIKit
class CustomCell: UITableViewCell{
    let cityLabel = UILabel()
    let mainView = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        mainView.addSubview(cityLabel)
        contentView.addSubview(mainView)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = .white
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            mainView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: contentView.rightAnchor)])
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: mainView.topAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            cityLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 10),
            cityLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    
}





