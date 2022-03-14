//
//  ViewController.swift
//  CalculoIMC
//
//  Created by SP12442 on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var weightTextField: UITextField!
    @IBOutlet private weak var heightTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        dismissKeyboard()
    }
    
    // MARK: - Private methods
    
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func updateResult(text: String) {
        resultLabel.text = text
        resultLabel.isHidden = false
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    @IBAction private func handleCalculate(_ sender: UIButton) {
        dismissKeyboard()
        
        let strWeight = weightTextField.text?.replacingOccurrences(of: ",", with: ".")
        let strHeight = heightTextField.text?.replacingOccurrences(of: ",", with: ".")
        
        guard let strWeight = strWeight, let strHeight = strHeight, let floatWeight = Float(strWeight), let floatHeight = Float(strHeight) else {
            updateResult(text: "❌\nValores inválidos")
            return
        }
        
        let imc = floatWeight / pow(floatHeight, 2)
        
        switch imc {
        case 0..<18.5:
            updateResult(text: "🙃\nVocê está abaixo do seu peso ideal")
        case 18.5..<25:
            updateResult(text: "✅\nVocê está no seu peso ideal")
        case 25..<30:
            updateResult(text: "🤐\nVocê está com sobrepeso")
        case 30..<35:
            updateResult(text: "🤐🤐\nVocê está com obesidade grau 1")
        case 35..<40:
            updateResult(text: "🤐🤐🤐\nVocê está com obesidade grau 2")
        case 40...:
            updateResult(text: "☠️\nVocê está com obesidade grau 3")
        default:
            updateResult(text: "❌\nValores inválidos")
        }
    }
    
}

