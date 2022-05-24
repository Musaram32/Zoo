//
//  AnimalsTableView.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

struct Animal {
    enum gender {
        case male
        case female
    }
    var imageString: String
    var name: String
    var info: String
}

struct Animals {
    static func getAnimals() -> [Animal] {
        var animals: [Animal] = []
        animals.append(
            Animal(
            imageString: "Mammals",
            name: "Colibri",
            info: "Lives in South America"
            )
        )
        return animals
    }
}

class AnimalsTableView: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AnimalCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animals.getAnimals().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! AnimalCell

        cell.data = Animals.getAnimals()[indexPath.row]
        return cell
    }
}
