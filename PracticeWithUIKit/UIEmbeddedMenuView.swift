//
//  UIEmbeddedMenuView.swift
//  PracticeWithUIKit
//
//  Created by David Medina on 2/13/25.
//

import UIKit
import SwiftUI

class UIEmbeddedMenuViewController: UIViewController {
    
    var menuButton = UIButton()
    
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
        menuButton.configuration = .borderless()
        menuButton.configuration?.title = "Menu Items"
        menuButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        menuButton.configuration?.baseForegroundColor = .systemBlue
        // menuButton.addTarget(nil, action: #selector(handleButtonTapped), for: .touchUpInside)
        
        // expect the dropdown menu to be the primary action on tap, so we set this parameter to true
        // just in case, may need to comment out/delete the button's target if written
        menuButton.showsMenuAsPrimaryAction = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        menuButton.menu = configureMenu()
        
        view.addSubview(menuButton)
    }
    
    func configureMenu() -> UIMenu {
        let actionOne = UIAction(title: "Toggle Color", image: UIImage(systemName: "paintpalette"), identifier: nil, handler: { _ in
            self.changeButtonColor()
        })
        
        let actionTwo = UIAction(title: "Print Hello World", image: UIImage(systemName: "printer"), identifier: nil, handler: { _ in
            print("Hello, World!")
        })
        
        let actions: [UIAction] = [actionOne, actionTwo]
        
        let menu = UIMenu(title: "Action Menu", image: nil, identifier: nil, options: [], children: actions)
        return menu
    }
    
    @objc
    private func handleButtonTapped() {
        print("Button Tapped")
    }
    
    @objc
    private func changeButtonColor() {
        let menuConfigBackground = menuButton.configuration?.baseForegroundColor
        menuButton.configuration?.baseForegroundColor = menuConfigBackground == .systemBlue ?
            .systemTeal : .systemBlue
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            menuButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            menuButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            menuButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

struct UIEmbeddedMenuView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let UIMenuView = UIEmbeddedMenuViewController()
        return UIMenuView
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
