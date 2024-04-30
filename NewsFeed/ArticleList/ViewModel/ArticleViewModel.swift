//
//  ArticleViewModel.swift
//  ArticleApp

import Foundation

class ArticleDataManager: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    
    //MARK: Fetch Data with API
    func fetchArticlesFromAPI(completion: @escaping (_ success: Bool) -> Void) {
        let urlString = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=j5GCulxBywG3lX211ZAPkAB8O381S5SM"
        
        guard let url = URL(string: urlString) else { return }
        isLoading = true
        URLSession.shared.dataTask(with: url) { data, _, error in
            self.isLoading = false
            if let error = error {
                print("Error fetching articles: \(error)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(ArticleSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles = response.response?.docs ?? []
                    completion(true)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(false)
                }
                print("Error decoding articles: \(error)")
            }
        }.resume()
    }
}
