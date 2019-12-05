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
    
    @IBAction func btnAdd(_ sender: Any) {
        if(txtTitle.text == "" && txtPreparationTime.text == "" ){
            
            let alert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Noted", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else if (txtIngredient1.text == "" || txtIngredient2.text == "" || txtIngredient3.text == "" || txtIngredient4.text == "" || txtIngredient5.text == ""){
            let alert = UIAlertController(title: "Empty Field", message: "Please populate at least one ingredient", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
 
    
}
