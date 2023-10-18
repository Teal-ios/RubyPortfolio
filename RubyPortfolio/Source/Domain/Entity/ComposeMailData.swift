//
//  ComposeMailData.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/18.
//

import Foundation

struct ComposeMailData {
  let subject: String
  let recipients: [String]?
  let message: String
  let attachments: [AttachmentData]?
}

struct AttachmentData {
  let data: Data
  let mimeType: String
  let fileName: String
}
