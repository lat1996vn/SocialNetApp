//
//  UserProfileVC.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController, UITextFieldDelegate {
    //--MARK: variables
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "user_image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    } ()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 20
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = .done
        return textField
    } ()
    
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 20
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = .done
        return textField
    } ()
    
    let birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(rgb: 0xD8D8D8)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textField.layer.cornerRadius = 20
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = .done
        return textField
    } ()
    
    //--MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        addressTextField.delegate = self
        birthdayTextField.delegate = self
        setupNavigationBar()
        layoutUserProfileVC()
    }
    
    //--MARK: functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func setupNavigationBar() {
        self.view.backgroundColor = .white
        self.title = "Profile"
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_back"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = . black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("ProfileVC deinit")
    }
    
    func layoutUserProfileVC() {
        view.addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor)
            ])
        
        let userInforTextFieldStackView = UIStackView(arrangedSubviews: [usernameTextField,addressTextField,birthdayTextField])
        userInforTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        userInforTextFieldStackView.axis = .vertical
        userInforTextFieldStackView.alignment = .fill
        userInforTextFieldStackView.distribution = .fillEqually
        userInforTextFieldStackView.spacing = 16
        
        view.addSubview(userInforTextFieldStackView)
        NSLayoutConstraint.activate([
            userInforTextFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInforTextFieldStackView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            userInforTextFieldStackView.heightAnchor.constraint(equalToConstant: 155),
            userInforTextFieldStackView.widthAnchor.constraint(equalToConstant: 335)
            ])
    }

}
