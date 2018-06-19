//
//  AboutViewController.swift
//  Cars
//
//  Created by Luis Henrique on 18/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

let URL_ABOUT = "http://www.livroiphone.com.br/carros/sobre.html"
class AboutViewController: UIViewController {

    @IBOutlet var webView : UIWebView!
    @IBOutlet var progress : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title for navigation bar
        self.title = "About"
        // started animation the activity
        self.progress.startAnimating()
        // carries the URL
        let url = URL(string: URL_ABOUT)
        let request = URLRequest(url:url!)
        self.webView.loadRequest(request)
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
