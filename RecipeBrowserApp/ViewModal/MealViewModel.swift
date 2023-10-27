//
//  MealViewModel.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMeal: MealDetail?
    
    func fetchMealsInCategory(category: String, completion: @escaping () -> Void) {
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        
        NetworkService.shared.request(endpoint, responseType: MealsResponse.self) { result in
            if case .success(let mealsResponse) = result {
                self.meals = mealsResponse.meals
            }
            
            completion()
        }
    }
    
    func fetchMealDetailsById(mealID: String, completion: @escaping () -> Void) {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        
        NetworkService.shared.request(endpoint, responseType: MealDetailResponse.self) { result in
            if case .success(let mealDetailResponse) = result {
                self.selectedMeal = mealDetailResponse.meals.first
            }
            
            completion()
        }
    }
}

