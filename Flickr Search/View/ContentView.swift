//
//  ContentView.swift
//  Flickr Search
//
//  Created by LUIS FELIPE B PEREIRA on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(viewModel: viewModel)
                ImageGrid(viewModel: viewModel)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
