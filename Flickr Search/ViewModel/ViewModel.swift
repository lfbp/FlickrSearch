//
//  ViewModel.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var searchText = "" {
        didSet {
            print(searchText)
        }
    }
    
    @Published var items: [Item] = [] {
        didSet {
            imageSource = items.map({ item in
                item.media.m
            })
            print(imageSource.count)
        }
    }
    
    @Published var imageSource: [String] = []
    
    func item(with source: String) -> Item {
        return items.first(where: { item in
            item.media.m == source
        }) ?? .init(title: "", link: "", media: .init(m: ""), dateTaken: "", description: "", published: "", author: "", authorID: "", tags: "")
    }
    
}
