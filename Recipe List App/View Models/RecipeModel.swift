//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 9.02.2022.
//

import Foundation

class RecipeModel : ObservableObject {
    @Published var recipes = [Recipe]()

    init() {
        
        // create an instance data service and get the data
        // we made static the func then directly get the method
        self.recipes = DataService.getLocalData()
        
        
       /* let dataService = DataService()
        self.recipes = dataService.getLocaData()
        */
    }
 static func getPortion(ingredient:Ingredients,recipeServings:Int, targetServings:Int) -> String {
       var portion = ""
     // ?? nil optional olduğu için kullandık nill se otamatik olarak 1 kişilik seçecek
     var numarator = ingredient.num ?? 1
     var denominator = ingredient.denom ?? 1
     var wholePortions = 0
        
     if ingredient.num != nil {
            // Get a single serivng size by multiplying denominator by the recipe serving
                denominator *= recipeServings
            // Get target portion by multiplying numarator by target servings
                numarator *= targetServings
            // Reduce fraction by greatest common divisor
                let divisor = Rational.greatestCommonDivisor(numarator, denominator)
                numarator /= divisor
                denominator /= divisor
            // Get the whole portion if numarotor > denominator
         if numarator >= denominator {
             // Calculate whole portion
             wholePortions = numarator / denominator
             // Calculate the remainder
             numarator = numarator % denominator
             // Assign the portion
             portion += String(wholePortions)
         }
            // Express the remainder as fraction
         if numarator > 0 {
             // Assign remiander as fraction to the portion string
             portion += wholePortions > 0 ? " " : ""
             portion += "\(numarator)/\(denominator)"
         }
     }
     
     // To be able to change unit we did var insteaf of let for optional
     if var  unit = ingredient.unit {
        
         // Calculate appropiate suffix
         if wholePortions > 1 {
             if unit.suffix(2) == "ch"  {
                 unit += "es"
             } else if unit.suffix(1) == "f" {
                 unit = String(unit.dropLast())
                 unit += "ves"
             } else {
                 unit += "s"
             }
                
         }
         
         portion +=  ingredient.num == nil && ingredient.denom == nil ? "" : " "
         return portion + unit
     }
    
    return portion
    }
    
    
}
