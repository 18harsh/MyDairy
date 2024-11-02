//
//  ViewController.swift
//  MyDairy
//
//  Created by Harsh Gandhi on 02/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyDairy"
        let icon = UIImage(systemName: "plus") // SF Symbol icon
        let rightBarButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(plusIconTapped))
        
        // Add the button to the right side of the navigation bar
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func plusIconTapped() {
        
        
        let containerVC = MDCardViewController()
        let navController = UINavigationController(rootViewController: containerVC)
        navController.modalPresentationStyle = .overFullScreen
        present(navController, animated: true, completion: nil)
    }

}

