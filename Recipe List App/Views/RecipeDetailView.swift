//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 11.02.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipeDetails: Recipe
 @State var selectedServingSize = 2
    var body: some View {
       
        ScrollView{
            VStack(alignment: .leading){
                // MARK: Recipe Image
                Image(recipeDetails.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
             // MARK: Size Picker
                
                VStack(alignment: .leading) {
                    Text("Select yor serving size: ")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    } .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                }.padding()
               // .pickerStyle(.segmented)
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top,.leading], 5)
                    ForEach(recipeDetails.ingredients) { item  in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipeDetails.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                    
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
