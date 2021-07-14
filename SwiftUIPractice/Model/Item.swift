//
//  Item.swift
//  SwiftUIPractice
//
//  Created by Elina Mansurova on 2021-07-14.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [
    
    Item(title: "Ceramic Mug", subtitle: "Ceramics", price: "$36", rating: "5.0", image: "ceramic_mug"),
    Item(title: "Zenza Bronica S2A", subtitle: "Film Camera", price: "$679", rating: "4.5", image: "zenza_bronica"),
    Item(title: "Yamaha FG Japanese Acoustics", subtitle: "Guitar", price: "$300", rating: "4.0", image: "guitar"),
    Item(title: "Beige Abstract", subtitle: "Eyewear", price: "$250", rating: "4.0", image: "eyewear")
    
]
