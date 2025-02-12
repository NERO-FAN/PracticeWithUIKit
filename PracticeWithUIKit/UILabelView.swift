//
//  ScheduleViewController.swift
//  PracticeWithUIKit
//
//  Created by David Medina on 2/11/25.
//

import UIKit
import SwiftUI

class UILabelViewController: UIViewController {
    
    var hwLabel: UILabel = UILabel()
    
    // this function is called after the view is loaded into memory and
    // will be the first method called on the UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call on our function to begin drawing our UI
        configureUI()
    }
    
    func configureUI() {
        // this handles any logic/UI related decisions with the UILabel object
        configureLabel()
        
        // need to place our UILabel object into our root view before we declare any constraints on it
        view.addSubview(hwLabel)
        
        // configure the constraints of our UILabel
        configureLabelConstraints()
    }
    
    func configureLabel() {
        hwLabel.text = "Click Me!"
        hwLabel.textColor = .white
        hwLabel.textAlignment = .center
        // the following is needed to make UILabel rounded
        hwLabel.layer.masksToBounds = true
        hwLabel.layer.cornerRadius = 10
        // This is how we call upon any predefined colors in our Assets file
        hwLabel.backgroundColor = .systemBlue
        // this is important to have because it prevents the compiler from automatically formatting our UI component
        hwLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLabelConstraints() {
        NSLayoutConstraint.activate([
            hwLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hwLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            hwLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hwLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// the following is how we can create a way to transform our UIViewController
// to conform to a SwiftUI View
struct UILabelView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let UILabelView = UILabelViewController()
        return UILabelView
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // no need for any code here
    }
}
