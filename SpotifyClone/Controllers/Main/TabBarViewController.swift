//
//  TabBarViewController.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vcOne = HomeViewController()
        let vcTwo = SearchViewController()
        let vcThree = LibraryViewController()
        
        vcOne.navigationItem.largeTitleDisplayMode = .always
        vcTwo.navigationItem.largeTitleDisplayMode = .always
        vcThree.navigationItem.largeTitleDisplayMode = .always
        
        
        vcOne.title = "Browse"
        vcTwo.title = "Search"
        vcThree.title = "Library"
        
        let navigationOne = UINavigationController(rootViewController: vcOne)
        let navigationTwo = UINavigationController(rootViewController: vcTwo)
        let navigationThree = UINavigationController(rootViewController: vcThree)
        
        // labe is dark mode in white , normal mode in black
        navigationOne.navigationBar.tintColor = .label
        navigationTwo.navigationBar.tintColor = .label
        navigationThree.navigationBar.tintColor = .label
        
        navigationOne.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navigationTwo.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        navigationThree.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        
        navigationOne.navigationBar.prefersLargeTitles = true
        navigationTwo.navigationBar.prefersLargeTitles = true
        navigationThree.navigationBar.prefersLargeTitles = true
        
        
        setViewControllers([navigationOne,navigationTwo,navigationThree], animated: true)
    }
    

  

}
