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
            name: "Lion",
            info: "The king of jungles"
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "tiger",
            name: "Tiger",
            info: "Lives in South America"
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "wolf",
            name: "Wolf",
            info: "Eats chicken"
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "fox",
            name: "Fox",
            info: "Is cunning"
            )
        )
        
        mammals.append(
            Mammals(
            imageString: "elephant",
            name: "Elephant",
            info: "Has big ears"
            )
        )
        
        return mammals
    }
}

struct Birds {
    enum gender {
        case male
        case female
    }
    var imageString: String
    var name: String
    var info: String
}

struct Bird {
    static func getAnimals() -> [Birds] {
        var birds: [Birds] = []
        birds.append(
            Birds(
            imageString: "lion",
            name: "Colibri",
            info: "The king of jungles"
            )
        )
        
        birds.append(
            Birds(
            imageString: "tiger",
            name: "Tiger",
            info: "Lives in South America"
            )
        )
        
        birds.append(
            Birds(
            imageString: "wolf",
            name: "Wolf",
            info: "Eats chicken"
            )
        )
        
        birds.append(
            Birds(
            imageString: "fox",
            name: "Fox",
            info: "Is cunning"
            )
        )
        
        birds.append(
            Birds(
            imageString: "elephant",
            name: "Elephant",
            info: "Has big ears"
            )
        )
        
        return birds
    }
}

class AnimalsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(AnimalCell.self, forCellReuseIdentifier: "DefaultCell")
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
}
