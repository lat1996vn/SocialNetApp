//
//  NewPostVC.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class NewPostVC: UIViewController {
    // -MARK: variables
    let postContentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.backgroundColor = UIColor(rgb: 0xD8D8D8)
        return textView
    } ()
    
    let addPhotoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 14)
        label.text = "Add photo"
        return label
    } ()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(rgb: 0x979797).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(rgb: 0xD8D8D8)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 21)
        return button
    } ()
    
    let addPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(rgb: 0xF3C64C)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 22)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ADD", for: .normal)
        return button
    } ()
    
    // -MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        layoutNewPostVC()
        // Do any additional setup after loading the view.
    }
    
    // --MARK: functions
    func setupNavigationBar() {
        self.view.backgroundColor = .white
        self.title = "New Post"
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_back"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = . black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("NewPostVC deinit")
    }
    
    func layoutNewPostVC() {
        view.addSubview(postContentTextView)
        NSLayoutConstraint.activate([
            postContentTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            postContentTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postContentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postContentTextView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/4)
            ])
        
        view.addSubview(addPhotoLabel)
        NSLayoutConstraint.activate([
            addPhotoLabel.topAnchor.constraint(equalTo: postContentTextView.safeAreaLayoutGuide.bottomAnchor, constant: 13),
            addPhotoLabel.leadingAnchor.constraint(equalTo: postContentTextView.leadingAnchor),
            ])
        
        view.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.topAnchor.constraint(equalTo: addPhotoLabel.bottomAnchor, constant: 9),
            addPhotoButton.leadingAnchor.constraint(equalTo: postContentTextView.leadingAnchor),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 75),
            addPhotoButton.heightAnchor.constraint(equalTo: addPhotoButton.widthAnchor)
            ])
        
        view.addSubview(addPostButton)
        NSLayoutConstraint.activate([
            addPostButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPostButton.heightAnchor.constraint(equalToConstant: 50),
            addPostButton.widthAnchor.constraint(equalTo: addPostButton.heightAnchor, multiplier: 5.6)
            ])
        
    }
}


//extension UIButton {
//    func setRoundConer() {
//        self.layer
//    }
//}
