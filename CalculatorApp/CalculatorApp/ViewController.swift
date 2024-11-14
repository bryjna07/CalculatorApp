//
//  ViewController.swift
//  CalculatorApp
//
//  Created by YoungJin on 11/12/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // 레이블 생성
    let label = UILabel()
    
    let hstackview = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewDidLoad 될 때 configureUI 실행하여 라벨이 보이도록 함
        configureUI()
//        makeHorizontalStackView()
        
        
    }
    
    private func configureUI() {
        
        // 배경 검은색
        view.backgroundColor = .black
        
        // 레이블 특성 관련
        label.text = "12345"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        // Lv 2 UIStackView 를 사용하여 4개의 버튼 추가하기 ( horizontalStackView )
        // 스택뷰를 깔고 그위에 버튼을 4개 깐다 ?
        hstackview.backgroundColor = .green
        hstackview.axis = .horizontal
        hstackview.distribution = .fillEqually
        hstackview.alignment = .center
        hstackview.spacing = 10
        
        
        
        
        
        // addSubview 추가로 나타나게 함 ( 클로저 사용으로 추후 추가될 것들에 재사용성 대비 )
        [label, hstackview]
            .forEach { view.addSubview($0) }
        
        
        // SnapKit 을 활용한 AutoLayOut & Constraints 설정
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.trailing.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(100)
            
        }
        
        hstackview.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
            $0.width.equalTo(label.snp.width)
        }
        
       
        
        
    }
    
    // horizontalStackView 생성하는 메서드
//    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
//       
//    }
//    
}
