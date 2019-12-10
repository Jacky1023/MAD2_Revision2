//
//  RecipeTableViewController.swift
//  MAD2_Revision2
//
//  Created by MAD2_P02 on 5/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeTableViewController : UITableViewController{

    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool){
        let recipeController = RecipeController()
        recipeList = recipeController.retrieveAllRecipe()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return recipeList.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let recipe = recipeList[indexPath.row]
        cell.textLabel!.text = "\(recipe.Name) \(recipe.PreparationTime)"
        
        let recipeController:RecipeController = RecipeController()
        ingredientList  = recipeController.retrieveAllIngredient(newRecipe: recipeList[indexPath.row])
        var s = ""
        for ing in ingredientList{
            s+="\(ing.Name), "
        }
        cell.detailTextLabel!.text = s

        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appDelegate.rowValue = indexPath.row


        }

}
