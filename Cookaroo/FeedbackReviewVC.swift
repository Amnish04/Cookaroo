//
//  FeedbackReviewVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-17.
//

import UIKit

class FeedbackReviewVC: UIViewController {
    
    // State
    var rating = ""
    var comments = ""
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ratingLabel.text = rating
        commentsLabel.text = comments
    }

}
