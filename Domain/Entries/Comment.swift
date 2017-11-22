//
//  Comment.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import ObjectMapper

public struct Comment {
    public let uid: String
    public let postId: String
    public let name: String
    public let email: String
    public let body: String
    
    public init(uid: String, postId: String, name: String, email: String, body: String) {
        self.uid = uid
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
}

extension Comment: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        postId = try map.value("postId")
        name = try map.value("name")
        email = try map.value("email")
        body = try map.value("body")
    }
}

extension Comment: Equatable {
    public static func == (lhs: Comment, rhs: Comment) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.postId == rhs.postId &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email &&
            lhs.body == rhs.body
    }
}
