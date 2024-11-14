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
    
    // 버튼 4개 생성하기
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
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
        hstackview.backgroundColor = .black
        hstackview.axis = .horizontal
        hstackview.distribution = .fillEqually
        hstackview.alignment = .center
        hstackview.spacing = 10
        
        // 버튼 특성 설정
        button1.backgroundColor = UIColor(red: 50/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button1.setTitle("7", for: .normal)
        button1.layer.cornerRadius = 4
        
        button2.backgroundColor = UIColor(red: 50/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button2.setTitle("8", for: .normal)
        button2.layer.cornerRadius = 4
        
        button3.backgroundColor = UIColor(red: 50/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button3.setTitle("9", for: .normal)
        button3.layer.cornerRadius = 4
        
        button4.backgroundColor = UIColor(red: 50/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button4.setTitle("+", for: .normal)
        button4.layer.cornerRadius = 4
        
        
        
        // addSubview 추가로 나타나게 함 ( 클로저 사용으로 추후 추가될 것들에 재사용성 대비 )
        [label, hstackview]
            .forEach { view.addSubview($0) }
        // 버튼 스택뷰에 추가
        [button1, button2, button3, button4]
            .forEach { hstackview.addArrangedSubview($0) }
        
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
        
        // 버튼 크기 설정
        button1.snp.makeConstraints {
            $0.height.width.equalTo(80)
        }
        
        button2.snp.makeConstraints {
            $0.height.width.equalTo(80)
        }
        
        button3.snp.makeConstraints {
            $0.height.width.equalTo(80)
        }
        
        button4.snp.makeConstraints {
            $0.height.width.equalTo(80)
        }
        
    }
    
    // horizontalStackView 생성하는 메서드
    //    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
    //
    //    }
    //
}
