//
//  ListenersData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import Foundation

//no access to the api endpoint on the basic

struct DownloadsByInterval: Codable {
    let total: Int?
    let interval: String?
    let byInterval: [DownloadInterval]

    enum CodingKeys: String, CodingKey {
        case total, interval
        case byInterval = "by_interval"
    }
}

struct DownloadInterval: Codable, Identifiable {
    let interval: Date
    let downloadsTotal: Int
    let downloadsPercent: Double
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case interval
        case downloadsTotal = "downloads_total"
        case downloadsPercent = "downloads_percent"
    }
}

struct Listen: Codable, Identifiable  {
    let total: Int
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case total, id
    }
}

struct AllDBMethods: Codable {
    let href: String?
    let collection: [DistributionMethod]?
}

struct DistributionMethod: Codable, Identifiable {
    let id: UUID = UUID()
    let rank: Int
    let name: String
    let downloadsTotal: Int
    let downloadsPercent: Double

    enum CodingKeys: String, CodingKey {
        case rank, name
        case downloadsTotal = "downloads_total"
        case downloadsPercent = "downloads_percent"
    }
}
