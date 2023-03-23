//
//  ListenersData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import Foundation

//no access to the api endpoint on the basic

//struct PodcastListens: Codable {
//    let total: Int?
//    let interval: String?
//    let byInterval: [Listen]?
//
//    enum CodingKeys: String, CodingKey {
//        case total, interval
//        case byInterval = "by_interval"
//    }
//}

struct Listen: Codable, Identifiable  {
    let total: Int
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case total, id
    }
}
