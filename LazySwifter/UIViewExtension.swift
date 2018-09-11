//
//  UIViewExtension.swift
//  LazySwifter
//
//  Created by Quoc Nguyen on 2/6/18.
//

import UIKit

public extension UIView {
    class var identifier: String {
        return String(describing: self)
    }

    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var identifier: String {
        return String(describing: type(of: self))
    }

    func loadXib() {
        let nibData = Bundle.main.loadNibNamed(
            self.identifier, owner: self, options: nil
        )
        guard let content = nibData?.first as? UIView else {
            return
        }
        self.addSubview(content)
        content.frame = self.bounds
        content.fillSuperView()
    }

    func removeAllGestureRecognize() {
        self.gestureRecognizers?.forEach({ (gesture) in
            self.removeGestureRecognizer(gesture)
        })
    }

    var shadowColor: UIColor? {
        get {
            guard let v = layer.shadowColor else {
                return nil
            }

            return UIColor(cgColor: v)
        }
        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }

    var borderColor: UIColor? {
        get {
            guard let v = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.borderColor = value?.cgColor
        }
    }

    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
            self.clipsToBounds = true
        }
    }

    func capture() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UIView {
    func fillConstraint(attribute: NSLayoutConstraint.Attribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: .equal,
            toItem: self.superview,
            attribute: attribute,
            multiplier: 1.0,
            constant: offset
        )
    }

    func fillSuperView(inset: UIEdgeInsets = UIEdgeInsets.zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fillConstraint(attribute: .top, offset: inset.top),
            fillConstraint(attribute: .bottom, offset: inset.bottom),
            fillConstraint(attribute: .leading, offset: inset.left),
            fillConstraint(attribute: .trailing, offset: inset.right)
        ])
    }
}
