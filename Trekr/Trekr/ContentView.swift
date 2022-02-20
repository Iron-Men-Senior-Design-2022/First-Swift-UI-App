//
//  ContentView.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    //By using a Location struct we can easily set up what we are displaying in the ContentView.
    let location: Location
    
    var body: some View {
        //The 'ScrollView' is a 'VStack' that allows scrolling.
        ScrollView {
            //Images are rendered like this
            //Modifiers '.********' allow us to modify things.
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            
            //Text is rendered like this
            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(location.description)
                .padding(.horizontal)
            
            Text("Did you know?")
                .font(.title3)
                .bold()
                .padding(.top)
            
            Text(location.more)
                .padding(.horizontal)
        }
        .navigationTitle("Discover") //We need this for the navigation bar
    }
}

//This instance of the content view is called the 'Preview' and only shows up for the developer!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //Add a tab to the bottom for universal use!
        TabView {
            //'NavigationView' is how we make a navigation bar at the top!
            NavigationView {
                //An instance of our content view!
                ContentView(location: Locations().primary)
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
    }
}
