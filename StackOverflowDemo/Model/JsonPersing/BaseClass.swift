//
//  BaseClass.swift
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import Foundation

struct BaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case hasMore = "has_more"
    case items
    case quotaRemaining = "quota_remaining"
    case quotaMax = "quota_max"
  }

  var hasMore: Bool?
  var items: [Items]?
  var quotaRemaining: Int?
  var quotaMax: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    hasMore = try container.decodeIfPresent(Bool.self, forKey: .hasMore)
    items = try container.decodeIfPresent([Items].self, forKey: .items)
    quotaRemaining = try container.decodeIfPresent(Int.self, forKey: .quotaRemaining)
    quotaMax = try container.decodeIfPresent(Int.self, forKey: .quotaMax)
  }

}
