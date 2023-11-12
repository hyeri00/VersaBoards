//
//  BoardPostDTO.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/12/23.
//

import Foundation

struct BoardPostDTO {
    let postId: Int
    let title: String
    let boardId: Int
    let boardDisplayName: String
    let writer: WriterDTO
    let contents: String
    let createdDateTime: String
    let viewCount: Int
    let postType: String
    let isNewPost: Bool
    let hasInlineImage: Bool
    let commentsCount: Int
    let attachmentsCount: Int
    let isAnonymous: Bool
    let isOwner: Bool
    let hasReply: Bool
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        
        if let date = dateFormatter.date(from: createdDateTime) {
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date Format"
        }
    }
    
    init?(json: [String: Any]) {
        guard
            let postId = json["postId"] as? Int,
            let title = json["title"] as? String,
            let boardId = json["boardId"] as? Int,
            let boardDisplayName = json["boardDisplayName"] as? String,
            let writerDict = json["writer"] as? [String: Any],
            let writer = WriterDTO(json: writerDict),
            let contents = json["contents"] as? String,
            let createdDateTime = json["createdDateTime"] as? String,
            let viewCount = json["viewCount"] as? Int,
            let postType = json["postType"] as? String,
            let isNewPost = json["isNewPost"] as? Bool,
            let hasInlineImage = json["hasInlineImage"] as? Bool,
            let commentsCount = json["commentsCount"] as? Int,
            let attachmentsCount = json["attachmentsCount"] as? Int,
            let isAnonymous = json["isAnonymous"] as? Bool,
            let isOwner = json["isOwner"] as? Bool,
            let hasReply = json["hasReply"] as? Bool
        else {
            return nil
        }
        
        self.postId = postId
        self.title = title
        self.boardId = boardId
        self.boardDisplayName = boardDisplayName
        self.writer = writer
        self.contents = contents
        self.createdDateTime = createdDateTime
        self.viewCount = viewCount
        self.postType = postType
        self.isNewPost = isNewPost
        self.hasInlineImage = hasInlineImage
        self.commentsCount = commentsCount
        self.attachmentsCount = attachmentsCount
        self.isAnonymous = isAnonymous
        self.isOwner = isOwner
        self.hasReply = hasReply
    }
}

struct WriterDTO {
    let displayName: String
    let emailAddress: String
    
    init?(json: [String: Any]) {
        guard
            let displayName = json["displayName"] as? String,
            let emailAddress = json["emailAddress"] as? String
        else {
            return nil
        }
        
        self.displayName = displayName
        self.emailAddress = emailAddress
    }
}
