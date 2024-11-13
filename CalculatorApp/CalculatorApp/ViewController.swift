//
//  ViewController.swift
//  CalculatorApp
//
//  Created by YoungJin on 11/12/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        label.text = "12345"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        [label]
            .forEach { view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.trailing.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(100)
            
        }
        
        
    }
    
}
