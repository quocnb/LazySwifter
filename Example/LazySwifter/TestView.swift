//
//  TestView.swift
//  LazySwifter_Example
//
//  Created by Quoc Nguyen on 2018/09/10.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import LazySwifter

class TestView: UIView {

    convenience init() {
        self.init(frame: CGRect.zero)
        self.loadXib()
    }

}
