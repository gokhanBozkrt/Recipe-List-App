//
//  DataService.swift
//  Recipe List App
//
//  Created by Gokhan Bozkurt on 9.02.2022.
//

import Foundation

class DataService {
 
static  func  getLocalData() -> [Recipe] {
      
      // parse local json file
      
      // get url path to the json file
      let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
     
      // Check if pathString is not nil, otherwise....
      guard pathString != nil else {
          return [Recipe]()
      }
      // create a url object
      let url = URL(fileURLWithPath: pathString!)
      
      do {
          // create a data object
          let  data = try  Data(contentsOf: url)
          // decode the data with a JSON decoder
          let decoder = JSONDecoder()
          do {
              let recipeData = try decoder.decode([Recipe].self, from: data)
              // Add unique IDs
              for r in recipeData{
                  r.id = UUID()
                  // Add unique IDs recipe  ıngredients
                  for i in r.ingredients {
                      i.id = UUID()
                  }
              }
           
              return recipeData
              // return the recipes
          }
          catch{
              // error with parsing json
              print(error)
          }
         
      }
      catch {
          // error with getting data
          print(error)
      }
     return [Recipe]()
    }

}


/*
 static func getLocalData() -> [Recipe] {
     
     // Parse local json file
     
     // Get a url path to the json file
     let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
     
     // Check if pathString is not nil, otherwise...
     guard pathString != nil else {
         return [Recipe]()
     }
     
     // Create a url object
     let url = URL(fileURLWithPath: pathString!)
     
     do {
         // Create a data object
         let data = try Data(contentsOf: url)
         
         // Decode the data with a JSON decoder
         let decoder = JSONDecoder()
         
         do {
             
             let recipeData = try decoder.decode([Recipe].self, from: data)
             
             // Add the unique IDs
             for r in recipeData {
                 r.id = UUID()
             }
             
             // Return the recipes
             return recipeData
         }
         catch {
             // error with parsing json
             print(error)
         }
     }
     catch {
         // error with getting data
         print(error)
     }
     
     return [Recipe]()
 }
 
}

 */
