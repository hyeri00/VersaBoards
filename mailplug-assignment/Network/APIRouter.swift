//
//  APIRouter.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/12/23.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // MARK: - Properties
    
    typealias Header = [String: String]

    // MARK: - Cases
    
    case board
    case post
    case search

    // MARK: - HTTP Method
    
    var method: HTTPMethod {
        switch self {
        case .board, .post, .search:
            return .get
        }
    }
   
    // MARK: - Paths
    
    var path: String {
        switch self {
        case .board:
            return "v2/boards"
        case .post:
            return "v2/boards/\(APIConstants.boards_id)/posts?offset=0&limit=30"
        case .search:
            return "v2/boards/\(APIConstants.boards_id)/posts?search=&searchTarget=&offset=&limit="
        }
    }

    // MARK: - Header
    
    var headers: Header {
        return ["Authorization": "Bearer \(APIConstants.token)"]
    }
    
    // MARK: - URL Request
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.headers = HTTPHeaders(headers)
        
        return urlRequest
    }
}
