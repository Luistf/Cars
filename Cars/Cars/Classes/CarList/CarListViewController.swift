//
//  CarListViewController.swift
//  Cars
//
//  Created by Luis Henrique on 18/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    var cars : Array<Car> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title for navigation bar
        self.title = "Cars"
        // delegate
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // this row is necessary for to use ReusableCellWithIdentifier
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.cars = CarService.getCars()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count // return lenght car list
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell this row
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        let row = indexPath.row
        // create object car type
        let car = self.cars[row]
        cell.textLabel!.text = car.name
        cell.imageView!.image = UIImage(named: car.url_photo)
        return cell
    }
    
    // execute method the row table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        // selected car
        let car = self.cars[row]
        // create view controller for navigation for view details
        let vc = DetailsCarViewController(nibName: "DetailsCarViewController", bundle: nil)
        vc.car = car // copy object for attribute car create in class
        self.navigationController!.pushViewController(vc, animated: true)
//        Alert.alert("Clicked on car: \(car.name)", viewController: self)
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
