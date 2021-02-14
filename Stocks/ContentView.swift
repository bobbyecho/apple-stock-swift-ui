//
//  ContentView.swift
//  Stocks
//
//  Created by Bob on 14/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ?
            self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm ) }
        
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2020")
                    .font(.custom("arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    .offset(y: -255)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -200)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { value in
                    
                    self.stockListVM.dragOffset = value.translation
                    
                }, onDragEnd: {
                    value in
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 500)
                    }
                })
                .animation(.spring())
                .offset(y: self.stockListVM.dragOffset.height)
            }
            
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
