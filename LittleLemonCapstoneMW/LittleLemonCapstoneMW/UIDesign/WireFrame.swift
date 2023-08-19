//
//  WireFrame.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI


struct WireFrame: View {
    
    
    var body: some View {
        
        VStack(spacing: 0, content: {
            
                VStack(spacing: 0, content: {
                   ZStack(content: {
                       Rectangle()
                            .frame(height: 50)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                       Text("Header")
                           .font(.title)
                   })

                    ZStack(content: {
                        Rectangle()
                            .frame(height: 250)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                        Text("Hero")
                            .font(.title)
                    })

                    
                    ZStack(content: {
                        Rectangle()
                            .frame(height: 80)
                            .colorMultiply(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                            .opacity(0.7)
                        Text("Menu Breakdown")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                    })
                    
                    ZStack(content: {
                        Rectangle()
                            .frame(height: 380)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        Text("Food Menu List")
                            .font(.title)
                    })
                    
                   
                    
                })
                
        })
    }
}

struct WireFrame_Previews: PreviewProvider {
    static var previews: some View {
        WireFrame()
    }
}

