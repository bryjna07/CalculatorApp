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
    
    // 버튼 생성하기
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    
    let button9 = UIButton()
    let button10 = UIButton()
    let button11 = UIButton()
    let button12 = UIButton()
    
    // verticalStackView 생성
    // Lv2 와 다르게 버티컬스택뷰만 만듦, 가로스택뷰를 위에 올리기만 하면 되기 때문
    let vstackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewDidLoad 될 때 configureUI 실행하여 라벨이 보이도록 함
        configureUI()
        
        
    }
    
    private func configureUI() {
        
        // 배경 검은색
        view.backgroundColor = .black
        
        // 레이블 특성 관련
        label.text = "12345"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        // 배열생성 및 스택뷰에 올리기 위해 버튼을 배열로 한줄씩 묶기
        let firstButtons = createButtons(titles: ["7", "8", "9", "+"])
        let secondButtons = createButtons(titles: ["4", "5", "6", "-"])
        let thirdButtons = createButtons(titles: ["1", "2", "3", "*"])
        let fourthButtons = createButtons(titles: ["AC", "0","=", "/"])
        
        // 버티컬 스택뷰 설정
        vstackView.backgroundColor = .black
        vstackView.axis = .vertical
        vstackView.spacing = 10
        vstackView.distribution = .fillEqually
        
        // 버티컬 스택뷰에 버튼 4개씩 올린 가로 스택뷰를 올림
        vstackView.addArrangedSubview(makeHorizontalStackView(firstButtons))
        vstackView.addArrangedSubview(makeHorizontalStackView(secondButtons))
        vstackView.addArrangedSubview(makeHorizontalStackView(thirdButtons))
        vstackView.addArrangedSubview(makeHorizontalStackView(fourthButtons))
        
        // addSubview 추가로 나타나게 함 ( 클로저 사용으로 추후 추가될 것들에 재사용성 대비 )
        [label, vstackView]
            .forEach { view.addSubview($0) }
        
        // SnapKit 을 활용한 레이블의 AutoLayOut & Constraints 설정
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
        
        // 버티컬 스택뷰의 오토레이아웃 설정
        vstackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(350)
        }
        
    }
    
    // 버튼 생성 메서드
    private func createButtons(titles: [String]) -> [UIButton] {
        return titles.map { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 50/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 4
            
            // button.snp.makeConstraints { $0.height.width.equalTo(80) }
            // 버튼의 크기를 따로 지정해주지 않아도 스택뷰의 fillEqually 가 크기를 자동으로 정해줌
            return button
        }
    }
    
    
    // horizontalStackView 생성하는 메서드
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //  stackView.alignment = .fill
        // distribution 을 fillEqually 로 설정했기 때문에 alignment를 따로 설정하게되면 가로스택뷰의 버튼 높이가 달라질 수 있다.
        stackView.spacing = 10
        
        //  stackView.snp.makeConstraints { $0.height.equalTo(80) }
        // Lv2에서는 가로스택뷰만 만들었기 때문에 사용했지만
        // 세로 스택뷰에 넣게 되면서 버튼의 크기를 따로 지정해주지 않아도 스택뷰의 fillEqually 가 크기를 자동으로 정해줌
        return stackView
    }
    
}
