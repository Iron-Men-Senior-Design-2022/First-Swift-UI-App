//
//  WorldView.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

//MapKit is an apple library that allows us to use the Map!
import MapKit
import SwiftUI

struct WorldView: View {
    //'@State' is a property wrapper that tells SwiftUI that the var region is important to the state of the app.
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    var body: some View {
        //The '$' allows for two-way binding, making it possible to read and write to the this state variable.
        Map(coordinateRegion: $region).navigationTitle("Locations")
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
