//
//  Alert.swift
//  Cars
//
//  Created by Luis Henrique on 21/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

class Alert {
    // static method
    class func alert(_ msg : String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
