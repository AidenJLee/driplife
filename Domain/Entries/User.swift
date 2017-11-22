//
//  User.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import ObjectMapper

public struct User {
    public let uid: String
    public let name: String
    public let nickName: String
    public let email: String
    public let phone: String
    
    public init(uid: String,
                name: String,
                nickName: String,
                email: String,
                phone: String) {
        self.uid = uid
        self.name = name
        self.nickName = nickName
        self.email = email
        self.phone = phone
    }
}

extension User: ImmutableMappable {     // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        name = try map.value("name")
        nickName = try map.value("nickName")
        email = try map.value("email")
        phone = try map.value("phone")
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.uid == rhs.uid &&
            lhs.name == rhs.name &&
            lhs.nickName == rhs.nickName &&
            lhs.email == rhs.email &&
            lhs.phone == rhs.phone
    }
}
