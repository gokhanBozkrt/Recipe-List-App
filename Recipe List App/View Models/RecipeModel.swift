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
    
    
}
