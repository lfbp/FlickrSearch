//
//  Flickr_SearchTests.swift
//  Flickr SearchTests
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import XCTest
@testable import Flickr_Search
final class Flickr_SearchTests: XCTestCase {
    func testGetAuthor() {
        let item = Item(title: "", link: "", media: .init(m: ""), dateTaken: "", description: "", published: "", author: "nobody@flickr.com (\"PEREIRA\")", authorID: "", tags: "")
        let author = item.getAuthor(item.author)
            XCTAssertEqual(author, "Author:  PEREIRA")
        }

}
