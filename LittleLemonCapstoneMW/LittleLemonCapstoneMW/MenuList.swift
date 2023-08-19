//
//  MenuList.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/7/23.
//

import Foundation
import CoreData


class DishesModel: ObservableObject {
    
    /*private lazy var decoder: JSONDecoder = {
     let aDecoder = JSONDecoder()
     aDecoder.dateDecodingStrategy = .millisecondsSince1970
     return aDecoder
     }*/
    
    private let url = URL(String: "")!
    
    private let downloader: HTTPDataDownloader
    
    var dish: [MenuItem] {
        get async throws {
            let data = try await downloader.httpData(from: url)
            let allDishes = try decoder.decode(GeoJSON.self, from: data)
            return allDishes.dish
        }
    }
}
