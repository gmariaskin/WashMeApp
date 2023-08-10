//
//  ForgotPasswordViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit
import SnapKit
import Rswift
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    
    let mainLabel = UILabel()
    let sublabel = UILabel()
    let emailTextField = UITextField()
    let submitButton = UIButton()
    let logo = UIImageView()
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        let backButton = UIBarButtonItem(image: R.image.leftArrow(), style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = R.color.mainBlue()
        
        
        view.addSubview(mainLabel)
        view.addSubview(sublabel)
        view.addSubview(emailTextField)
        view.addSubview(submitButton)
        view.addSubview(logo)
        view.addSubview(errorLabel)
        
        mainLabel.text = "Forgot password?"
        mainLabel.font = R.font.kanitSemiBold(size: 30)
        mainLabel.textColor = .black
        mainLabel.textAlignment = .center
        
        sublabel.text = "Reset your password"
        sublabel.font = R.font.sfProDisplayRegular(size: 15)
        sublabel.textColor = .gray
        sublabel.textAlignment = .center
        
        emailTextField.placeholder = "Email Address"
        emailTextField.layer.cornerRadius = 15
        emailTextField.borderStyle = .roundedRect
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .newPassword
        emailTextField.backgroundColor = R.color.textFieldColor()
        emailTextField.delegate = self
        emailTextField.returnKeyType = .done
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.setTitleColor(R.color.mainBlue(), for: .highlighted)
        submitButton.titleLabel?.font = R.font.kanitSemiBold(size: 17)
        submitButton.backgroundColor = R.color.mainBlue()
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        
        
        
        logo.image = R.image.logo()
        
        navigationItem.leftBarButtonItem = backButton
        
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(logo.snp.bottom).offset(20)
        }
        
        sublabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(sublabel.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
        
        submitButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
        }
        
        logo.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(submitButton.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
        
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func logOut() {
        
        
        errorLabel.text = validateField()
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().sendPasswordReset(withEmail: email ) { error in
            if let error = error {
                self.errorLabel.text = String(error.localizedDescription)
            } else {
                self.errorLabel.textColor = .black
                self.errorLabel.text = "Check your email to reset your password"
            }
        }
    }
    
    func validateField() -> String? {
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedEmail) == false {
            return "Please make sure your password is at least 8 characters, contains special character and a number."
        }
        return nil
    }
}


