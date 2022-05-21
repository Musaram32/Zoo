//
//  AnimalChoosingViewController.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

struct AnimalsData {
    var id: Int
    var name: String
    var imageName: String
    
    static var animals: [AnimalsData] = [
        AnimalsData(id: 1, name: "Mammals", imageName: "mammals"),
        AnimalsData(id: 2, name: "Birds", imageName: "birds"),
        AnimalsData(id: 3, name: "Fish", imageName: "fish")
    ]
}

class BaseViewController: UIViewController {
    var languageId: Int?
}

class AnimalChoosingViewController: BaseViewController {
    
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        checkLanguage(with: languageId!)
        initStackView()
        constructHierarchies()
        activateConstraints()
        createAnimalButtons()
        
        title = NSLocalizedString("animalType_title", comment: "")
//        label = NSLocalizedString("animals_title", comment: "")
        
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
    
    func checkLanguage(with Id: Int) {
        switch Id {
        case 0:
            print("Armenian")
        case 1:
            print("Russian")
        case 2:
            print("English")
        default:
            fatalError()
        }
    }
    
    func createAnimalButtons() {
        AnimalsData.animals.forEach { animal in
            let button = AnimalsType()
            button.delegate = self
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.set(
                data: AnimalsTypeData(
                    id: animal.id,
                    name: animal.name,
                    image: animal.imageName
                )
            )
            
            stackView.addArrangedSubview(button)
        }
    }
}

extension AnimalChoosingViewController: AnimalButtonDelegate {
    func buttonPressed(id: Int) {
        let viewController = AnimalsTableView()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalChoosingViewController {
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        view.addSubview(stackView)
 }
//
    func activateConstraints() {
        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor)
        ])
    }
}
