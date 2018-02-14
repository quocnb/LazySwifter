//
//  UIViewControllerExtension.swift
//  LazySwifter
//
//  Created by Quoc Nguyen on 2/6/18.
//
import UIKit

extension UIViewController {
    public static var identifier: String {
        return String(describing: self)
    }

    public static func controller<T: UIViewController>(type: T.Type, at storyboardName: String = "Main") -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let identifier = T.identifier
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T ?? T()
    }
}
