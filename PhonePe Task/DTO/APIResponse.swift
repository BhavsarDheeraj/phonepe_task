//
//  APIResponse.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import Foundation

// MARK: - APIResponse
struct APIResponse<T: Codable>: Codable {
    let page: Int
    let results: T
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
