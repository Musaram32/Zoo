//
//  AnimalsTableView.swift
//  Zoo
//
//  Created by Aram Martirosyan on 19.05.22.
//

import UIKit

class AnimalsTableView: UIViewController, UITableViewDelegate {
    let tableViewData = Array(repeating: "Item", count: 5)
    var animalsTableView: UITableView!
    var animal: AnimalsData!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        initAnimalsTableView()
        constructHierarchies()
        activateConstraints()
        
        animalsTableView.register(UITableView.self, forCellReuseIdentifier: "TableViewCell")
        animalsTableView.dataSource = self
        animalsTableView.delegate = self
    }
    
    required init ?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnimalsTableView: UITableViewDataSource {
    func set(value: AnimalsData) {
        animal = value
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animalsTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = self.tableViewData[indexPath.row]
        return cell
    }
    
    func initAnimalsTableView() {
        animalsTableView = UITableView()
        animalsTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchies() {
        view.addSubview(animalsTableView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            animalsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animalsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animalsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animalsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
