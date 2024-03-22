//
//  HomeVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var foodImage: UIImageView!
    
    
    let images = ["Pizza.jpg", "GrilledChicken.jpg", "Noodles.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodImage.image = UIImage(named: images[0])
    }
    


    @IBAction func imageChanged(_ sender: UIPageControl) {
        foodImage.image = UIImage(named: images[sender.currentPage])
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
