//
//  Incrementor.swift
//  AuraIncrementor
//
//  Created by Alex Agapov on 27/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import Foundation

public enum IncrementorError: LocalizedError {
    case maximumValueLessThanZero

    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        switch self {
        case .maximumValueLessThanZero:
            return AILocalizedString("IncrementorError.maximumValueLessThanZero.errorDescription")
        }
    }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? {
        switch self {
        case .maximumValueLessThanZero:
            return AILocalizedString("IncrementorError.maximumValueLessThanZero.failureReason")
        }
    }

    /// A localized message describing how one might recover from the failure.
    public var recoverySuggestion: String? {
        switch self {
        case .maximumValueLessThanZero:
            return AILocalizedString("IncrementorError.maximumValueLessThanZero.recoverySuggestion")
        }
    }

    /// A localized message providing "help" text if the user requests help.
    public var helpAnchor: String? {
        switch self {
        case .maximumValueLessThanZero:
            return AILocalizedString("IncrementorError.maximumValueLessThanZero.helpAnchor")
        }
    }
}

public final class Incrementor {

    /// NOTE: Allowed to be modified. Used for internal implementation testing
    enum Constants {
        /// Default minimum value for a number after initialization.
        static var minimumValue: Int = 0
        /// Default maximum value for a number to define when the value should be reset.
        static var maximumValue = Int.max
        /// Default integer to use while incrementing.
        static var addendValue: Int = 1
        /// Lower bound to forbid setting maximum value.
        static var lowerBoundForMaximumValue: Int = 0
    }

    /// Internal value to store and set current number.
    var value: Int = Constants.minimumValue

    /// Maximum value to limit a number incremention.
    var maximumValue: Int = Constants.maximumValue

    /// Increments value with an addend.
    func incrementIfShould() {
        var isAlreadyAtMaximum: Bool {
            return value >= maximumValue
        }

        if isAlreadyAtMaximum {
            resetNumber()
        } else {
            value += Constants.addendValue
        }
    }

    /// Sets maximum value if it's more than or equal to lower bound. Also resets number if maximum value is less that number
    ///
    /// - Parameter maximumValue
    /// - Throws: IncrementorError when maximum value is less than lower bound.
    func setMaximumValueIfPossible(_ maximumValue: Int) throws {
        var isAllowedToSetMaximumValue: Bool {
            return maximumValue >= Constants.lowerBoundForMaximumValue
        }

        guard isAllowedToSetMaximumValue else {
            throw IncrementorError.maximumValueLessThanZero
        }

        self.maximumValue = maximumValue

        var shouldResetNumber: Bool {
            return maximumValue < value
        }

        if shouldResetNumber {
            resetNumber()
        }
    }

    /// Resets number to minimum value
    func resetNumber() {
        value = Constants.minimumValue
    }

    public init() {}
}

extension Incrementor {

    /// Current number. Default value after initialization is 0.
    public var number: Int {
        return value
    }

    /// Increments value by 1. Resets to 0 if it increments on a maximum value
    ///
    /// The number maximum value is defined by `setMaximumValue(_:)` method.
    ///
    /// i.e. if a number is 1 and a maximum value is 1, this method will reset number to 0 and `number` getter will return 0
    public func increment() {
        incrementIfShould()
    }

    ///
    /// Sets up maximum value for a number.
    ///
    /// Used in increment method to define if a number should be reset to 0 after reaching maximum value.
    /// Read `increment()` method documentation for more details.
    /// Will reset number to zero if maximum value is less than current number
    ///
    /// Default maximum value is `Int.max`
    /// Maximum value can't be less than zero (0)
    ///
    /// - Parameter maximumValue: Integer
    /// - Throws: IncrementorError with description why operation is not possible
    public func setMaximumValue(_ maximumValue: Int) throws {
        try setMaximumValueIfPossible(maximumValue)
    }
}
