//
//  Detail.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import SwiftUI

struct Detail: View {
    let item: Item
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.media.m)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        
                    case .failure(let error):
                        Text("Failed to load image")
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()
                Text("Title: \(item.title)")
                    .font(.title)
                Text(item.htmlToString(item.description))
                    .font(.title2)
                    .foregroundStyle(Color.gray)
                Text(item.getAuthor(item.author))
                    .font(.caption)
                Text(item.dateFormat(item.published))
                    .font(.caption)
            }.padding()
        }
    }

}

#Preview {
    Detail(item: Item(title: "title", link: "link", media: .init(m: ""), dateTaken: "akdmakm", description: "ajsndjkans", published: "ajsndjas", author: "jkasndj", authorID: "ajsnd", tags: "aksjndna"))
}
