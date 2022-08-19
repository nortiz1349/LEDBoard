//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Nortiz M1 on 2022/08/19.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(
        text: String?,
        textColor: UIColor,
        backgroundColor: UIColor
    )
}

class SettingViewController: UIViewController {

    // 1. 설정 화면의 모든 오브젝트에 대한 아웃렛 변수 생성
    @IBOutlet weak var textField: UITextField!  // 텍스트 필드
    @IBOutlet weak var yellowButton: UIButton!  // 버튼 속성을 변경하기 위해 모든 버튼 아웃렛 변수 생성
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = ledText {
            self.textField.text = ledText
        }
        self.changeTextButtonColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgroundColor)
    }
    
    /*
     2. 텍스트 색상 설정 버튼에 대한 액션함수 정의
     3개의 버튼 중 하나를 드래그하여 함수코드를 생성한 뒤
     나머지 버튼을 생성된 함수위로 드래그&드랍하여 함수와 연결한다.
     각 버튼의 인스턴스는 sender 파라미터를 비교하는 방식으로 식별하여 사용할 수 있다.
     아래 함수에서는 sender 파라미터와 버튼 아웃렛 변수를 비교하여 어떤 버튼이 터치되었는지 알 수 있다.
     */
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextButtonColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextButtonColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextButtonColor(color: .green)
            self.textColor = .green
        }
    }
    
    // 배경 색상 설정 버튼 액션함수
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColorButton(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.changeBackgroundColorButton(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    // 저장 버튼 액션함수
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    // 3. 선택한 색상을 식별할 수 있도록 선택된 색상에 대해 alpha 값을 변경하는 함수
    private func changeTextButtonColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButton(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
