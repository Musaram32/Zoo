//
//  ViewController.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var titleLabel: UILabel!
    var pickerView: UIPickerView!
    var button: UIButton!
    var pickerData = ["Armenian", "Russian", "English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitleLabel()
        initPicker()
        initButton()
        constructHierarchies()
        activateConstraints()
        
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
    }
    
    @objc func getStarted(sender: UIButton) {
        let viewController = AnimalChoosingViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension OnBoardingViewController {
    func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Welcome to the Zoo"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initPicker() {
        pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func initButton() {
        button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
    }
    
    func constructHierarchies() {
        view.addSubview(titleLabel)
        view.addSubview(pickerView)
        view.addSubview(button)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            pickerView.heightAnchor.constraint(equalToConstant: 150),
            pickerView.widthAnchor.constraint(equalToConstant: 300),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension OnBoardingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}



