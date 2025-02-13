//
//  UIButtonView.swift
//  PracticeWithUIKit
//
//  Created by David Medina on 2/12/25.
//

import UIKit
import SwiftUI

class UIButtonViewController: UIViewController {
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply leading and trailing margin for the entire view
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        configureUI()
    }
    
    func configureUI() {
        configureButton()
        
        view.backgroundColor = .systemBackground
        
        configureConstraints()
    }
    
    func configureButton() {
//        button.layer.borderWidth = 1.5
//        button.layer.borderColor = UIColor.systemTeal.cgColor
//        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.configuration = .borderedProminent()
        button.configuration?.baseBackgroundColor = .systemTeal
//        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Delete"
        button.configuration?.cornerStyle = .large
        button.addTarget(nil, action: #selector(handleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // applying a shadow effect to our entire button component
        button.layer.shadowOffset = CGSize(width: 2, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 10
        // need this to ensure the shadow effect doesn't get bounded within the button's height constraint
        // since we need the shadow effect to be reaching outside of the container
        button.layer.masksToBounds = false
        
        // applying a shadow effect to our actual button label
        button.titleLabel?.shadowOffset = CGSize(width: 15, height: 10)
        button.titleLabel?.shadowColor = .black
        
        // setting a role for our button
        button.role = .primary
        
        view.addSubview(button)
    }
    
    @objc
    private func handleButtonTapped() {
        print("Button Tapped")
    }
    
    // call .layoutMarginsGuide to take into account any margin being applied to the parent
    // view of the component you're declaring constraints upon
    func configureConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

struct UIButtonView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let ButtonView = UIButtonViewController()
        return ButtonView
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
