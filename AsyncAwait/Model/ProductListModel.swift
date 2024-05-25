//
//  ProductListModel.swift
//  AsyncAwait
//
//  Created by Muneesh Kumar on 25/05/24.
//

import Foundation
// MARK: - EmployeeListModelElement
struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let description: String?
    let images: [String]?
    let creationAt, updatedAt: String?
    let category: Category?
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
//    let title: String?
//    let name: Name?
    let image: String?
    let creationAt, updatedAt: String?
}

enum Name: String, Codable {
    case clothes = "Clothes"
    case electronics = "Electronics"
    case furniture = "Furniture"
    case miscellaneous = "Miscellaneous"
    case shoes = "Shoes"
}

typealias ProductListModel = [Product]

struct InputModel: Codable {
    
}
