//
//  LearnViewController.swift
//  WashMe
//
//  Created by Gleb on 12.08.2023.
//

import UIKit
import SnapKit

class LearnViewController: UIViewController {
    
    let headerLabel = UILabel()
    let subLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupUI()
        setupConstraints()
        
        
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        
        view.addSubview(headerLabel)
        view.addSubview(subLabel)
    }
    
    private func setupConstraints() {
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(view.snp.top).offset(70)
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }
    
    private func setupUI(){
        
        headerLabel.text = "What do they mean?"
        headerLabel.font = R.font.kanitSemiBold(size: 30)
        headerLabel.textColor = R.color.mainBlue()
        headerLabel.textAlignment = .center
        
        subLabel.text = "Laundry signs"
        subLabel.textColor = .black
        subLabel.font = R.font.sfProDisplayBold(size: 20)
        subLabel.textAlignment = .center
        
    }
    
    
}
