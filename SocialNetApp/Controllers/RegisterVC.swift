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
        button.clipsToBounds = true
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
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passworkTextField.delegate = self
        layoutRegisterVC()
        
        addButtonAction()
        // Do any additional setup after loading the view.
    }
    
    func layoutRegisterVC() {
        view.backgroundColor = .white
        view.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 142),
            addPhotoButton.widthAnchor.constraint(equalTo: addPhotoButton.heightAnchor)
            ])
        
        let userSignUpInfoStackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passworkTextField])
        userSignUpInfoStackView.axis = .vertical
        userSignUpInfoStackView.alignment = .fill
        userSignUpInfoStackView.distribution = .fillEqually
        userSignUpInfoStackView.spacing = 15
        userSignUpInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userSignUpInfoStackView)
        NSLayoutConstraint.activate([
            userSignUpInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userSignUpInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userSignUpInfoStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),
            userSignUpInfoStackView.widthAnchor.constraint(equalTo: userSignUpInfoStackView.heightAnchor, multiplier: 1.78)
            ])
        
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            registerButton.heightAnchor.constraint(equalToConstant: 52),
            registerButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor)
            ])
    }
    
    func addButtonAction() {
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc func addPhotoButtonTapped() {
        let imgPikerController = UIImagePickerController()
        imgPikerController.delegate = self
        imgPikerController.sourceType = .photoLibrary
        self.present(imgPikerController, animated: true)
    }
    
    @objc func registerButtonTapped(){
        let ac = UIAlertController(title: "Register Error!!", message: "Please enter all required fields to register", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (ation) in
            ac.dismiss(animated: true, completion: nil)
        }))
        
        guard let username = usernameTextField.text, username != "" else {
            self.present(ac, animated: true)
            return
        }
        
        guard let email = emailTextField.text, email != "" else {
            self.present(ac, animated: true)
            return
        }
        
        guard let password = passworkTextField.text, password != "" else {
            self.present(ac, animated: true)
            return
        }
        
        let user = User(username: username, password: password, email: email, image: addPhotoButton.image(for: .normal))
//        AppDelegate.user = user
        
        
        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            let viewController = MainVC(user: user)
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
        }
        
    }
    
}

extension RegisterVC: UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImagez = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        addPhotoButton.setImage(pickedImagez, for: .normal)
        self.dismiss(animated: true, completion: nil)
        
    }
}
