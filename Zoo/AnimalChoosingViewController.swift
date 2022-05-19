//
//  AnimalChoosingViewController.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

class AnimalChoosingViewController: UIViewController {
    var stackView: UIStackView!
    var scrollView: UIScrollView!
    
    var animalsData: [AnimalsData] = [
        AnimalsData.init(
        name: "amphibians",
        image: "amphibians",
        id: "01"
    ),
        AnimalsData.init(
            name: "Birds",
            image: "birds",
            id: "02"
        ),
        AnimalsData.init(
            name: "Fish",
            image: "fish",
            id: "03"
        ),
        AnimalsData.init(
            name: "Mammals",
            image: "mammals",
            id: "04"
        ),
        AnimalsData.init(
            name: "Reptiles",
            image: "reptiles",
            id: "05"
        )
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        initScrollView()
        initStackView()
        initAnimalsData()
        constructHierarchies()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAnimalsData() {
        for item in animalsData {
            let animal = AnimalsType()
            animal.translatesAutoresizingMaskIntoConstraints = false
            animal.set(value: item)
            animal.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(animal)
            
            NSLayoutConstraint.activate([
                animal.widthAnchor.constraint(equalToConstant: view.frame.width),
                animal.heightAnchor.constraint(equalToConstant: (view.frame.height)/4)
            ])
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
        let viewController = AnimalsTableView()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalChoosingViewController {
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 1000),
            
            stackView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
}
