//
//  NoDataView.swift
//  NewsFeed

import SwiftUI

struct NoDataView: View {
    var action:() -> Void
    var body: some View {
        VStack(spacing: 20) {
            Text("Something went wrong")
                .bold()
            
            Button(action: action, label: {
                Text("Please try again!")
                    .bold()
                    .foregroundColor(.white)
                    .padding(15)
            })
            .background(Color.black)
            .cornerRadius(10)
        }
    }
}

#Preview {
    NoDataView(action: {})
}
