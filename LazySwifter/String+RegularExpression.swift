//
//  String+RegularExpression.swift
//  LazySwifter
//
//  Created by Quoc Nguyen on 2018/09/11.
//

import UIKit

public struct CommonRegex {
    public static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public static let phoneNumber = "^((\\+)|(00))[0-9]{6,14}$"
}

public struct PasswordStrength {
    public var minLength = 8
    public var hasUppercase: Bool = true
    public var hasLowercase: Bool = true
    public var hasNumber: Bool = true
    public var hasSpecialChar: Bool = false
    public var specialChars: String = "!@#$&* "

    public init() {
    }

    public func detectRegex() -> String {
        var regex = "^"
        regex += hasUppercase ? "(?=.*[A-Z])" : ""
        regex += hasLowercase ? "(?=.*[a-z])" : ""
        regex += hasNumber ? "(?=.*[0-9])" : ""
        regex += hasSpecialChar ? "(?=.*[\(specialChars)])" : ""
        regex += ".{\(minLength),}"
        regex += "$"
        return regex
    }
}

public extension String {
    var isEmail: Bool {
        return self.matchesWithRegex(CommonRegex.email)
    }

    var isPhoneNumber: Bool {
        return self.matchesWithRegex(CommonRegex.phoneNumber)
    }

    func matchesWithRegex(_ regex: String) -> Bool {
        let condition = NSPredicate(format:"SELF MATCHES %@", regex)
        return condition.evaluate(with: self)
    }

    var isStrongPassword: Bool {
        let condition = PasswordStrength()
        return self.isStrongPassword(condition: condition)
    }

    func isStrongPassword(condition: PasswordStrength) -> Bool {
        return self.matchesWithRegex(condition.detectRegex())
    }
}
