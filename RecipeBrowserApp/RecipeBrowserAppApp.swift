//
//  RecipeBrowserAppApp.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import SwiftUI

@main
struct RecipeBrowserAppApp: App {
    let viewModel = MealViewModel()
    
    var body: some Scene {
        WindowGroup {
            MealListView(viewModel: viewModel)
        }
    }
}
