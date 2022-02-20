//
//  TrekrApp.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import SwiftUI

@main
struct TrekrApp: App {
    //'@StateObject' is just like @State, but for classes and complex types, this allows us to recognize this class instance universally.
    //In order to use '@StateObject', the class needs to be an ObservableObject
    @StateObject var locations = Locations()
    
    var body: some Scene {
        WindowGroup {
            //Add a tab to the bottom for universal use!
            TabView {
                //'NavigationView' is how we make a navigation bar at the top!
                NavigationView {
                    //An instance of our content view!
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }
                
                //This allows us to create a secondary navigationview accessible through the tabview
                NavigationView {
                    //An instance of our world view!
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }
            }
            .environmentObject(locations) //This allows the object to be recognized by the enclosing environment.
        }
    }
}
