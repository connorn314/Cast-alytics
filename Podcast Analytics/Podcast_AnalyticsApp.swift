//
//  Podcast_AnalyticsApp.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 2/22/23.
//

import SwiftUI

@main
struct Podcast_AnalyticsApp: App {
    
    @StateObject private var edvm: EpisodeDataViewModel = EpisodeDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(edvm)
        }
    }
}
