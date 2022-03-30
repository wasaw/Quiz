//
//  AnswerCell.swift
//  Quiz
//
//  Created by Александр Меренков on 3/15/22.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    
    let textLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .fontColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLable)
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLable.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLable.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textLable.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        layer.cornerRadius = 15
        backgroundColor = .answerCellBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
