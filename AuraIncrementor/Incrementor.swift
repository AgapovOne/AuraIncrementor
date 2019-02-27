//
//  Incrementor.swift
//  AuraIncrementor
//
//  Created by Alex Agapov on 27/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import Foundation

public enum IncrementorError: Error {
    case maximumValueLessThanZero
}

final class Incrementor {

    enum Constants {
        static var defaultMinimumValue: Int = 0
        static var defaultMaximumValue: Int = Int.max
    }

    var value: Int = Constants.defaultMinimumValue
    var maximumValue: Int = Constants.defaultMaximumValue

    var isAlreadyAtMaximum: Bool {
        return value >= maximumValue
    }

    func incrementIfShould() {
        if isAlreadyAtMaximum {
            value = Constants.defaultMinimumValue
        } else {
            value += 1
        }
    }

    func setMaximumValueIfPossible(_ maximumValue: Int) throws {
        if maximumValue < 0 {
            throw IncrementorError.maximumValueLessThanZero
        } else {
            self.maximumValue = maximumValue
        }
    }
}

extension Incrementor {

    /**
     * Возвращает текущее число. В самом начале это ноль.
     */
    public var number: Int {
        return value
    }

    /**
     * Увеличивает текущее число на один. После каждого вызова этого
     * метода getNumber() будет возвращать число на один больше.
     */
    public func increment() {
        incrementIfShould()
    }

    /**
     * Устанавливает максимальное значение текущего числа.
     * Когда при вызове incrementNumber() текущее число достигает
     * этого значения, оно обнуляется, т.е. getNumber() начинает
     * снова возвращать ноль, и снова один после следующего
     * вызова incrementNumber() и так далее.
     * По умолчанию максимум -- максимальное значение int.
     * Если при смене максимального значения число резко начинает
     * превышать максимальное значение, то число надо обнулить.
     * Нельзя позволять установить тут число меньше нуля.
     */
    public func setMaximumValue(_ maximumValue: Int) throws {
        try setMaximumValueIfPossible(maximumValue)
    }
}
