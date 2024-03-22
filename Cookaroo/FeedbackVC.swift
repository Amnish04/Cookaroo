//
//  FeedbackVC.swift
//  Cookaroo
//
//  Created by Amnish Singh Arora on 2024-02-16.
//

import UIKit

class FeedbackVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentsTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentsTextField.delegate = self
    }
    
    /* Updated for Swift 4 */
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                textView.resignFirstResponder()
                return false
            }
            return true
        }

    @IBAction func ratingChanged(_ sender: UISlider) {
        ratingLabel.text = String(Int(sender.value * 10))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let feedbackReviewVC = segue.destination as? FeedbackReviewVC else {
            return
        }
        
        feedbackReviewVC.comments = commentsTextField.text ?? ""
        feedbackReviewVC.rating = ratingLabel.text ?? ""
    }
}
