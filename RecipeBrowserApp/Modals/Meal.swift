//
//  Meal.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import Foundation

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
