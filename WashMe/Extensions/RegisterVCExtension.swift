//
//  RegisterVCExtension.swift
//  WashMe
//
//  Created by Gleb on 15.08.2023.
//

import Foundation
import UIKit

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

