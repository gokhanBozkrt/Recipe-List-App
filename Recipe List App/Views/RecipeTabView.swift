//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 13.02.2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("FeaturedView")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
