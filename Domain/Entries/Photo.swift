//
//  Photo.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import ObjectMapper

public struct Photo {
    public let uid: String
    public let albumId: String
    public let url: String
    public let thumbnailUrl: String
    public let title: String
    
    public init(uid: String, albumId: String, url: String, thumbnailUrl: String, title: String) {
        self.uid = uid
        self.albumId = albumId
        self.url = url
        self.thumbnailUrl = thumbnailUrl
        self.title = title
    }
}

extension Photo: ImmutableMappable {        // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        albumId = try map.value("albumId")
        url = try map.value("url")
        thumbnailUrl = try map.value("thumbnailUrl")
        title = try map.value("title")
    }
}

extension Photo: Equatable {
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.albumId == rhs.albumId &&
            lhs.url == rhs.url &&
            lhs.thumbnailUrl == rhs.thumbnailUrl &&
            lhs.title == rhs.title
    }
}
