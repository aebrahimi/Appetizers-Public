//
//  Appetizer.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import Foundation

struct Appetizer: Codable, Identifiable, Equatable {
    /*
     "name": "Asian Flank Steak",
     "protein": 14,
     "price": 8.99,
     "id": 1,
     "carbs": 0,
     "calories": 300,
     "description": "This perfectly thin cut just melts in your mouth.",
     "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"
     */
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 100,
                                           protein: 150,
                                           carbs: 5)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                        name: "Test Appetizer 1",
                                        description: "This is the description for my appetizer. It's yummy.",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 100,
                                        protein: 150,
                                        carbs: 5)
    static let orderItemTwo = Appetizer(id: 0002,
                                        name: "Test Appetizer 2",
                                        description: "This is the description for my appetizer. It's yummy.",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 100,
                                        protein: 150,
                                        carbs: 5)
    static let orderItemThree = Appetizer(id: 0003,
                                          name: "Test Appetizer 3",
                                          description: "This is the description for my appetizer. It's yummy.",
                                          price: 9.99,
                                          imageURL: "",
                                          calories: 100,
                                          protein: 150,
                                          carbs: 5)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
