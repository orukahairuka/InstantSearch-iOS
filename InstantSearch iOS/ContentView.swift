//
//  ContentView.swift
//  InstantSearch iOS
//
//  Created by 櫻井絵理香 on 2025/04/25.
//

import SwiftUI
import InstantSearchSwiftUI
import InstantSearchCore


struct Item: Codable {
    let name: String
}

class SearchController {
    let searcher: HitsSearcher
    let searchBoxInteractor: SearchBoxInteractor
    let searchBoxController: SearchBoxObservableController
    let hitsInteractor: HitsInteractor<Item>
    let hitsController: HitsObservableController<Item>

    init() {
        self.searcher = HitsSearcher(
            appID: "YourAlgoliaAppID",
            apiKey: "YourSearchOnlyAPIKey",
            indexName: "YourFirestoreSyncedIndexName"
        )
        self.searchBoxInteractor = .init()
        self.searchBoxController = .init()
        self.hitsInteractor = .init()
        self.hitsController = .init()
        setupConnections()
    }

    func setupConnections() {
        searchBoxInteractor.connectSearcher(searcher)
        searchBoxInteractor.connectController(searchBoxController)
        hitsInteractor.connectSearcher(searcher)
        hitsInteractor.connectController(hitsController)
    }
}

struct ContentView: View {

    @ObservedObject var searchBoxController: SearchBoxObservableController
    @ObservedObject var hitsController: HitsObservableController<Item>
    @State private var isEditing = false

    var body: some View {
        VStack {
            SearchBar(text: $searchBoxController.query,
                      isEditing: $isEditing,
                      onSubmit: searchBoxController.submit)
            HitsList(hitsController) { (hit, _) in
                Text(hit?.name ?? "")
                    .padding()
            } noResults: {
                Text("No Results")
            }
        }
        .navigationBarTitle("商品検索")
    }
}

