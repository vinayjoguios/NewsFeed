//
//  ArticleList.swift
//  ArticleApp

import SwiftUI

struct ArticleListView: View {
    @StateObject private var articleManager = ArticleDataManager()
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ArticleModel.id, ascending: true)],
        animation: .default)
    private var storedArticles: FetchedResults<ArticleModel>
    
    @State var enableNoData:Bool = false
    var body: some View {
        ZStack {
            NavigationView {
                List(articleManager.articles, id:\.self) { article in
                    ArticleCell(article: article)
                }
                .navigationBarTitle("Election News")
                .toolbar(content: {
                    Button(action: {
                        self.fetchArticles()
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .resizable()
                            .imageScale(.medium)
                            .frame(width: 35, height: 35)
                    })
                    .tint(.black)
                })
            }
            .onAppear {
                fetchArticles()
            }
            
            if articleManager.isLoading {
                ActivityIndicator()
            }
            
            if enableNoData {
                NoDataView(action: {
                    fetchArticles()
                })
            }
        }
    }
    
    //MARK: Fetch Data with API
    private func fetchArticles() {
        articleManager.fetchArticlesFromAPI { success in
            success ? self.saveArticles(articles: articleManager.articles) : retriveArticles()
        }
    }
    
    //MARK: Retrive Data from Offline
    private func retriveArticles() {
        if storedArticles.count > 0 {
            DispatchQueue.main.async {
                articleManager.articles = storedArticles.map({ article in
                    Article(abstract: article.abstract, source: article.source, multimedia: [Multimedia(url: article.multimediaUrl)])
                })
            }
            self.enableNoData = false
            debugPrint("Data retrieved from offline storage(CoreData)")
        } else {
            self.enableNoData = true
        }
    }
    
    //MARK: Save Data in Offline Store - Core Data
    private func saveArticles(articles: [Article]) {
        self.enableNoData = false
        for article in articles {
            let newItem = ArticleModel(context: viewContext)
            newItem.id = UUID()
            newItem.abstract = article.abstract
            newItem.source = article.source
            newItem.multimediaUrl = article.multimedia?.first?.url
            
            do {
                try viewContext.save()
                debugPrint("Data saved successfully!")
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
