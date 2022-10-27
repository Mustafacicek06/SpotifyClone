//
//  ProfileViewController.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            title = "Profile"
        view.backgroundColor = .white
        
        NetworkManager.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
   
    }
    

   

}
