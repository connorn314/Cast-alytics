//
//  AllEpisodesData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/9/23.
//

import Foundation

struct DownloadsData: Codable {
    let href: String
    let total: Int
    var pages: JPages
    let count: Int
    var collection: [Collection]
}


struct Collection: Codable, Identifiable {
    let href: String
    let type, title: String
    let season: Season
    let publishedAt: Date
    let number: Int
    let id: String
    let downloads: Downloads
    
    var formattedPublishDate: String {
        publishedAt.formatted(date: .abbreviated, time: .shortened)
    }


    enum CodingKeys: String, CodingKey {
        case href, type, title, season
        case publishedAt = "published_at"
        case number, id, downloads
    }
}


struct Downloads: Codable {
    let total: Int
}


struct Season: Codable {
    let href: String
    let number: Int
}

struct JPages: Codable {
    let total: Int
    var previous, next: Next
    let limit, current: Int
}

struct Next: Codable {
    var href: String
}
