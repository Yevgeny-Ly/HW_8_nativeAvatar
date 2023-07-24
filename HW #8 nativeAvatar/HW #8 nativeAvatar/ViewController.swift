//
//  ViewController.swift
//  HW #8 nativeAvatar
//
//  Created by Евгений Л on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let avatarImage: UIImageView = {
        let imageView                    = UIImageView(image: .init(systemName: "person.crop.circle.fill"))
        imageView.tintColor              = .systemBlue
        imageView.contentMode            = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scrollView: UIScrollView    = {
        let scroll                          = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle               = .black
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private var customLargeTitleView: UIView = {
        let view                             = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let navigationBar = navigationController?.navigationBar else { return }

        navigationBar.subviews.forEach {
            guard $0.description.contains("UINavigationBarLargeTitleView") else { return }
            customLargeTitleView = $0
        }

        setupLayoutForTitleView()
    }
    
    private func setupNavBar() {
        guard let navigationBar          = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
        title                            = "Avatar"
        
        navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
    }
    
    private func setupAppearance() {
        view.backgroundColor   = .white
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
    }
    
    private func setupLayoutForTitleView() {
        customLargeTitleView.addSubview(avatarImage)

        NSLayoutConstraint.activate([
            avatarImage.trailingAnchor.constraint(equalTo: customLargeTitleView.trailingAnchor, constant: -16),
            avatarImage.bottomAnchor.constraint(equalTo: customLargeTitleView.bottomAnchor, constant: -12),
            avatarImage.heightAnchor.constraint(equalToConstant: 36),
            avatarImage.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
