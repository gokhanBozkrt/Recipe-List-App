//
//  RecipeListFeaturedView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 15.02.2022.
//

import SwiftUI

struct RecipeListFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    var body: some View {
        
        VStack(alignment:.leading,spacing: 10) {
            Text("Featured Recipe")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 26))
                .padding(.top,40)
                .padding(.leading)
        GeometryReader { geo in
            TabView(selection: $tabSelectionIndex) {
                ForEach(0..<model.recipes.count) { index in
                    if model.recipes[index].featured {
                       // card view buttun
                        Button {
                            // show the recipe detail sheet
                            self.isDetailViewShowing = true
                        } label: {
                            ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            VStack(spacing:0) {
                                Image(model.recipes[index].image)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                Text(model.recipes[index].name)
                                    .padding(5)
                                    .font(Font.custom("Avenir", size: 15))
                            }
                        }
                        }.sheet(isPresented : $isDetailViewShowing ) {
                            // Show Recipe Detail View
                            RecipeDetailView(recipeDetails : model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color:Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6) ,radius: 10, x: -5, y: 5 )
                        
                        }
        
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
            VStack(alignment:.leading,spacing: 10) {
                Text("Prepariton Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                  Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
           
            }
            .padding([.leading,.bottom])
        
        }
        .onAppear {
            setFeaturedIndex()
        }
       
    }
    
    func setFeaturedIndex() {
      var index = model.recipes.firstIndex { (recipe) in
          return  recipe.featured
        }
        // nil coalesion for optionals
        tabSelectionIndex =  index ?? 0
    }
    
}

struct RecipeListFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListFeaturedView()
            .environmentObject(RecipeModel())
    }
}
