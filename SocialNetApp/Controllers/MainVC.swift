//
//  ViewController.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // --MARK: variables
    var user: User
    var posts: [Post] = []
    var newsFeedTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    } ()
    
    // --MARK: viewDidLoad
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.register(NewFeedCell.self, forCellReuseIdentifier: "cellID")
        setupNavigationBar()
        layoutMainVC()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
    }

    // --MARK: table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? NewFeedCell {
            cell.cellPostLoadData(post: posts[indexPath.row])
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // --MARK: functions
    func setupNavigationBar() {
        self.view.backgroundColor = .white
        self.title = "Feed"
        let newPostButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_add"), style: .plain, target: self, action: #selector(addNewButtonTapped))
        newPostButton.tintColor = . black
        self.navigationItem.rightBarButtonItem = newPostButton
    }
    
    @objc func addNewButtonTapped() {
        let vc = NewPostVC(poster: user)
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func layoutMainVC() {
        self.view.addSubview(newsFeedTableView)
        
        NSLayoutConstraint.activate([
            newsFeedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsFeedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsFeedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsFeedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension MainVC: NewFeedCellDelegate, NewPostVCDelegate {
    func addPostButtonTapComplete(post: Post) {
        posts.insert(post, at: 0)
        self.newsFeedTableView.reloadData()
    }
    
    func likeButtonTappedCompleted() {
        
    }
    
    func userImageButtonTappedCompleted() {
        self.navigationController?.pushViewController(UserProfileVC(user: user), animated: true)
    }
    
}
