//
//  Utilities.swift
//  WashMe
//
//  Created by Gleb on 13.08.2023.
//

import Foundation
import UIKit

struct Utilities {
    
   static func isPasswordValid(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$")
        return passwordRegex.evaluate(with: password)
    }
}
