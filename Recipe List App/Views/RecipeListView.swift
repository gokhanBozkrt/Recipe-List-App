//
//  ContentView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 9.02.2022.
//

import SwiftUI

struct  RecipeListView: View {
    // Referance the view model
  //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading)
            {
                Text("All Recipes")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 26))
                    .padding(.top,40)
                //    .padding(.leading)
                ScrollView {
                    LazyVStack(alignment:.leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink {
                                RecipeDetailView(recipeDetails: r)
                            } label: {
                                // MARK: Rows
                                HStack(spacing:20) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment:.leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlightsView(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            }

                        }
                    }
                } // .navigationBarTitle("All Recipes")
                
            }.navigationBarHidden(true)
                .padding(.leading)
        }
    }
}

struct  RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
