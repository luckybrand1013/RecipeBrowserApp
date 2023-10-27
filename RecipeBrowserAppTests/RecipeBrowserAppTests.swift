//
//  RecipeBrowserAppTests.swift
//  RecipeBrowserAppTests
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import XCTest
@testable import RecipeBrowserApp

final class RecipeBrowserAppTests: XCTestCase {

    var mealViewModel: MealViewModel!
    
    override func setUp() {
            mealViewModel = MealViewModel()
    }
    
    func testFetchMeal() {
        let expectation = XCTestExpectation(description: "Fetch Dessert meal")
        
        mealViewModel.fetchMealsInCategory(category: "Dessert", completion: {
            // This code block will be called when the asynchronous task is completed
            expectation.fulfill()
            
            // Add assertions here to verify the behavior of your ViewModel
            XCTAssertNotNil(self.mealViewModel.meals.first, "Meal data should not be nil after fetching.")
        })
        
        
        // Wait for the expectation to be fulfilled (or for a specified timeout)
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
    }
    
    func testFetchMealById() {
        let expectation = XCTestExpectation(description: "Fetch meal data")
        
        mealViewModel.fetchMealDetailsById(mealID: "53049", completion: {
            // This code block will be called when the asynchronous task is completed
            expectation.fulfill()
            
            // Add assertions here to verify the behavior of your ViewModel
            XCTAssertNotNil(self.mealViewModel.selectedMeal?.strMeal, "strMeal should not be nil after fetching.")
        })
        
        // Wait for the expectation to be fulfilled (or for a specified timeout)
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
    }

}
