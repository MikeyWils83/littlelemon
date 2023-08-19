//
//  FoodMenuListView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

struct FoodMenuListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var foodeMenuModel = DishesModel()
    
    @State var searchText = ""
    
    //@ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    
    var body: some View {
        
        VStack {
            VStack {
                TextField("Search...", text: $searchText)
                    .font(.custom("Karla", size: 24))
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(Color("green"))
                    .padding()
               
                Text ("Tap to order")
                    .font(.custom("Karla", size: 16))
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color("yellow"))
                .cornerRadius(20)
            }
            
            NavigationView(content: {
                
                
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors(), content: {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { item in
                                DishRow(item)
                        }
                        
                    }
                    .listStyle(.inset)
                    //.searchable(text: $searchText)
                })
                //.border(.blue)
                
            })
            
        }
      
    }
    private func buildPredicate() -> NSPredicate {
        return searchText == "" ?
        NSPredicate(value: true) :
        NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "name",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }

}

struct FoodMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}
