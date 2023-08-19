//
//  ContentView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI
import CoreData

class AppState: ObservableObject {
    @Published var state = false
}

struct ContentView: View {
    @EnvironmentObject var reg: AppState
    @State private var showOnboarding = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.name, ascending: true)],
        animation: .default)
    
    
    
   
    
    private var items: FetchedResults<Dish>
    
    var body: some View {
        VStack(spacing: 0, content: {
            HeaderView()
                
            TabView(content: {
                
                Home()
                    .tabItem({
                        Label("Home", systemImage: "house")
                    })
                
                NavigationView {
                    FoodMenuListView()
                    
                }
                .tabItem({
                    Label("Menu", systemImage: "menucard")
                })
                UserProfile()
                    .tabItem({
                        Label("Profile", systemImage: "square.and.pencil")
                    })
            })
            

        })
        .onAppear {
            if reg.state == false {
                showOnboarding = true
            }
            
        }
        .sheet(isPresented: $showOnboarding, content: {
        OnBoarding()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}

