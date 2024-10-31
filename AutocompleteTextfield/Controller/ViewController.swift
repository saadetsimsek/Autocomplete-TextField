//
//  ViewController.swift
//  AutocompleteTextfield
//
//  Created by Saadet Şimşek on 31/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        let attributedTextColor: NSAttributedString = "Autocomplete".attributedStringColor(["Auto"], color: UIColor.black)
        label.attributedText = attributedTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let autoCompleteTextfield = AutoCompleteTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(autoCompleteTextfield)
        addConstraints()
    }


    func addConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            autoCompleteTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            autoCompleteTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            autoCompleteTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            autoCompleteTextfield.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

