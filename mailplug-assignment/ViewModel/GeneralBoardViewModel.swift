//
//  GeneralBoardViewModel.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/12/23.
//

import Foundation
import Alamofire

class GeneralBoardViewModel {
    var boards: [BoardPostDTO] = []
    
    func fetchPosts(completion: @escaping (Error?) -> Void) {
        let apiUrl = "https://mp-dev.mail-server.kr/api/v2/boards/\(APIConstants.boards_id)/posts?offset=0&limit=30"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(APIConstants.token)"
        ]
        
        AF.request(apiUrl,
                   method: .get,
                   headers: headers)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let post = json["value"] as? [[String: Any]] {
                    let posts = post.compactMap { BoardPostDTO(json: $0) }
                    
                    self.boards = posts
                    
                    completion(nil)
                } else {
                    completion(NSError(domain: "Invalid JSON format",
                                       code: -1,
                                       userInfo: nil))
                }
                
            case .failure(let error):
                completion(error)
            }
        }
    }
}
