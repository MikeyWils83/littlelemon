//
//  DishClient.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/8/23.
//

import Foundation

class DishClient {
    
    var dishes: [MenuItem] {
        get async throws {
            let data = try await downloader.httpData(from: gitURL)
            let allDishes = try decoder.decode(MenuJSON.self, from: data)
            return allDishes.menu
        }
    }
    
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .iso8601
        return aDecoder
    }()
    
    private let gitURL = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!

    private let downloader: any HTTPDataDownloader

    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
