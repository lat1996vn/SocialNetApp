//
//  RegisterVC.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/2/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    let addPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 71
        button.backgroundColor = UIColor(rgb: 0xD8D8D8)
        button.setImage(#imageLiteral(resourceName: "plus_photo@2x"), for: .normal)
        
        return button
    } ()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = .done
        textField.placeholder = "username"
        return textField
    } ()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = .done
        textField.placeholder = "email"
        return textField
    } ()
    
    let passworkTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.placeholder = "password"
        return textField
    } ()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(rgb: 0xFFBB00)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 22)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func layoutRegisterVC() {
        view.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 142),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor)
            ])
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
