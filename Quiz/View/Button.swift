//
//  StartButton.swift
//  Quiz
//
//  Created by Александр Меренков on 3/22/22.
//

import UIKit

class Button: UIButton {
    
//    MARK: - Lifecycle
    
    required init(title: String, background bgColor: UIColor, font textColor: UIColor) {
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        setTitleColor(textColor, for: .normal)

        backgroundColor = bgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
