//
//  UIAlert+.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 11.09.2022.
//

import Foundation
import  UIKit




extension UIViewController {
   func makeAlert(title: String, message: String) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
       
       let actionButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
       
       alert.addAction(actionButton)
       
       self.present(alert, animated: true, completion: nil)
       
   }
}
