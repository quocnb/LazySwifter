//
//  UIImageExtension.swift
//  LazySwifter
//
//  Created by Quoc Nguyen on 2/6/18.
//

import UIKit

extension UIImage {
    public var width: CGFloat {
        return size.width
    }

    public var height: CGFloat {
        return size.height
    }

    public func resizing(newWidth: CGFloat) -> UIImage {
        guard newWidth < size.width else {
            return self
        }
        let ratio = newWidth / size.width
        let newHeight = size.height * ratio
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}

