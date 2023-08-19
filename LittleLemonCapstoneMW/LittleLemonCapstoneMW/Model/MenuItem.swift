//
//  MenuItem.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/7/23.
//

import Foundation

struct MenuJSON: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
    
}

