//
//  MealDetailView.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import SwiftUI


struct MealDetailView: View {
    @ObservedObject var viewModel: MealViewModel
    var mealID: String

    var body: some View {
        ScrollView {
            VStack {
                if let meal = viewModel.selectedMeal {
                    Text(meal.strMeal)
                        .font(.title)
                    Text("Instructions:")
                        .font(.headline)
                    Text(meal.strInstructions)
                        .padding(.horizontal,10)
                    
                    Text("Ingredients:")
                        .font(.headline)
                    
                    ForEach(meal.ingredients ?? [], id:\.self){ ing in
                        VStack{
                            HStack{
                                Text(ing.measure)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                                Text(ing.name)
                                    .foregroundColor(.black)
                                    .font(.caption)
                                Spacer()
                            }
                            .font(.title3)
                            .padding(.horizontal, 10)
                        }
                    }
                } else {
                    Text("Loading...")
                }
            }
            .onAppear {
                viewModel.fetchMealDetailsById(mealID: mealID, completion: {
                    // We have data now
                })
            }
        }
        .padding(.bottom, 20)
    }
}
                                      
#Preview {
    MealDetailView(viewModel: MealViewModel(), mealID: "53049")
}
