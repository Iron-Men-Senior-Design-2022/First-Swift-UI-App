//
//  TrekrApp.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import SwiftUI

@main
struct TrekrApp: App {
    var body: some Scene {
        WindowGroup {
            //'NavigationView' is how we make a navigation bar at the top!
            NavigationView {
                ContentView(location: Locations().primary)
            }
        }
    }
}
