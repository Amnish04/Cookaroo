//
//  RecipesVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import UIKit

class RecipesVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Outlets
    @IBOutlet weak var recipePicker: UIPickerView!
    
    @IBOutlet weak var categoryPicker: UISegmentedControl!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipePicker.dataSource = self
        recipePicker.delegate = self
        
        // Initial Setup
        refreshRecipeImage()
    }
    
    @IBAction func recipeCategoryChanged(_ sender: UISegmentedControl) {
        recipePicker.reloadAllComponents()
        
        updateSelectedRecipe(selectedRow: 0)
    }
    
    func refreshRecipeImage() {
        recipeImage.image = UIImage(named: DataHandler.getSelectedRecipe().imageName)
    }
    
    func getCategorizedRecipes(selectedCategoryIndex: Int) -> [Recipe] {
        let filteredRecipes: [Recipe]
        
        switch selectedCategoryIndex {
        case 0:
            // Appetizers
            filteredRecipes = DataHandler.recipes.getByCategoryType(recipeType: .Appetizers)
        case 1:
            // Appetizers
            filteredRecipes = DataHandler.recipes.getByCategoryType(recipeType: .MainCourses)
        case 2:
            // Appetizers
            filteredRecipes = DataHandler.recipes.getByCategoryType(recipeType: .Desserts)
        
        default:
            // Do nothing
            filteredRecipes = []
        }
        
        return filteredRecipes
    }
    
    
    //#region Picker Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return getCategorizedRecipes(selectedCategoryIndex: categoryPicker.selectedSegmentIndex).count
    }
    
    // Row Labels
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getCategorizedRecipes(selectedCategoryIndex: categoryPicker.selectedSegmentIndex)[row].dishName
    }
    
    // Row Selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        updateSelectedRecipe(selectedRow: row)
    }
    
    func updateSelectedRecipe(selectedRow: Int) {
        // Handle Events Here
        let currentRecipes = getCategorizedRecipes(selectedCategoryIndex: categoryPicker.selectedSegmentIndex)
        
        let selectedRecipe = currentRecipes[selectedRow]
        
        DataHandler.settSelectedRecipe(recipe: selectedRecipe)
        
        refreshRecipeImage()
    }
    
    //#endregion
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
