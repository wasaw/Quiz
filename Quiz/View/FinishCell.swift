//
//  FinishCell.swift
//  Quiz
//
//  Created by Александр Меренков on 3/30/22.
//

import UIKit

class FinishCell: UITableViewCell {
    
//    MARK: - Properties
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    let percentRightAnswer: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.backgroundColor = UIColor.gray.cgColor
        return view
    }()
    
//    Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        numberLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [nicknameLabel, topicLabel, percentRightAnswer])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: numberLabel.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        
        addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        line.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        backgroundColor = .backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
