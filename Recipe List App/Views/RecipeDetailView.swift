//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 11.02.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipeDetails: Recipe
    
    var body: some View {
       
        ScrollView{
            VStack(alignment: .leading){
                // MARK: Recipe Image
                Image(recipeDetails.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
              // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    ForEach(recipeDetails.ingredients) { item  in
                        Text("• " + item.name)
                        
                    
                }.padding(.horizontal)
               // MARK: Diveder
                Divider()
                // MARK: Directions
                VStack(alignment:.leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    ForEach(0..<recipeDetails.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipeDetails.directions[index])
                            .padding(.bottom, 5)
                }
            }.padding(.horizontal)
            
        }
        }.navigationBarTitle(recipeDetails.name)
 }
}
}
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipeDetails: model.recipes[0])
    }
}
