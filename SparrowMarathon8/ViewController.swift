//
//  ViewController.swift
//  SparrowMarathon8
//
//  Created by Dmitriy Shrayber on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let avatar = UIImageView(image: UIImage(systemName: "person.crop.circle.fill" ))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar"
        setupScrollView()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        guard let titleViewClass = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        
        DispatchQueue.main.async { [self] in
            self.navigationController?.navigationBar.subviews.forEach { subview in
               
                guard subview.isKind (of: titleViewClass.self) else { return }
                
                subview.addSubview(avatar)
                
                NSLayoutConstraint.activate([
                    avatar.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -12),
                    avatar.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -view.directionalLayoutMargins.trailing),
                    avatar.heightAnchor.constraint (equalToConstant: 40),
                    avatar.widthAnchor.constraint (equalTo: avatar.heightAnchor)
                ])
            }
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = .init(width: self.view.frame.width, height: 2000)
    }
}
