//
//  File.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import Foundation

enum ImageType: String {
    case w500 = "w500"
    case original = "original"
}

class URLs {
    private static let base = "https://api.themoviedb.org/3/"
    
    class var popularMovies: String {
        base + "movie/popular"
    }
    
    class func getURL(forImage imagePath: String, type: ImageType = .w500) -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/\(type.rawValue)\(imagePath)")
    }
}
