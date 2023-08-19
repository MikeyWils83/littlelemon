//
//  Theme.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/13/23.
//

import SwiftUI

extension Color {
    struct Theme {
        static let greenLL = Color("green")
        static let yellowLL = Color("yellow")
        static let salmonLL = Color("peach")
        static let peachLL = Color("pink")
        static let lightGrayLL = Color("gray")
        static let darkGrayLL = Color("darkGray")
    }
}
extension Font {
    struct Theme {
        static let displayTitle = Font.custom("Markazi Text", size: 64).weight(.medium)
        static let displaySubtitle = Font.custom("Markazi Text", size: 40).weight(.regular)
        static let leadText = Font.custom("Karla", size: 18).weight(.medium)
        static let sectionTitle = Font.custom("Karla", size: 20).weight(.black)
        static let sectionCategory = Font.custom("Karla", size: 16).weight(.black)
        static let cardTitle = Font.custom("Karla", size: 18).weight(.bold)
        static let paragraphText = Font.custom("Karla", size: 16).weight(.regular)
        static let highlightText = Font.custom("Karla", size: 16).weight(.medium)
    }
}
