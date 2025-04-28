//
//  InstantSearch_iOSApp.swift
//  InstantSearch iOS
//
//  Created by 櫻井絵理香 on 2025/04/25.
//

import SwiftUI

@main
struct InstantSearchApp: App {
    static let controller = SearchController()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(
                    searchBoxController: InstantSearchApp.controller.searchBoxController,
                    hitsController: InstantSearchApp.controller.hitsController
                )
            }
            .onAppear {
                InstantSearchApp.controller.searcher.search()
            }
        }
    }
}
