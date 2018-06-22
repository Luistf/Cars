//
//  DetailsCarViewController.swift
//  Cars
//
//  Created by Luis Henrique on 22/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

class DetailsCarViewController: UIViewController {
    @IBOutlet var img : UIImageView!
    @IBOutlet var tDesc : UITextView!
    var car: Car? // declared variable optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let c = car { // test variable car is nil and create variable c
            self.title = c.name
            self.tDesc.text = c.desc
            let img = UIImage(named: c.url_photo)
            self.img.image = img
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
