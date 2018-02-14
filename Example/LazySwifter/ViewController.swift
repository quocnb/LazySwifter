//
//  ViewController.swift
//  LazySwifter
//
//  Created by quocnb on 02/06/2018.
//  Copyright (c) 2018 quocnb. All rights reserved.
//

import UIKit
import LazySwifter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let num = 15
        print(num ** 2)
        let string = "01234567890"
        print(string[(-2)...])
        print(string[1...2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

