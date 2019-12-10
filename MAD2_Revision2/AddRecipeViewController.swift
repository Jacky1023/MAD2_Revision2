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
    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var recipeController:RecipeController = RecipeController()
    
    override func viewDidLoad() {
          super.viewDidLoad()
          recipeList = recipeController.retrieveAllRecipe()
      }
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!


    @IBAction func btnAdd(_ sender: Any) {
       


                
        if(txtTitle.text == "" && txtPreparationTime.text == "" ){

            AlertFailedToAddTitleAndTime()
        }
        if (txtIngredient1.text == "" && txtIngredient2.text == "" && txtIngredient3.text == "" && txtIngredient4.text == "" && txtIngredient5.text == ""){
            AlertFailedToAddIngredients()
        }
        else{
            
            let recipe:Recipe = Recipe(name: txtTitle.text!, preparationtime: Int16(txtPreparationTime.text!)!)
                   
            let i1:Ingredient = Ingredient(name: txtIngredient1.text!)
            let i2:Ingredient = Ingredient(name: txtIngredient2.text!)
            let i3:Ingredient = Ingredient(name: txtIngredient3.text!)
            let i4:Ingredient = Ingredient(name: txtIngredient4.text!)
            let i5:Ingredient = Ingredient(name: txtIngredient5.text!)
            recipeController.addRecipe(newRecipe: recipe)
            recipeController.addIngredient(newIngredient: i1, newRecipe: recipe)
            recipeController.addIngredient(newIngredient: i2, newRecipe: recipe)
            recipeController.addIngredient(newIngredient: i3, newRecipe: recipe)
            recipeController.addIngredient(newIngredient: i4, newRecipe: recipe)
            recipeController.addIngredient(newIngredient: i5, newRecipe: recipe)
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
 
    @IBAction func btnSave(_ sender: Any) {
        if(txtTitle.text != "" && txtPreparationTime.text != "" && txtIngredient1.text != ""){
            let time = Int16(txtPreparationTime.text!)
            let rowValue = appDelegate.rowValue
            let recipe = recipeList[rowValue!]
            let ingredient = ingredientList[rowValue!]
            let recipeController:RecipeController = RecipeController()
            recipeController.updateRecipe(name: recipe.Name, newRecipe: Recipe(name: txtTitle.text ?? "", preparationtime: time!), newIngredient: Ingredient(name: txtIngredient1.text ?? ""))
            

        }
//        if(txtIngredient1.text != "")
//        {
//            let rowValue = appDelegate.rowValue
//
//            let recipeController:RecipeController = RecipeController()
//            recipeController.updateIngredient(Ingredientname: ingredient.Name, newIngredient: )
//        }
    }
    
}
