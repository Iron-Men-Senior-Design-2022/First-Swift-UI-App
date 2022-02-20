//
//  Location.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import Foundation

//A 'struct' is a data holding device. It can be instantiated later. This one is 'Decodable' so that it can be read from a json. It is also 'Identifiable' so that SwiftUI can use it in a loop and know that different onesa re unique.
struct Location: Decodable, Identifiable {
    //The Property 'id' is recognized by swift for identifiable!
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
    //The example is a 'static' value because it should only really take up one place in memory, as a reference point for all instantiations of the 'struct'. It is shared between them.
    static let example = Location(id: 1, name: "Great Smokey Mountains", country: "United States", description: "A great place to visit.", more:"More text here...", latitude: 35.6532, longitude: -83.5070, heroPicture: "smokies", advisory: "Beware of the bears!")
}
