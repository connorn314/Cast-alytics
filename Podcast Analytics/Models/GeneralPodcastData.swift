//
//  GeneralPodcastData.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/22/23.
//

import Foundation

struct GeneralPodcastData: Codable {
    let href: String?
    var pages: PodcastPages?
    let count: Int?
    var collection: [PodcastCollection]?
    
    func createCollectionDict() -> [String: PodcastCollection] {
        var collectionDict: [String: PodcastCollection] = [:]
        for podcast in collection ?? [] {
            collectionDict[podcast.id] = podcast
        }
        return collectionDict
    }
    
    enum CodingKeys: String, CodingKey {
        case href, pages
        case count, collection
    }
}

//struct AnalyticsForPodcast: Codable, Identifiable {
//    
//}

struct PodcastCollection: Codable, Identifiable {
    let href: String?
    let title, status: String
    let permission: PodcastPermission?
    let isPendingInvitation: Bool?
    let imageURL: String?
    let id: String
    var downloadsData: DownloadsByInterval? // I added this, going to nest downloads data within the pod collection
    let episodes: Episodes?
    let displayOwnerEmail: Bool?
    let currentUserPermission: PodcastPermission?
    let accountID: String?
//    let account: Account?

    enum CodingKeys: String, CodingKey {
        case href, title, status, permission
        case isPendingInvitation = "is_pending_invitation"
        case imageURL = "image_url"
        case id, episodes
        case displayOwnerEmail = "display_owner_email"
        case currentUserPermission = "current_user_permission"
        case accountID = "account_id"
//        case account
    }
}

//struct Account: Codable {
//    let owner: Owner?
//    let name: String?
//    let isDefault, isCustomPlan: Bool?
//    let id: String?
//    let href: String?
//
//    enum CodingKeys: String, CodingKey {
//        case owner, name
//        case isDefault = "is_default"
//        case isCustomPlan = "is_custom_plan"
//        case id, href
//    }
//}
//
//struct Owner: Codable {
//    let name: String?
//    let imageURL: String?
//    let email: String?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case imageURL = "image_url"
//        case email
//    }
//}

struct PodcastPermission: Codable {
    let rank: Int?
    let name: String?
    let labels: [String]?
    let label: String?
    let canViewEpisodes, canViewAnalytics, canViewAdCreatives, canView: Bool?
    let canUpload, canPublish, canEditPermissions, canEditMarkers: Bool?
    let canEditAdvanced, canEditAdminPermissions, canEditAdCreatives, canEdit: Bool?
    let canDelete, canCreateEpisode: Bool?
    let appKeys: [String]?
    let appKey: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case rank, name, labels, label
        case canViewEpisodes = "can_view_episodes"
        case canViewAnalytics = "can_view_analytics"
        case canViewAdCreatives = "can_view_ad_creatives"
        case canView = "can_view"
        case canUpload = "can_upload"
        case canPublish = "can_publish"
        case canEditPermissions = "can_edit_permissions"
        case canEditMarkers = "can_edit_markers"
        case canEditAdvanced = "can_edit_advanced"
        case canEditAdminPermissions = "can_edit_admin_permissions"
        case canEditAdCreatives = "can_edit_ad_creatives"
        case canEdit = "can_edit"
        case canDelete = "can_delete"
        case canCreateEpisode = "can_create_episode"
        case appKeys = "app_keys"
        case appKey = "app_key"
        case id
    }
}

struct Episodes: Codable {
    let count: Int?
}

struct PodcastPages: Codable {
    let total: Int?
    let previous, next: Next?
    let limit, current: Int?
}

