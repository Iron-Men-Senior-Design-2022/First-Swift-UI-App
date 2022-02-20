//
//  TipsView.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import SwiftUI

struct TipsView: View {
    let tips: [Tip]
    
    //'init()' is our initializer, and classes need them
    init() {
        //The '!' makes the app crash if the firl at the url can't load
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        
        //The '!' makes the app crash if the data can't load from the url
        let data = try! Data(contentsOf: url)
        
        //The '!' makes the app crash if the data is not containing tip objects
        //We are trying to convert the json to tip objects
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }
    
    var body: some View {
        //Since "tip" has no propert called id we need to explicitly tell swiftUI
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage:"quote.bubble")
                .font(.headline)
            }
            else {
                Text(tip.text)
            }
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        //Add a tab to the bottom for universal use!
        TabView {
            //A NavigationView for the tips
            NavigationView {
                TipsView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Tips")
            }
        }
    }
}
