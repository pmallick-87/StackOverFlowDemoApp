//
//  Owner.swift
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import Foundation

struct Owner: Codable {

  enum CodingKeys: String, CodingKey {
    case userId = "user_id"
    case link
    case userType = "user_type"
    case acceptRate = "accept_rate"
    case profileImage = "profile_image"
    case displayName = "display_name"
    case reputation
  }

  var userId: Int?
  var link: String?
  var userType: String?
  var acceptRate: Int?
  var profileImage: String?
  var displayName: String?
  var reputation: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    link = try container.decodeIfPresent(String.self, forKey: .link)
    userType = try container.decodeIfPresent(String.self, forKey: .userType)
    acceptRate = try container.decodeIfPresent(Int.self, forKey: .acceptRate)
    profileImage = try container.decodeIfPresent(String.self, forKey: .profileImage)
    displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
    reputation = try container.decodeIfPresent(Int.self, forKey: .reputation)
  }

}
