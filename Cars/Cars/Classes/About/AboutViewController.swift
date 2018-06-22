//
//  AboutViewController.swift
//  Cars
//
//  Created by Luis Henrique on 18/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

let URL_ABOUT = "http://www.livroiphone.com.br/carros/sobre.htm"
class AboutViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView : UIWebView!
    @IBOutlet var progress : UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewDidLoad()
        // title for navigation bar
        self.title = "Sobre"
        // started animation the activity
        self.progress.startAnimating()
        // carries the URL
        let url = URL(string: URL_ABOUT)
        let request = URLRequest(url: url!)
        self.webView.loadRequest(request)
        // delegate
        self.webView.delegate = self
    }
    
    // method of protocol
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // stoped animation
        progress.stopAnimating()
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
