//
//  AnimalInfoViewController.swift
//  Zoo
//
//  Created by Aram Martirosyan on 02.06.22.
//

import UIKit

class AnimalInfoViewController: UIViewController  {
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    var image: UIImageView!
    var name: UILabel!
    var info: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initScrollView()
        initStackView()
        initImage()
        initName()
        initInfo()
        constructHierarchies()
        activateConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(gearButtonPressed)
        )
    }
    
    @objc func gearButtonPressed() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}

extension AnimalInfoViewController {
    func initScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initStackView() {
        stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initImage() {
        image = UIImageView()
        image.image = UIImage(named: "lion2")
        image.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initName() {
        name = UILabel()
        name.text = NSLocalizedString("mammal1", comment: "")
        name.font = .systemFont(ofSize: 25, weight: .bold)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initInfo() {
        info = UILabel()
        info.text = NSLocalizedString("lionInfo", comment: "")
        info.font = .systemFont(ofSize: 22)
        info.textColor = .black
        info.numberOfLines = 0
        info.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(image)
        stackView.addSubview(info)
        view.addSubview(name)
        
    }
    
    func activateConstraints() {
        let frameLayoutGuide = scrollView.frameLayoutGuide
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 1000),
            
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            image.topAnchor.constraint(equalTo: stackView.topAnchor),
            image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            image.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15),
            image.bottomAnchor.constraint(equalTo: info.topAnchor, constant: -15),
            image.heightAnchor.constraint(equalToConstant: 250),
            
            info.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 300),
            info.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 15),
            info.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
}
