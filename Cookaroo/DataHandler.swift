//
//  DataHandler.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import Foundation

enum RecipeType {
    case Appetizers
    case MainCourses
    case Desserts
}

class Recipe {
    var id: Int
    var dishName: String
    var recipeType: RecipeType
    var imageName: String
    
    // Cooking Details
    var ingredients: [String]
    var instructions: String
    
    // Timer Props
    var prepTime: Int
    var cookTime: Int
    var restTime: Int
    
    init(id: Int, dishName: String, recipeType: RecipeType, imageName: String, ingredients: [String], instructions: String, prepTime: Int, cookTime: Int, restTime: Int) {
        self.id = id
        self.dishName = dishName
        self.recipeType = recipeType
        self.imageName = imageName
        self.ingredients = ingredients
        self.instructions = instructions
        self.prepTime = prepTime
        self.cookTime = cookTime
        self.restTime = restTime
    }
}

class RecipeManager {
    private var recipes = [
        Recipe(id: 1, dishName: "Butter Chicken", recipeType: .MainCourses, imageName: "ButterChicken.jpg", ingredients: ["Chicken", "Yogurt", "Tomato Puree", "Cream", "Butter", "Onion", "Garlic", "Ginger", "Chili Powder", "Turmeric", "Garam Masala", "Coriander Powder", "Cumin", "Salt", "Fresh Cream"], instructions: "1. Marinate chicken pieces in yogurt, ginger-garlic paste, and spices for at least 1 hour.\n2. Heat butter in a pan, add onions and cook until golden brown.\n3. Add marinated chicken and cook until it changes color.\n4. Pour in tomato puree and cook until the oil separates.\n5. Add cream and simmer until the chicken is cooked through.\n6. Garnish with fresh cream and serve hot with rice or naan.", prepTime: 20, cookTime: 40, restTime: 10),
        
        Recipe(id: 2, dishName: "Pizza", recipeType: .MainCourses, imageName: "Pizza.jpg", ingredients: ["Pizza Dough", "Pizza Sauce", "Mozzarella Cheese", "Toppings of your choice (e.g., Pepperoni, Mushrooms, Bell Peppers, Olives)"], instructions: "1. Preheat oven to 475°F (245°C).\n2. Roll out pizza dough on a lightly floured surface to desired thickness.\n3. Spread pizza sauce evenly over the dough.\n4. Sprinkle shredded mozzarella cheese over the sauce.\n5. Add desired toppings.\n6. Bake in preheated oven for 12-15 minutes, or until the crust is golden brown and the cheese is melted and bubbly.\n7. Slice and serve hot.", prepTime: 30, cookTime: 20, restTime: 0),
        
        Recipe(id: 3, dishName: "Chocolate Cake", recipeType: .Desserts, imageName: "ChocolateCake.jpg", ingredients: ["All-Purpose Flour", "Cocoa Powder", "Baking Powder", "Baking Soda", "Salt", "Butter", "Sugar", "Eggs", "Vanilla Extract", "Milk", "Boiling Water"], instructions: "1. Preheat oven to 350°F (175°C) and grease and flour a cake pan.\n2. In a large bowl, sift together flour, cocoa powder, baking powder, baking soda, and salt.\n3. In another bowl, cream together butter and sugar until light and fluffy.\n4. Beat in eggs one at a time, then stir in vanilla extract.\n5. Gradually mix in dry ingredients alternately with milk.\n6. Stir in boiling water until batter is smooth.\n7. Pour batter into prepared pan and bake for 30-35 minutes, or until a toothpick inserted into the center comes out clean.\n8. Allow cake to cool in the pan for 10 minutes before transferring to a wire rack to cool completely.", prepTime: 20, cookTime: 30, restTime: 10),
        
        Recipe(id: 4, dishName: "Roast Chicken", recipeType: .Appetizers, imageName: "GrilledChicken.jpg", ingredients: ["Whole Chicken", "Olive Oil", "Salt", "Black Pepper", "Garlic", "Lemon", "Fresh Herbs (Rosemary, Thyme, etc.)"], instructions: "1. Preheat oven to 425°F (220°C).\n2. Rinse the chicken inside and out, then pat dry with paper towels.\n3. Rub chicken with olive oil and season generously with salt and pepper, including inside the cavity.\n4. Stuff cavity with garlic cloves, lemon wedges, and fresh herbs.\n5. Tie the legs together with kitchen twine and tuck wing tips under the body.\n6. Place chicken in a roasting pan and roast for about 1 hour, or until juices run clear and internal temperature reaches 165°F (75°C) in the thickest part of the thigh.\n7. Let the chicken rest for 10-15 minutes before carving.", prepTime: 20, cookTime: 60, restTime: 10),
        
        Recipe(id: 5, dishName: "Biryani", recipeType: .MainCourses, imageName: "Biryani.jpg", ingredients: ["Basmati Rice", "Chicken", "Yogurt", "Onions", "Tomatoes", "Ginger-Garlic Paste", "Green Chilies", "Mint Leaves", "Cilantro", "Lemon Juice", "Saffron", "Milk", "Ghee", "Spices (e.g., Cinnamon, Cloves, Cardamom, Bay Leaves)", "Salt"], instructions: "1. Marinate chicken with yogurt, ginger-garlic paste, green chilies, mint leaves, cilantro, and spices for at least 2 hours.\n2. Soak saffron in warm milk.\n3. Parboil rice with whole spices until 70% cooked.\n4. Heat ghee in a large pan, add sliced onions and cook until golden brown.\n5. Add marinated chicken and cook until it changes color.\n6. Layer half-cooked rice over the chicken.\n7. Sprinkle saffron milk, lemon juice, and chopped cilantro on top.\n8. Cover and cook on low heat until the rice is fully cooked and the flavors are infused.\n9. Serve hot with raita and salad.", prepTime: 45, cookTime: 60, restTime: 15)
    ]


    
    
    func getAll() -> [Recipe] {
        return recipes
    }
    
    func getByCategoryType(recipeType: RecipeType) -> [Recipe] {
        return recipes.filter { $0.recipeType == recipeType }
    }
    
    
}

class DataHandler {
    static let recipes = RecipeManager()
    
    // Only One Recipe can be selected at once
    private static var _selectedRecipe: Recipe = recipes.getByCategoryType(recipeType: .Appetizers ).first! // I know its always there
    
    static func getSelectedRecipe() -> Recipe {
        return _selectedRecipe
    }
    
    static func settSelectedRecipe(recipe: Recipe) {
        _selectedRecipe = recipe
    }
    
    private init() {}
}
