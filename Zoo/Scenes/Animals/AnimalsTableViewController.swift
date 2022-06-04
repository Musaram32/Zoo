//
//  AnimalsTableView.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

struct Mammals {
    enum gender {
        case male
        case female
    }
    var imageString: String
    var name: String
    var info: String
}

struct Mammal {
    static func getAnimals() -> [Mammals] {
        var mammals: [Mammals] = []
        mammals.append(
            Mammals(
            imageString: "lion",
            name: NSLocalizedString("mammal1", comment: ""),
            info: NSLocalizedString("info1", comment: "")
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "tiger",
            name: NSLocalizedString("mammal2", comment: ""),
            info: NSLocalizedString("info2", comment: "")
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "wolf",
            name: NSLocalizedString("mammal3", comment: ""),
            info: NSLocalizedString("info3", comment: "")
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "fox",
            name: NSLocalizedString("mammal4", comment: ""),
            info: NSLocalizedString("info4", comment: "")
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "elephant",
            name: NSLocalizedString("mammal5", comment: ""),
            info: NSLocalizedString("info5", comment: "")
            )
        )
        
        return mammals
    }
}

class AnimalsTableViewController: UITableViewController {
    
    var thirdTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initThirdTitle()
        constructHierarchies()
        activateConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(gearButtonPressed)
        )
        
        tableView.register(AnimalCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    @objc func gearButtonPressed() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Mammal.getAnimals().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "DefaultCell", for: indexPath
        ) as! AnimalCell

        cell.mammalsData = Mammal.getAnimals()[indexPath.row]
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
       let viewController = AnimalInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalsTableViewController {
    func initThirdTitle() {
        thirdTitle = UILabel()
        thirdTitle.text = NSLocalizedString("name1", comment: "")
        thirdTitle.textAlignment = .center
        thirdTitle.font = .systemFont(ofSize: 25, weight: .bold)
        thirdTitle.textColor = .black
        thirdTitle.translatesAutoresizingMaskIntoConstraints = false
      }
    
    func constructHierarchies() {
        view.addSubview(thirdTitle)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            thirdTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            thirdTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
