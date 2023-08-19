//
//  Dishes.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/8/23.
//

import SwiftUI
import Foundation



struct Dishes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @ObservedObject var viewModel = MenuBreakdownViewModel()
    
    @State private var showAlert = false
    @State var searchText = ""
    @State var load = false
    
  
    
    var body: some View {
        
        NavigationView(content: {
            
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    
                    List {
                        ForEach(dishes, id:\.self) { item in
                            
                            NavigationLink {
                                Text(item.dishDescription)
                                Divider()
                                Text(item.category)
                            } label: {
                                DishRow(item)
                            }
                        }
                        
                    }
                    .listStyle(.inset)
                }
        })
        .task {
            if !load {
                await dishesModel.reload(viewContext)
                load = true
            }
        }
    }
    
    private func buildPredicate() -> NSPredicate {
        return searchText == "" ?
        NSPredicate(value: true) :
        NSPredicate(format: "category CONTAINS[cd] %@", viewModel.search)
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "name",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }

}


struct Dishes_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}
