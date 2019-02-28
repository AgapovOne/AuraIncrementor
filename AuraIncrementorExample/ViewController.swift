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

        print(IncrementorError.maximumValueLessThanZero.localizedDescription)
        print(IncrementorError.maximumValueLessThanZero.errorDescription)
        print(IncrementorError.maximumValueLessThanZero.recoverySuggestion)
        print(IncrementorError.maximumValueLessThanZero.failureReason)
        print(IncrementorError.maximumValueLessThanZero.helpAnchor)
//        print(NSLocalizedString("x", bundle: Bundle(for: type(of: self)), comment: "XEXE"))
//        print(NSLocalizedString("x", bundle: Bundle(for: type(of: Incrementor())), comment: "XEXE"))
    }
}
