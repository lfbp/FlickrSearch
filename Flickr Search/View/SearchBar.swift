//
//  SearchBar.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import SwiftUI

struct SearchBar: View {
    @State public var text: String = ""
    @ObservedObject var viewModel: ViewModel
    let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    var body: some View {
        TextField("Search here..", text: $text)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding()
            .onChange(of: text){
                Task {
                    await fetch(with:text)
                }
            }
        
    }
    
    func fetch(with text: String) async {
        
        if text.isEmpty {
            viewModel.items = []
        } else {
            guard let url = URL(string:baseURL+text) else { return }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(Response.self, from: data)
                viewModel.searchText = text
                viewModel.items = decoded.items
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    SearchBar( viewModel: ViewModel())
}
