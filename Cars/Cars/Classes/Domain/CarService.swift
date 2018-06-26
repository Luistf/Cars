//
//  CarService.swift
//  Cars
//
//  Created by Luis Henrique on 21/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

class CarService {
    // search cars type
    // static method
    class func getCarsByTypeFromFile(_ tipo: String) -> Array<Car> {
        let file = "carros_" + tipo
        let path = Bundle.main.path(forResource: file, ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        // does parse
        let cars = parserJson(data!)
        return cars
    }
    
    // Parser Json
    // static method
    class func parserJson(_ data: Data) -> Array<Car> {
        var cars : Array<Car> = [] // array empty
        // does reading json
        do {
            // convert json in NSArray
            let arrayCars = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            // array cars
            for obj in arrayCars {
                let dict = obj as! NSDictionary
                let car = Car()
                car.name = dict["nome"] as! String
                car.desc = dict["desc"] as! String
                car.url_info = dict["url_info"] as! String
                car.url_photo = dict["url_foto"] as! String
                car.url_video = dict["url_video"] as! String
                car.latitude = dict["latitude"] as! String
                car.longitude = dict["longitude"] as! String
                cars.append(car)
            }
        } catch let error as NSError {
            print("Error reading Json \(error)")
        }
        // return car list
        return cars
    }
}
