//
//  ViewController.swift
//  GoDev
//
//  Created by SP12442 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var emailContainerView: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordContainerView: UIView!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBOutlet private weak var bottomContainerConstraint: NSLayoutConstraint!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - Private methods
    
    private func setupTextFields() {
        
        emailContainerView.layer.cornerRadius = 12
        emailContainerView.clipsToBounds = true
        
        emailTextField.delegate = self
        
        passwordContainerView.layer.cornerRadius = 12
        passwordContainerView.clipsToBounds = true
        
        passwordTextField.delegate = self
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            bottomContainerConstraint.constant = keyboardHeight - view.safeAreaInsets.bottom
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        bottomContainerConstraint.constant = 0
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Done",
            style: .cancel,
            handler: nil
        ))
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Public methods
    
    // MARK: - Actions
    
    @IBAction private func handleLogin(_ sender: UIButton) {
        view.endEditing(true)
        
        guard let email = emailTextField.text, email.isValidEmail else {
            showAlert(title: "Email Inválido", message: "Digite um email válido")
            return
        }
        
        guard let password = passwordTextField.text, password.isValidPassword else {
            showAlert(title: "Senha Inválida", message: "Digite uma senha válida")
            return
        }
        
        showAlert(title: "Sucesso", message: "Credenciais Válidas")
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
}
