//
//  CategoryChoice.swift
//  Quiz
//
//  Created by Александр Меренков on 3/22/22.
//

import UIKit

class CategoryChoice: UIPickerView {
    
//    MARK: - Properties
    
    let categoryArray = ["Linux", "DevOps", "Bash", "Docker"]
    var category: String

    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        self.category = categoryArray[0]
        
        super.init(frame: frame)

        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//   MARK: - Extensions

extension CategoryChoice: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = categoryArray[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: categoryArray[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = categoryArray[row]
    }
}

extension CategoryChoice: UIPickerViewDelegate {
    
}
