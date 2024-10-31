//
//  AutoCompleteTextField.swift
//  AutocompleteTextfield
//
//  Created by Saadet Şimşek on 31/10/2024.
//

import UIKit

class AutoCompleteTextField: UITextField {

    private let dataSource = ["Cat", "Dog", "Carrot"]
    
    private var currentText: String = "" {
        didSet {
            if currentText.isEmpty {
                text = ""
            }
        }
    }
    
    private var isAutoComplete: Bool = false {
        didSet {
            if isAutoComplete {
                textColor = .lightGray
            }
            else {
                attributedText = .none
                text = currentText
                textColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        borderStyle = .roundedRect
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 18)
        autocapitalizationType = .none
        textColor = .lightGray

    }
    
    private func setCurrentText(range: NSRange, string: String){
        if range.length == 0 {
            currentText += string
            print("1")
        }
        else{
            let _ = currentText.popLast()
            print("2")
        }
    }
    
    private func filtredDataSource(){
        guard let matches = dataSource.filter ({ $0.lowercased().hasPrefix(currentText.lowercased())}).first else{
            isAutoComplete = false
            return
        }
        if let range = matches.lowercased().range(of: currentText.lowercased()) {
            isAutoComplete = true
            let attributedString = NSMutableAttributedString(string: matches)
            let convertedRange = NSRange(range, in: matches)
            attributedString.setAttributes([.foregroundColor : UIColor.black], range: convertedRange)
            attributedText = attributedString
        }
    }
    
    private func setCunsorPosition(){
        if let newPosition = position(from: beginningOfDocument, offset: currentText.count){
            selectedTextRange = textRange(from: newPosition, to: newPosition)
        }
    }

}

extension AutoCompleteTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        setCurrentText(range: range, string: string)
        filtredDataSource()
        setCunsorPosition()
        return false
    }
}
