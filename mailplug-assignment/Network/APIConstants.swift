//
//  APIConstants.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/12/23.
//

import Foundation

struct APIConstants {
    
    static var baseURL: URL {
        return URL(string: "https://mp-dev.mail-server.kr/api/")!
    }
    
    static let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODgxMDM5NDAsImV4cCI6MCwidXNlcm5hbWUiOiJtYWlsdGVzdEBtcC1kZXYubXlwbHVnLmtyIiwiYXBpX2tleSI6IiMhQG1wLWRldiFAIyIsInNjb3BlIjpbImVhcyJdLCJqdGkiOiI5MmQwIn0.Vzj93Ak3OQxze_Zic-CRbnwik7ZWQnkK6c83No_M780"
    
    static let boards_id = "28478"
}
