//
//  Animal.swift
//  Zoo
//
//  Created by Aram Martirosyan on 21.05.22.
//

import UIKit

class AnimalCell: UITableViewCell {
    
  var animalImageView: UIImageView!
  var name: UILabel!
  var info: UILabel!
   
  var mammalsData: Mammals? {
    didSet {
      guard let data = mammalsData else { return }
      animalImageView.image = UIImage(named: data.imageString)
        name.text = data.name
        info.text = data.info
    }
  }
    
    var birdsData: Birds? {
      didSet {
        guard let data = birdsData else { return }
        animalImageView.image = UIImage(named: data.imageString)
          name.text = data.name
          info.text = data.info
      }
    }
    
//    var fishesData: Fishes? {
//      didSet {
//        guard let data = fishesData else { return }
//        animalImageView.image = UIImage(named: data.imageString)
//          name.text = data.name
//          info.text = data.info
//      }
//    }
   
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }
   
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
   
  func commonInit() {
    initImageView()
    initName()
    initInfo()
    consructHierarchy()
    activateConstraints()
  }
}

extension AnimalCell {
  func initImageView() {
    animalImageView = UIImageView()
    animalImageView.layer.cornerRadius = 50
    animalImageView.image = UIImage(named: "Mammals")
    animalImageView.clipsToBounds = true
    animalImageView.contentMode = .scaleAspectFill
    animalImageView.translatesAutoresizingMaskIntoConstraints = false
  }
    
    func initName() {
        name = UILabel()
        name.textAlignment = .center
        name.textColor = .black
        name.font = .systemFont(ofSize: 25, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initInfo() {
        info = UILabel()
        info.textAlignment = .center
        info.textColor = .black
        info.font = .systemFont(ofSize: 20)
        info.translatesAutoresizingMaskIntoConstraints = false
    }
   
  func consructHierarchy() {
    addSubview(animalImageView)
    addSubview(name)
    addSubview(info)
      
     
  }
   
  func activateConstraints() {
    NSLayoutConstraint.activate([
      animalImageView.widthAnchor.constraint(equalToConstant: 100),
      animalImageView.heightAnchor.constraint(equalToConstant: 100),
      animalImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      animalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      animalImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      
      name.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 15),
      name.topAnchor.constraint(equalTo: topAnchor, constant: 25),
      
      info.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 15),
      info.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
    ])
  }
}







