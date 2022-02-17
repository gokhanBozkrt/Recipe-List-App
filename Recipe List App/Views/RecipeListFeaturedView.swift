//
//  RecipeListFeaturedView.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 15.02.2022.
//

import SwiftUI

struct RecipeListFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        
        VStack(alignment:.leading,spacing: 10) {
            Text("Featured Recipe")
                .bold()
                .font(.largeTitle)
                .padding(.top,40)
                .padding(.leading)
        GeometryReader { geo in
            TabView {
                ForEach(0..<model.recipes.count) { index in
                    if model.recipes[index].featured {
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
                            }
                        }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
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
                    .font(.headline)
                Text("1 hour ")
                Text("Highlights")
                    .font(.headline)
                Text("Health,Hearty")
            }
            .padding([.leading,.bottom])
        
        }
       
    }
}

struct RecipeListFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListFeaturedView()
            .environmentObject(RecipeModel())
    }
}
