//
//  CarService.swift
//  Cars
//
//  Created by Luis Henrique on 21/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

class CarService {
    // static mathod that return array car
    class func getCars() -> Array<Car> {
        // declare array empty
        var cars : Array<Car> = []
        for i in 1...20 {
            let c = Car()
            c.name = "Ferrari " + String(i)
            c.desc = "Desc Ferrari " + String(i)
            c.url_photo = "ferrari_ff.png"
            // add car in array
            cars.append(c)
        }
        return cars
    }
}
