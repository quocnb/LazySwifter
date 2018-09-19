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

    @IBOutlet weak var imageView: UIImageView!
    let view1 = TestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view1.cornerRadius = 100.0
        view1.borderWidth = 10.0
        view1.borderColor = UIColor.red
        view1.backgroundColor = UIColor.white
        self.view.addSubview(view1)
        view1.fillSuperView(inset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))

        let myPws = [
            "AA@45aaa",
            "AA!45aa",
            "AA45aaaa",
            "AA 45aaa",
            "AA@!5aaa",
            "aa@!5aaa",
            "Aa4Aa4Aa4AA4",
            "aaaaaaaaaaa44444",
            "AAAAAAAAaaaaa",
            "AAAAAAAA444444$$$",
            "AAAAaaaaa44444"
        ]
        var condition = PasswordStrength()
        condition.hasSpecialChar = true

        for pw in myPws {
            print(pw.isStrongPassword)
            let strong = pw.isStrongPassword(condition: condition)
            print(pw, "is", strong ? "" : "NOT", "a strong password")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



