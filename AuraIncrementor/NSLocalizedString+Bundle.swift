//
//  NSLocalizedString+Bundle.swift
//  AuraIncrementor
//
//  Created by Alexey Agapov on 28/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import Foundation

func AILocalizedString(_ key: String, comment: String = "") -> String {
    return NSLocalizedString(key, bundle: appBundle, comment: comment)
}

private let appBundle = Bundle(identifier: "com.agapov.one.AuraIncrementor")!
