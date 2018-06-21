//
//  CarListViewController.swift
//  Cars
//
//  Created by Luis Henrique on 18/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title for navigation bar
        self.title = "Cars"
        // delegate
        self.tableView.dataSource = self
        // this row is necessary for to use ReusableCellWithIdentifier
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // return 10 rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell this row
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        let row = indexPath.row
        cell.textLabel!.text = "Car \(row)"
        cell.imageView!.image = UIImage(named: "ferrari_ff.png")
        return cell
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
