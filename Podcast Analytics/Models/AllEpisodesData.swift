//
//  AllEpisodesData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/9/23.
//

import Foundation

struct EpisodesData: Codable {
    let href: String
    let total: Int
    let pages: JPages
    let count: Int
    let collection: [Collection]
}


struct Collection: Codable {
    let href: String
    let type, title: String
    let season: Season
    let publishedAt: String
    let number: Int
    let id: String
    let downloads: Downloads

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
    let previous, next: Next
    let limit, current: Int
}

struct Next: Codable {
    let href: String
}
