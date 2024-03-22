//
//  RecipeDetailsVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import UIKit

class RecipeDetailsVC: UIViewController {
    
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let selectedRecipe = DataHandler.getSelectedRecipe()
    
        recipeNameLabel.text = selectedRecipe.dishName
        
        ingredientsLabel.text = selectedRecipe.ingredients.joined(separator: ", ")
        
        instructionsLabel.text = selectedRecipe.instructions
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
