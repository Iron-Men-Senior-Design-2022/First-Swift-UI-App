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
    //'@EnvironmentObject' is a property wrapper that tells the world view to look for an environmental object that conforms to the class Locations.
    @EnvironmentObject var locations: Locations
    
    //'@State' is a property wrapper for structs and simple items that tells SwiftUI that the var region is important to the state of the app.
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    var body: some View {
        //The '$' allows for two-way binding, making it possible to read and write to the this state variable.
        Map(coordinateRegion: $region, annotationItems: locations.places) {
            //This allows us to annotate each item in locations.places, with their images.
            location in
            MapAnnotation ( coordinate:
                CLLocationCoordinate2D (
                latitude: location.latitude,
                longitude: location.longitude)) {
                    //A navigation link at each coordinate!
                    NavigationLink(destination: ContentView(location: location)) {
                        //The Image is now the content that gets tapped to access the navigation link
                        Image(location.country)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 80, height: 40)
                            .shadow(radius: 3)
                    }
            }
        }
        .navigationTitle("Locations")
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
