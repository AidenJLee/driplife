//
//  ServiceFactory.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 17..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

// 통신상태를 Enum로 표현
enum RequestState  {
    case None
    case Requesting
    case Done
    case Error
}

enum HTTPStatusCode: Int {
    case continueS = 100    // 100 Informational
    case switchingProtocols // 101
    case processing
    case OK = 200           // 200 Success
    case created            // 201
    case accepted           // 202
    case nonAuthoritativeInformation
    
}

enum StoryBoardNames: String {
    case Main
    case Message
    case Proligue
    case Travel
    case Epilogue
    case Profile
}
