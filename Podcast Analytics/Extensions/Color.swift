//
//  Color.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/21/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let fun = Color("FunColor")
    let secondBackground = Color("SecondBackgroundColor")
}
