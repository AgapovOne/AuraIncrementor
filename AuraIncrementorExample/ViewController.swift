//
//  ViewController.swift
//  AuraIncrementorExample
//
//  Created by Alex Agapov on 27/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import UIKit
import AuraIncrementor

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(IncrementorError.maximumValueLessThanZero.localizedDescription)
        print(NSLocalizedString("x", bundle: Bundle(for: type(of: self)), comment: "XEXE"))
    }


}

