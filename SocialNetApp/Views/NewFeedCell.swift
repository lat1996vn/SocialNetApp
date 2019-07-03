//
//  newFeedCell.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

protocol NewFeedCellDelegate: AnyObject {
    func userImageButtonTappedCompleted()
    
    func likeButtonTappedCompleted()
    
}

class NewFeedCell: UITableViewCell {
    //postvar post: Post!
    //--MARK: variable
    weak var delegate: NewFeedCellDelegate?
    
    let userImageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 17.5
        btn.clipsToBounds = true
        return btn
    } ()
    
    let usernameLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Arial-BoldMT", size: 12)
        lbl.text = "Hirosi"
        return lbl
    } ()
    
    let timeCreatedLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Arial", size: 9)
        return lbl
    } ()
    
    let postContentLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Arial", size: 9)
        lbl.numberOfLines = 0
        return lbl
    } ()
    
    let postImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = UIView.ContentMode.scaleAspectFill
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    } ()
    
    let likeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "icon_like"), for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 17).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 17).isActive = true
        return btn
    } ()
    
    let likeCountLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "HiraginoSans-W6", size: 11)
        lbl.text = "15"
        lbl.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return lbl
    } ()
    
    let commentButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "icon_comments"), for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 17).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 17).isActive = true
        return btn
    } ()
    
    let commentCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "HiraginoSans-W6", size: 11)
        lbl.text = "5"
        lbl.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return lbl
    } ()
    
    //--MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addButtonActions()
        print("tocell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    //--MARK: functions
    
    fileprivate func setupViews() {
        self.addSubview(userImageButton)
        NSLayoutConstraint.activate([
            userImageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            userImageButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userImageButton.widthAnchor.constraint(equalTo: userImageButton.heightAnchor),
            userImageButton.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        let stackView1 = UIStackView(arrangedSubviews: [usernameLable,timeCreatedLabel])
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.alignment = .fill
        stackView1.axis = .vertical
        stackView1.distribution = .fill
        stackView1.spacing = 2
        self.addSubview(stackView1)
        NSLayoutConstraint.activate([
            stackView1.centerYAnchor.constraint(equalTo: userImageButton.centerYAnchor),
            stackView1.leadingAnchor.constraint(equalTo: userImageButton.trailingAnchor, constant: 7),
            stackView1.widthAnchor.constraint(equalToConstant: 43),
            stackView1.heightAnchor.constraint(equalToConstant: 26)
            ])
        
        self.addSubview(postContentLabel)
        NSLayoutConstraint.activate([
            postContentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            postContentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            postContentLabel.topAnchor.constraint(equalTo: userImageButton.bottomAnchor, constant: 8)
            ])
        
        self.addSubview(postImageView)
        NSLayoutConstraint.activate([
            postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            postImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            postImageView.topAnchor.constraint(equalTo: postContentLabel.bottomAnchor, constant: 7),
            ])

        
        let likeAndCommendStackView = UIStackView(arrangedSubviews: [likeButton, likeCountLable, commentButton, commentCountLabel])
        likeAndCommendStackView.translatesAutoresizingMaskIntoConstraints = false
        likeAndCommendStackView.alignment = .center
        likeAndCommendStackView.axis = .horizontal
        likeAndCommendStackView.distribution = .fillProportionally
        likeAndCommendStackView.spacing = 5
        self.addSubview(likeAndCommendStackView)
        NSLayoutConstraint.activate([
            likeAndCommendStackView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            likeAndCommendStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            likeAndCommendStackView.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor)
            ])
        
    }
    
    func addButtonActions() {
        userImageButton.addTarget(self, action: #selector(userImageButtonTapped), for: .touchUpInside)
    }
    
    @objc func userImageButtonTapped() {
        delegate?.userImageButtonTappedCompleted()
    }
    
    @objc func likeButtonTapped() {
        delegate?.likeButtonTappedCompleted()
    }
    
    func cellPostLoadData(post: Post){
        userImageButton.setImage(post.poster.image, for: .normal)
        usernameLable.text = post.poster.username
        timeCreatedLabel.text = "just now"
        postContentLabel.text = post.postContent
        postImageView.image = post.postImage
        likeCountLable.text = String(post.like)
        commentCountLabel.text = String(post.comment)
    }
    
}
