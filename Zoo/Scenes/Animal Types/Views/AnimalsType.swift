//
//  AnimalsType.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

struct AnimalsTypeData {
    var id: Int
    var name: String
    var image: String
}

protocol AnimalButtonDelegate: AnyObject {
    func buttonPressed(id: Int)
}

class AnimalsType: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var id: String!
    var onSelection: ((Int) -> Void)?
    
    private(set) var data: AnimalsTypeData?
    weak var delegate: AnimalButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        initImageView()
        initButton()
        initTitleLabel()
        constructHierarchies()
        activateConstraints()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        guard let data = data else { return }
        delegate?.buttonPressed(id: data.id)
    }
    
    func set(data: AnimalsTypeData) {
        self.data = data
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.name
    }
}

extension AnimalsType {
        func initImageView() {
            imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 12
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        func initTitleLabel() {
            titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    
    func initButton() {
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        addSubview(button)
        addSubview(imageView)
        addSubview(titleLabel)

    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),

            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalToConstant: 190),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
