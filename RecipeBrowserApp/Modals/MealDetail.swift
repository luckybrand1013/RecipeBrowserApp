//
//  MealDetail.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import Foundation

struct MealDetail: Decodable {
    let id = UUID()
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    let ingredients: [Ingredient]?
}

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
}

extension MealDetail {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }//: while
        self.ingredients = ingredients
        
        strMeal = mealDict["strMeal"] as? String ?? ""
        strInstructions = mealDict["strInstructions"] as? String ?? ""
        strMealThumb = mealDict["strMealThumb"] as? String ?? ""
        strYoutube = mealDict["strYoutube"] as? String ?? ""
    }
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}

