//
//  ContentView.swift
//  RecipeBrowserApp
//
//  Created by Abdul RehmanAli on 27/10/2023.
//

import SwiftUI

struct MealListView: View {
    @ObservedObject var viewModel: MealViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.meals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(viewModel: viewModel, mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .onAppear {
                viewModel.fetchMealsInCategory(category: "Dessert")
            }
            .navigationBarTitle("Dessert Recipes")
        }
    }
}

#Preview {
    MealListView()
}
