//
//  ImageGrid.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import SwiftUI

struct ImageGrid: View {
    @ObservedObject var viewModel: ViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.imageSource, id: \.self) { source in
                    AsyncImage(url: URL(string: source)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            NavigationLink(destination: Detail(item: viewModel.item(with: source))) {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            }
                        case .failure(let error):
                            Text("Failed to load image")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding()
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ImageGrid(viewModel: ViewModel())
}
