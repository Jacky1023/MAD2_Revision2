//
//  AddRecipeViewController.swift
//  MAD2_Revision2
//
//  Created by MAD2_P02 on 5/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit

class AddRecipeViewController : UIViewController{
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    var recipeList:[Recipe] = []
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var recipeController:RecipeController = RecipeController()

    @IBAction func btnAdd(_ sender: Any) {
                
        if(txtTitle.text == "" && txtPreparationTime.text == "" ){
            
            AlertFailedToAddTitleAndTime()
        }
        if (txtIngredient1.text == "" && txtIngredient2.text == "" && txtIngredient3.text == "" && txtIngredient4.text == "" && txtIngredient5.text == ""){
            AlertFailedToAddIngredients()
        }
        else{
            let time = Int16(txtPreparationTime.text!)
            let recipeController:RecipeController = RecipeController()
            recipeController.addRecipe(newRecipe: Recipe(name: txtTitle.text ?? "", preparationtime: time!))
            recipeController.addIngredient(newIngredient: Ingredient(name: txtIngredient1.text ?? ""), newRecipe: Recipe(name: txtTitle.text ?? "", preparationtime: time!))
            AlertSuccess()
            
        }
        

        
    }
    
    func AlertSuccess(){
        let alert = UIAlertController(title: "Successfull", message: "new ingredient and item was added successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func AlertFailedToAddTitleAndTime(){
        let alert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Noted", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func AlertFailedToAddIngredients(){
        let alert = UIAlertController(title: "Empty Field", message: "Please populate at least one ingredient", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
 
//    @IBAction func btnSave(_ sender: Any) {
//        if(txtTitle.text != "" && txtPreparationTime.text != "" && txtIngredient1.text != ""){
//            let time = Int16(txtPreparationTime.text!)
//            let rowValue = appDelegate.rowValue
//            let recipe = recipeList[rowValue!]
//            let recipeController:RecipeController = RecipeController()
//            recipeController.updateRecipe(name: recipe.Name, newRecipe: Recipe(name: txtTitle.text!, preparationtime: time!))
//            
//        }
//    }
//    
}
