//
//  Locations.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import Foundation

//A 'class' is more complicated and powerful than a struct as it can do things, and change overtime more. This one is an 'ObservalveObject', which means that Swift will watch it for changes so that the whole app can take action.
class Locations: ObservableObject {
    //'let' is for values that do not change
    let places: [Location]
    
    //'var' is for variable values that may change
    var primary: Location {
        places[0]
    }
    
    //'init()' is our initializer, and classes need them
    init() {
        //The '!' makes the app crash if the firl at the url can't load
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        
        //The '!' makes the app crash if the data can't load from the url
        let data = try! Data(contentsOf: url)
        
        //The '!' makes the app crash if the data is not containing location objects
        //We are trying to convert the json to location objects
        places = try! JSONDecoder().decode([Location].self, from: data)
    }
}
