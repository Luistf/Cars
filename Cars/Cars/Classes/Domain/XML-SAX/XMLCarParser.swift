//
//  XMLCarParser.swift
//  Cars
//
//  Created by Luis Henrique on 23/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

class XMLCarParser :NSObject, XMLParserDelegate {
    // car list
    var cars : Array<Car> = []
    // variables auxiliaries
    var tempString : String = ""
    var car : Car?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributesDict: [String : String]) {
        if("carro" == elementName) {
            // tag <carro> found, so create a new car object
            car = Car()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if("carro" == elementName) {
            // tag </name> found, so and xml
            return
        }
        if("carro" == elementName) {
            // insert car in array and clean object
            self.cars.append(car!)
            car = nil
            return
        }
        // if isn`t tag <carro> can be tags <nome>, <desc> etc...
        if("carro" != nil) {
            // copy attributes of car
            if("nome" == elementName) {
                car!.name = tempString
            } else if("desc" == elementName) {
                car!.desc = tempString
            }else if("url_foto" == elementName) {
                car!.url_photo = tempString
            } else if("url_info" == elementName) {
                car!.url_info = tempString
            } else if("url_video" == elementName) {
                car!.url_video = tempString
            } else if("latitude" == elementName) {
                car!.latitude = tempString
            } else if("longitude" == elementName) {
                car!.longitude = tempString
            }
            tempString = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // remove \n and \t in archive
        var s = string.replace("\n", with: "")
        s = s.replace("\t", with: "")
        s = s.trim()
        // does append string
        tempString += s
    }
}

extension String {
    func trim() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString
    }
    
    func replace(_ of: String, with: String) -> String {
        let s = self.replacingOccurrences(of: "\n", with: "")
        return s
    }
    
    func url() -> URL {
        return URL(string: self)!
    }
}

