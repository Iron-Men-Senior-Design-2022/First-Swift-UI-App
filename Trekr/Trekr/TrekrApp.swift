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
                //This one allows us to create a 'navigationview' accessible through the tabview
                NavigationView {
                    //An instance of our world view!
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }
                
                //A NavigationView for the tips
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tips")
                }
            }
            .environmentObject(locations) //This allows the object to be recognized by the enclosing environment.
        }
    }
}
