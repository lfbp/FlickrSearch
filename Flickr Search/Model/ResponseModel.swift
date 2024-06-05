//
//  ResponseModel.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct Response: Codable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description: String
    let published: String
    let author, authorID, tags: String

    enum CodingKeys: String, CodingKey {
        case title, link, media
        case dateTaken = "date_taken"
        case description, published, author
        case authorID = "author_id"
        case tags
    }
    
    func htmlToString(_ html: String) -> String {
        let data = Data(html.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return "Description: \(attributedString.string)"
        }
        
        return "Description: "
    }
    
    func dateFormat(_ dateString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = dateFormatter.date(from: dateString) {
            return "Date: \(date.description)"
        }
        
        return "Date: "
    }
    
    func getAuthor(_ authorString: String) -> String {
        var clean = authorString.replacingOccurrences(of: "nobody@flickr.com", with: "")
        clean = clean.replacingOccurrences(of: "\"", with: "")
        clean = clean.replacingOccurrences(of: "(", with: "")
        clean = clean.replacingOccurrences(of: ")", with: "")
        return "Author: \(clean)"
    }
}

struct Media: Codable {
    let m: String
}


