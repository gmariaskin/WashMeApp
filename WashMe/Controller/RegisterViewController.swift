//
//  RegisterViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    private let mainLabel = UILabel()
    private let subLabel = UILabel()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let registerButton = UIButton()
    private let loginLabel = UILabel()
    private let loginButton = UIButton()
    private let errorLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupUI()
        setupConstraints()
        
    }
    
    //MARK: - Setup UI
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        let backButton = UIBarButtonItem(image: R.image.leftArrow(), style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = R.color.mainBlue()
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupSubviews(){
        
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(loginLabel)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
    }
    
    private func setupUI(){
        
        errorLabel.alpha = 0
        errorLabel.text = ""
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        
        mainLabel.text = "Register"
        mainLabel.textColor = .black
        mainLabel.textAlignment = .left
        mainLabel.font = R.font.kanitSemiBold(size: 30)
        
        subLabel.text = "Create your account"
        subLabel.textColor = .gray
        subLabel.textAlignment = .left
        subLabel.font = UIFont(name: "SF Pro Display", size: 15)
        
        nameLabel.text = "Name"
        nameLabel.font = R.font.sfProDisplayBold(size: 20)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        
        emailLabel.text = "Email"
        emailLabel.font = R.font.sfProDisplayBold(size: 20)
        emailLabel.textAlignment = .left
        emailLabel.textColor = .black
        
        passwordLabel.text = "Password"
        passwordLabel.font = R.font.sfProDisplayBold(size: 20)
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .black
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.layer.cornerRadius = 10
        nameTextField.placeholder = "Enter your name..."
        nameTextField.returnKeyType = .done
        nameTextField.autocapitalizationType = .words
        nameTextField.autocorrectionType = .no
        nameTextField.delegate = self
        
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.cornerRadius = 10
        emailTextField.placeholder = "Enter you email..."
        emailTextField.returnKeyType = .done
        emailTextField.autocorrectionType = .no
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.placeholder = "Enter your password..."
        passwordTextField.returnKeyType  = .done
        passwordTextField.autocorrectionType = .no
        passwordTextField.delegate = self
        passwordTextField.autocapitalizationType = .none
        //passwordTextField.isSecureTextEntry = true
        
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitleColor(R.color.mainBlue(), for: .highlighted)
        registerButton.titleLabel?.font = R.font.kanitSemiBold(size: 17)
        registerButton.backgroundColor = R.color.mainBlue()
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        
        loginLabel.text = "Already have an account?"
        loginLabel.textColor = .gray
        loginLabel.font = R.font.sfProDisplayRegular(size: 15)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitleColor(R.color.mainBlue(), for: .highlighted)
        registerButton.titleLabel?.font = R.font.kanitSemiBold(size: 20)
        registerButton.backgroundColor = R.color.mainBlue()
    }
    
    private func setupConstraints(){
        
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
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainLabel)
            make.width.equalTo(100)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(subLabel.snp.bottom).offset(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalTo(nameLabel).offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.width.equalTo(100)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalTo(emailLabel).offset(20)
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.width.equalTo(100)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(40)
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalTo(passwordLabel).offset(20)
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
        
        registerButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(60)
            
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Registration (Firebase)
    
    @objc private func registerButtonPressed() {
        
        let error = validateField()
        
        if error != nil {
            
            showError(error!)
            print(error!)
        } else {
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                
                if err != nil {
              
                    self.showError("Error creating user")
                } else {
                    
                    let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: ["email": email, "password": password, "UID": result?.user.uid as Any, "name": name]) { (error) in
                        if error != nil{
                            self.showError("Error saving user data")
                        } else{
                            self.transitionToHomePage(with: name)
                        }
                    }
                }
            }
        }
    }
    
    func transitionToHomePage(with name: String){
        print("Transitioning to Home Page with name: \(name)")
        let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarController
        
        view.window?.rootViewController = tabBarVC
        view.window?.makeKeyAndVisible()
    }
    func validateField() -> String? {
        
       if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains special character and a number."
        }
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}

