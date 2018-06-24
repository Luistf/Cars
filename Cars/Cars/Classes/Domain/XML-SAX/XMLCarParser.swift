//
//  XMLCarParser.swift
//  Cars
//
//  Created by Luis Henrique on 23/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString
    }
    
    func replace(_of: String, with: String) -> String {
        let s = self.replacingOccurrences(of: "\n", with: "")
        return s
    }
    
    func url() -> URL {
        return URL(string: self)!
    }
}

class XMLCarParser: NSObject, XMLParserDelegate {
    // car list
    var cars : Array<Car> = []
    // variable auxialiaries for parser
    var tempString : String = ""
    var car: Car?
    
    func parse(_parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if("carro" == elementName) {
            // tag <car> found create a new object car
            car = Car()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if("carro" == elementName) {
            // tag of end </car> found, means and xml
            return
        }
        if("carro" == elementName) {
            // insert car in array and clean object
            self.cars.append(car!)
            car = nil
            return
        }
        // if isn`t the tag <carro> can be the tag <nome>, <desc> etc.
        // copy the values of xml for car object
        // if tags found with the same name @property the value is copied
        if("carro" != nil) {
            // copy the car attributes
            if("carro" == elementName) {
                car!.name = tempString
            } else if("desc" == elementName) {
                car!.desc = tempString
            } else if("url_foto" == elementName) {
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
        // remove \n\t in architect
        var s = string.replace(_of: "\n", with: "")
        s = s.replace(_of: "\t", with: "")
        s = s.trim()
        // does append string
        tempString += s
    }
}
