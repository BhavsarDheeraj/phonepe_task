//
//  MovieDBService.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import Foundation
import Alamofire

class MovieDBService {
    
    func fetchPopularMovies(completionHandler: @escaping ([Movie]?) -> Void) {
        let url = URLs.popularMovies + "?api_key=38a73d59546aa378980a88b645f487fc"
        
        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            guard let response = try? JSONDecoder().decode(APIResponse<[Movie]>.self, from: data) else {
                completionHandler(nil)
                return
            }
            completionHandler(response.results)
        }
    }
}
