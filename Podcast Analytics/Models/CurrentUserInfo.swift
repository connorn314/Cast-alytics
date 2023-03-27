//
//  CurrentUserData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/27/23.
//

import Foundation

// MARK: - User Information from current_user api endpoint
struct UserInfo: Codable {
    let card: Card?
    let createdAt: String?
    let owner: Owner?
    let networks, authors: Link?
    let id: String?
    let apiKey, subscriptions: Link?

    enum CodingKeys: String, CodingKey {
        case card
        case createdAt = "created_at"
        case owner, networks, authors, id
        case apiKey = "api_key"
        case subscriptions
    }
}

// MARK: - simple struct containing href link
struct Link: Codable {
    let href: String?
}

// MARK: - Card
struct Card: Codable {
    let type, last4, id: String?
    let expYear, expMonth: Int?
    let brand: String?

    enum CodingKeys: String, CodingKey {
        case type, last4, id
        case expYear = "exp_year"
        case expMonth = "exp_month"
        case brand
    }
}

// MARK: - Owner
struct Owner: Codable {
    let name: String?
    let imageURL: String?
    let email: String?

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case email
    }
}
