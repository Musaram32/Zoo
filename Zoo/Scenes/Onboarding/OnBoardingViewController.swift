//
//  ViewController.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var titleLabel: UILabel!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initTitleLabel()

        initButton()
        constructHierarchies()
        activateConstraints()
        
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
    }
    
    @objc func getStarted(sender: UIButton) {
        let viewController = AnimalChoosingViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func languageChanged(sender: UIPickerView) {
        titleLabel.text = NSLocalizedString("title", comment: "")
    }
}

extension OnBoardingViewController {
    func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("title", comment: "")
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initButton() {
        button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle(NSLocalizedString("button", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
    }
    
    func constructHierarchies() {
        view.addSubview(titleLabel)
        view.addSubview(button)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}



