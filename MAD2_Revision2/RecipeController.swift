//
//  RecipeController.swift
//  MAD2_Revision2
//
//  Created by MAD2_P02 on 6/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RecipeController{
    
    //Add a new recipe to Core Data
    func addRecipe(newRecipe:Recipe){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
               
        let Recipeentity = NSEntityDescription.entity(forEntityName:"CDRecipe", in: context)!
               
        let recipe = NSManagedObject(entity: Recipeentity, insertInto: context)
        recipe.setValue(newRecipe.Name,forKeyPath: "name")
        recipe.setValue(newRecipe.PreparationTime,forKeyPath: "preparationTime")
        
        appDelegate.saveContext()
    }
    
    //Retrieve all recipes from core data
    func retrieveAllRecipe()->[Recipe]
    {
       let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
       let context = appDelegate.persistentContainer.viewContext
       var recipeList:[Recipe]=[]

       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
       do{
            let recipe = try context.fetch(fetchRequest) as! [CDRecipe]

            for r in recipe{
                recipeList.append( Recipe(name: r.name!, preparationtime: r.preparationTime))
            }
        }  catch{
                   (print(error))
               }
        return recipeList
    }
    
    //Add new ingredient to core data
    func addIngredient(newIngredient:Ingredient, newRecipe:Recipe){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let Ingrediententity = NSEntityDescription.entity(forEntityName:"CDIngredient", in: context)!
        
        
        let ingredient = NSManagedObject(entity: Ingrediententity, insertInto: context) as! CDIngredient
        ingredient.setValue(newIngredient.Name,forKeyPath: "name")
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format:"name = %@",newRecipe.Name)
        do{
            let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            ingredient.addToRecipes(cdRecipe[0])
            appDelegate.saveContext()
            
        }
        catch{
            (print(error))
        }

    }
    
    //Retrieve all ingredients from core data
    func retrieveAllIngredient(newRecipe:Recipe)->[Ingredient]
       {
  
          let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
          let context = appDelegate.persistentContainer.viewContext
          var ingredientList:[Ingredient]=[]

          let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchRequest.predicate = NSPredicate(format: "recipes = %@", newRecipe.Name)
          do{
               let ingredient = try context.fetch(fetchRequest) as! [CDIngredient]

               for i in ingredient{
                ingredientList.append( Ingredient(name: i.name!))
               }
           } catch let error as NSError {
           print("Could not save. \(error), \(error.userInfo)")
           }
           return ingredientList
       }
    
    
}
