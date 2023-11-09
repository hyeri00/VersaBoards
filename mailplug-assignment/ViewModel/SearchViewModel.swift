//
//  SearchViewModel.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/9/23.
//

import Foundation

class SearchViewModel {
    
    private var searchResults: [SearchResultDTO] = []
    
    func performSearch(searchText: String) {
        searchResults = showSearchKeyword(searchText: searchText)
    }
    
    func numberOfResults() -> Int {
        return searchResults.count
    }
    
    func resultAtIndex(_ index: Int) -> SearchResultDTO? {
        guard index < searchResults.count else {
            return nil
        }
        return searchResults[index]
    }
    
    private func showSearchKeyword(searchText: String) -> [SearchResultDTO] {
        var results: [SearchResultDTO] = []
        
        let titleFields = ["전체", "제목", "내용", "작성자"]
        
        for field in titleFields {
            results.append(SearchResultDTO(title: field, keyword: searchText))
        }
        return results
    }
}
