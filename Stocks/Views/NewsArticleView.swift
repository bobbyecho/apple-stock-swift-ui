//
//  NewsArticleView.swift
//  Stocks
//
//  Created by Bob on 14/02/21.
//

import SwiftUI
import Kingfisher

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    
    /*
     drag gesture events
     */
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        VStack(alignment: .leading) {
            HStack() {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    Text("From News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                .gesture(
                    DragGesture()
                        .onChanged(self.onDragBegin)
                        .onEnded(self.onDragEnd)
                )
                
                Spacer()
            }
            .padding()
            .contentShape(Rectangle())
                
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                
                                Text(article.title)
                                    .foregroundColor(Color.gray)
                                    .font(.custom("Arial", size: 18))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                            
                            Spacer()
                            
                            KFImage.url(URL(string: article.imageURL))
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(20)
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 38/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(
            title: "The Bull Market is Charging into 2020",
            imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg",
            publication: "The Wallstreet Journal"
          )
        
        NewsArticleView(
            newsArticles: [NewsArticleViewModel(article: article)],
            onDragBegin: { _ in },
            onDragEnd: { _ in }
        )
    }
}
