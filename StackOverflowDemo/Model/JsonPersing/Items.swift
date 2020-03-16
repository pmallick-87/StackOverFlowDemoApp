//
//  Items.swift
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import Foundation

struct Items: Codable {

  enum CodingKeys: String, CodingKey {
    case lockedDate = "locked_date"
    case protectedDate = "protected_date"
    case isAnswered = "is_answered"
    case title
    case link
    case lastActivityDate = "last_activity_date"
    case tags
    case communityOwnedDate = "community_owned_date"
    case score
    case viewCount = "view_count"
    case questionId = "question_id"
    case creationDate = "creation_date"
    case acceptedAnswerId = "accepted_answer_id"
    case lastEditDate = "last_edit_date"
    case answerCount = "answer_count"
    case owner
  }

  var lockedDate: Int?
  var protectedDate: Int?
  var isAnswered: Bool?
  var title: String?
  var link: String?
  var lastActivityDate: Int?
  var tags: [String]?
  var communityOwnedDate: Int?
  var score: Int?
  var viewCount: Int?
  var questionId: Int?
  var creationDate: Int?
  var acceptedAnswerId: Int?
  var lastEditDate: Int?
  var answerCount: Int?
  var owner: Owner?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    lockedDate = try container.decodeIfPresent(Int.self, forKey: .lockedDate)
    protectedDate = try container.decodeIfPresent(Int.self, forKey: .protectedDate)
    isAnswered = try container.decodeIfPresent(Bool.self, forKey: .isAnswered)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    link = try container.decodeIfPresent(String.self, forKey: .link)
    lastActivityDate = try container.decodeIfPresent(Int.self, forKey: .lastActivityDate)
    tags = try container.decodeIfPresent([String].self, forKey: .tags)
    communityOwnedDate = try container.decodeIfPresent(Int.self, forKey: .communityOwnedDate)
    score = try container.decodeIfPresent(Int.self, forKey: .score)
    viewCount = try container.decodeIfPresent(Int.self, forKey: .viewCount)
    questionId = try container.decodeIfPresent(Int.self, forKey: .questionId)
    creationDate = try container.decodeIfPresent(Int.self, forKey: .creationDate)
    acceptedAnswerId = try container.decodeIfPresent(Int.self, forKey: .acceptedAnswerId)
    lastEditDate = try container.decodeIfPresent(Int.self, forKey: .lastEditDate)
    answerCount = try container.decodeIfPresent(Int.self, forKey: .answerCount)
    owner = try container.decodeIfPresent(Owner.self, forKey: .owner)
  }

}
