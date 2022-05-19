//
//  AnimalsType.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

struct AnimalsData {
    var name: String
    var image: String
    var id: String
}

class AnimalsType: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var id: String!
    
    init() {
        super.init(frame: .zero)
        initImageView()
        initButton()
        initTitleLabel()
        constructHierarchies()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed(sender: UIButton) {
        if let id = id {print(id)}
    }
}

extension AnimalsType {
    func set(value: AnimalsData) {
        titleLabel.text = value.name
        imageView.image = UIImage(named: value.image)
        id = value.id
    }
    
        func initImageView() {
            imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 12
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        func initTitleLabel() {
            titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 35, weight: .bold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    
    func initButton() {
        button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        addSubview(button)
        button.addSubview(imageView)
        button.addSubview(titleLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
}
