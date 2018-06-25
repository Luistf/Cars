//
//  CarService.swift
//  Cars
//
//  Created by Luis Henrique on 21/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

class CarService {
    
        // search cars by type sports, classics, lux
        // static method
        class func getCarsByTypeFromFile(_ tipo: String) -> Array<Car> {
            let file = "carros_" + tipo
            print(file)
            let path = Bundle.main.path(forResource: file, ofType: "xml")
            let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
            let cars = parserXML_SAX(data!)
            return cars
        }

    // parser xml with SAX
    // static method
    class func parserXML_SAX(_ data: Data) -> Array<Car> {
        if(data.count == 0) {
            return [] //empty array
        }
        var cars : Array<Car> = []
        let xmlParser = XMLParser(data:data)
        let carsParser = XMLCarParser()
        xmlParser.delegate = carsParser
        let ok = xmlParser.parse()
        if(ok) {
            //did parser successfully
            cars = carsParser.cars
            let count = cars.count
            print("Parser, found \(count) cars")
        } else {
            print("Error in parser")
        }
        // return cars list
        return cars
    }
    
}
