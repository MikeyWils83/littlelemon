//
//  DishProvider.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/8/23.
//

import Foundation

@MainActor
class DishesProvider: ObservableObject {
    
    @Published var dishes: [MenuItem] = []
    
    let client: DishClient
    
    func fetchDishes() async throws {
        let latestDishes = try await client.dishes
        self.dishes = latestDishes
    }
    
    func deleteDishes(atOffsets offsets: IndexSet) {
        dishes.remove(atOffsets: offsets)
    }
    
    init(client: DishClient = DishClient()) {
        self.client = client
    }
}
