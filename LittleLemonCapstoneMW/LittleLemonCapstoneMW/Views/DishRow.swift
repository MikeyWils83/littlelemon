//
//  DishRow.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/9/23.
//

import SwiftUI

struct DishRow: View {
    
    @ObservedObject private var dish: Dish
    @State private var image: UIImage?
    
    
    init(_ dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        
        HStack(alignment: .center, content: {
            
            VStack(alignment: .leading, content: {
                Text(dish.name)
                    .font(.custom("Karla", size: 18).weight(.bold))
                    
                Spacer()
                    .frame(height: 5)
                Text(dish.dishDescription)
                    .font(.custom("Karla", size: 16))
                    .foregroundColor(Color("green"))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 260)
                    .lineLimit(2)
                Spacer()
                
                Text("$ \(dish.price).00")
                    .font(.custom("Karla", size: 16).weight(.medium))
                    .foregroundColor(Color("green"))
            })
            Spacer()
            
            Image(dish.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
        })
        .onAppear { //becuase GITHUB URLs are broken
            if dish.image.contains("greekSalad")  {
                dish.image = "Greek salad"
            } else
            if dish.image.contains("grilledFish") {
                dish.image = "Grilled fish"
            } else
            if dish.image.contains("lemonDessert") {
                dish.image = "Lemon dessert"
            } else
            if dish.image.contains("pasta") {
                dish.image = "Pasta"
            } else
            if dish.image.contains("bruschetta") {
                dish.image = "Bruschetta"
            }
            
        }
    }
}

struct DishRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}
