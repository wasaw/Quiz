//
//  LimitButtonStack.swift
//  Quiz
//
//  Created by Александр Меренков on 3/23/22.
//

import UIKit

class LimitButton: UIButton {
    
//    MARK: - Properties
     
    var isChecked: Bool = false {
        didSet {
            if self.isChecked == true {
                backgroundColor = .blue
                setTitleColor(.white, for: .normal)
                layer.borderColor = UIColor.white.cgColor
            } else {
                backgroundColor = .white
                setTitleColor(.black, for: .normal)
                layer.borderColor = UIColor.systemBlue.cgColor
            }
        }
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
        
        backgroundColor = .white
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
