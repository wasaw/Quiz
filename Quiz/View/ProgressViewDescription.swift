//
//  ProgressViewDescription.swift
//  Quiz
//
//  Created by Александр Меренков on 3/25/22.
//

import UIKit

class ProgressViewDescription: UIView {
    
//    MARK: - Preperties
    let persentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        addSubview(persentLabel)
        
        persentLabel.translatesAutoresizingMaskIntoConstraints = false
        persentLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        persentLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        persentLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        persentLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(questionLabel)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        backgroundColor = .backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
