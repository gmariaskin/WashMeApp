//
//  UserProfileViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let logOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupUI()
        setupConstraints()
        
    }
    
    private func setupUI(){
        
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.setTitleColor(.red, for: .normal)
        logOutButton.titleLabel?.textAlignment = .center
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        logOutButton.backgroundColor = .gray
        logOutButton.setTitleColor(.white, for: .highlighted)
    }
    
    @objc func logOut() {
        
        let defaults = UserDefaults()
        defaults.set(false, forKey: Keys.isLoggedIn)
        navigationController?.popViewController(animated: true)
        print(navigationController!)
    }
    
    
    private func setupConstraints() {
        
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    private func setupSubviews() {
        
        view.addSubview(logOutButton)
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
    }
}
