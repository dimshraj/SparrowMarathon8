//
//  ViewController.swift
//  SparrowMarathon8
//
//  Created by Dmitriy Shrayber on 22.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
//        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    private let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill" ))
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        self.title = "Avatar"
        setupNavigationBar()
        setupScrollView()
        self.view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {

        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -16),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(navigationController?.navigationBar.frame.size)
       
    }
}
