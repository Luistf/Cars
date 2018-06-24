//
//  CarService.swift
//  Cars
//
//  Created by Luis Henrique on 21/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

class CarService {
    
    // search cars type esportivos, classicos ou luxo
    // static mathod
    class func getCarsByTypeFromFile(_ carType: String) -> Array<Car> {
        let file = "carros_" + carType
        let path = Bundle.main.path(forResource: file, ofType: "xml")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        let cars = parserXML_SAX(data!)
        return cars
    }
    
    // parser xml with sax
    // static mathod
    class func parserXML_SAX(_ data: Data) -> Array<Car> {
        if(data.count == 0) {
            return [] // array empty
        }
        var cars : Array<Car> = []
        let xmlParser = XMLParser(data: data)
        let carsParser = XMLCarParser()
        xmlParser.delegate = carsParser
        // start the parse com XMLPARSER, call XMLPARSER class
        let ok = xmlParser.parse()
        if(ok) {
            // did the parser successfully
            cars = carsParser.cars
            let count = cars.count
            print("Parser, found \(count) cars")
        } else {
            print("Error in parser")
        }
        // return cars list
        return cars
    }
    // static mathod that return array car
    class func getCars() -> Array<Car> {
        // declare array empty
        var cars : Array<Car> = []
        for i in 1...20 {
            let c = Car()
            c.name = "Ferrari " + String(i)
            c.desc = " Desc Ferrari carro " + String(i)
            c.url_photo = "ferrari_ff.png"
            // add car in array
            cars.append(c)
        }
        return cars
    }
}
