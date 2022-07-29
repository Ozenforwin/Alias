//
//  ViewController.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        //MARK: - это для проверки как работает
        title = "Меню"
        let image = UIImageView()
        image.image = UIImage(named: "Image")
        let button: UIButton = .createButton(title: "Bla bla", height: 100, color: .systemGray3, image: .init(named: "Image"))
        view.addSubview(button)
        button.addSubview(image)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc private func buttonTapped(){
        let topicViewController = TopicViewController()
        navigationController?.pushViewController(topicViewController, animated: true)
    }
}

