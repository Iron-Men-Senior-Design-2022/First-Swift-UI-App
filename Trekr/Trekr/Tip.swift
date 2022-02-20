//
//  Tip.swift
//  Trekr
//
//  Created by Issam Abushaban on 2/20/22.
//

import Foundation

struct Tip: Decodable {
    let text: String
    //'?' represents optionality. It means it might be there or it might not.
    let children: [Tip]?    
}
