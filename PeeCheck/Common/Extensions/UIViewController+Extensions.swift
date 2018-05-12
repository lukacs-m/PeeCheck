//
//  UIViewController+Extensions.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 09/05/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title: String = "", message: String = "", style: UIAlertControllerStyle = .alert, actions: [UIAlertAction]? = [UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        // add the actions (buttons)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        }

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
