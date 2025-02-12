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
    var scaledTextLsbel: UILabel = UILabel()
    
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
        view.addSubview(scaledTextLsbel)
        
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
        
        scaledTextLsbel.textColor = .white
        scaledTextLsbel.textAlignment = .center
        scaledTextLsbel.backgroundColor = .systemBlue
        scaledTextLsbel.layer.masksToBounds = true
        scaledTextLsbel.layer.cornerRadius = 10
        scaledTextLsbel.layoutMargins = .zero
        scaledTextLsbel.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        scaledTextLsbel.text = "This is some long label content. This is some long label content. This is some long label content."
        // limits the number of lines the text can take up
        scaledTextLsbel.numberOfLines = 1
        // will scale text so that it fits on the view regardless of whether it's legible or not
        scaledTextLsbel.adjustsFontSizeToFitWidth = true
        // define a minimum scale factor
        scaledTextLsbel.minimumScaleFactor = 1.5
        // truncates the text to indicate to the user that there is still remaining text
        scaledTextLsbel.lineBreakMode = .byTruncatingTail
        // this is important to have because it prevents the compiler from automatically formatting our UI component
        scaledTextLsbel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLabelConstraints() {
        NSLayoutConstraint.activate([
            hwLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hwLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            hwLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hwLabel.heightAnchor.constraint(equalToConstant: 44),
            
            scaledTextLsbel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scaledTextLsbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scaledTextLsbel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scaledTextLsbel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// pretty neat extension I found online which makes it easy to adding padding to a UILabel component
extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }

    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }

    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }

        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0
        var insetsWidth: CGFloat = 0.0

        if let insets = padding {
            insetsWidth += insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
            textWidth -= insetsWidth
        }

        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: self.font ?? Font.title], context: nil)

        contentSize.height = ceil(newSize.size.height) + insetsHeight
        contentSize.width = ceil(newSize.size.width) + insetsWidth

        return contentSize
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
