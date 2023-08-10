//
//  LoginViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit
import SnapKit
import Rswift
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    let mainLabel = UILabel()
    let subLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let forgotPasswordButton = UIButton()
    let loginButton = UIButton()
    let registerLabel = UILabel()
    let registerButton = UIButton()
    let logo = UIImageView()
    let errorLabel = UILabel()
    
    let defaults = UserDefaults()
    
    override func viewWillAppear(_ animated: Bool) {
        checkForLoggedIn()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupUI()
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(60)
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainLabel)
            make.top.equalTo(mainLabel.snp.bottom).offset(5)
            make.width.equalTo(mainLabel)
            make.height.equalTo(30)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainLabel)
            make.width.equalTo(100)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(subLabel.snp.bottom).offset(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalTo(emailLabel).offset(20)
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.width.equalTo(100)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalTo(passwordLabel).offset(20)
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.trailing.equalTo(passwordTextField.snp.trailing).inset(10)
            make.width.greaterThanOrEqualTo(100)
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(60)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(25)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.equalTo(registerLabel.snp.trailing).offset(5)
            make.centerY.equalTo(registerLabel.snp.centerY)
        }
        
        logo.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.top.equalToSuperview().offset(70)
            make.trailing.equalTo(loginButton.snp.trailing)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(60)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
    
    private func setupSubviews() {
        
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(registerLabel)
        view.addSubview(registerButton)
        view.addSubview(logo)
        view.addSubview(errorLabel)
    }
    
    func setupUI() {
        
        mainLabel.text = "Let's get started"
        mainLabel.textColor = .black
        mainLabel.textAlignment = .left
        mainLabel.font = R.font.kanitSemiBold(size: 30)
        
        subLabel.text = "Login into your account"
        subLabel.textColor = .gray
        subLabel.textAlignment = .left
        subLabel.font = UIFont(name: "SF Pro Display", size: 15)
        
        emailLabel.text = "Email"
        emailLabel.font = R.font.sfProDisplayBold(size: 20)
        emailLabel.textAlignment = .left
        emailLabel.textColor = .black
        
        passwordLabel.text = "Password"
        passwordLabel.font = R.font.sfProDisplayBold(size: 20)
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .black
        
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.cornerRadius = 10
        emailTextField.returnKeyType = .done
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .emailAddress
        emailTextField.backgroundColor = R.color.textFieldColor()
        emailTextField.autocapitalizationType = .none
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
        passwordTextField.textContentType = .oneTimeCode
        passwordTextField.backgroundColor = R.color.textFieldColor()
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.textAlignment = .left
        forgotPasswordButton.setTitleColor(R.color.mainBlue(), for: .normal)
        forgotPasswordButton.setTitleColor(.white, for: .highlighted)
        forgotPasswordButton.backgroundColor = .none
        forgotPasswordButton.titleLabel?.font = R.font.kanitSemiBold(size: 15)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordPressed), for: .touchUpInside)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(R.color.mainBlue(), for: .highlighted)
        loginButton.titleLabel?.font = R.font.kanitSemiBold(size: 17)
        loginButton.backgroundColor = R.color.mainBlue()
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        registerLabel.text = "First time?"
        registerLabel.textColor = .gray
        registerLabel.font = R.font.sfProDisplayRegular(size: 15)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(R.color.mainBlue(), for: .normal)
        registerButton.setTitleColor(.white, for: .highlighted)
        registerButton.titleLabel?.font = R.font.kanitSemiBold(size: 15)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        
        errorLabel.textColor = .red
        errorLabel.font = R.font.sfProDisplayRegular(size: 15)
        errorLabel.textAlignment = .center
        errorLabel.alpha = 0
        errorLabel.numberOfLines = 0
        
        logo.image = R.image.logo()
    }
    
    
    @objc func registerButtonPressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyboard.instantiateViewController(identifier: "RegisterViewControllerIdentifier") as RegisterViewController
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    @objc func loginButtonPressed() {
        
        defaults.setValue(true, forKey: Keys.isLoggedIn)
        signIn()
        
    }
    
    @objc func forgotPasswordPressed() {
        self.navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }
    
    private func signIn() {
        //Validating textfields
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            errorLabel.text = "Fill in all fields"
            errorLabel.alpha = 1
        } else {
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
                if error != nil {
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    self.navigationController?.pushViewController(TabBarController(), animated: true)
                }
            }
        }
    }
    
    private func checkForLoggedIn() {
        
        let tabBarVC = TabBarController()
        
        if defaults.bool(forKey: Keys.isLoggedIn) == true {
            self.navigationController?.pushViewController(tabBarVC, animated: true)
        } else { return }
    }
    
}


