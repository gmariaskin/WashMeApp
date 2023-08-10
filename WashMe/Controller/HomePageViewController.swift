//
//  HomePageViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    
    let welcomeLabel = UILabel()
    var userName: String? {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        
        view.addSubview(welcomeLabel)
        
        welcomeLabel.font = R.font.kanitSemiBold(size: 30)
        welcomeLabel.textColor = .black
        updateUI()
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
    }
    
    private func updateUI() {
        if let userName = userName {
            welcomeLabel.text = "Welcome, \(userName)!"
        }
    }
}

