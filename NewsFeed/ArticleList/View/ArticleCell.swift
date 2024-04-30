//
//  ArticleCell.swift
//  ArticleApp

import SwiftUI

struct ArticleCell: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageURL = article.multimedia?.first?.url {
                let url = URL(string: imageURL)
                AsyncImage(url: url)
                    .frame(width: 50, height: 50)
            } else {
                Image(systemName: "photo")
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(article.abstract ?? "")
                    .font(.headline)
                Text(article.source ?? "")
                    .font(.subheadline)
            }
        }
    }
}
