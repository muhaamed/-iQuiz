//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/6/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    public static var numberOfMissedQuestions = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topLabel: UILabel!

    @IBAction func finishButton(_ sender: UIButton) {
        FinishViewController.numberOfMissedQuestions = 0
        let warningAlert = UIAlertController(title: "Warning", message: "Are you sure you want to return to home page", preferredStyle: UIAlertControllerStyle.alert)
        
        warningAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action: UIAlertAction!) in
            QuestionViewController.arrayOfButton = []
            QuestionViewController.numberOfQuestion = 0
            QuestionViewController.currentNumberOfQuestion = 0
            QuestionViewController.fetchedQuizOnQuestionViewController = []
            AnswerViewController.quizQuestion = []
            AnswerViewController.fetchedQuestionsOnAnswerViewController = []
            self.navigationController?.popToRootViewController(animated: false)
        }))
        
        warningAlert.addAction(UIAlertAction(title: "NO", style: .cancel, handler:nil))
        
        present(warningAlert, animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "You answered \(QuestionViewController.numberOfQuestion - FinishViewController.numberOfMissedQuestions) of \(QuestionViewController.numberOfQuestion) question correctly"
        
        if FinishViewController.numberOfMissedQuestions == 0 {
            topLabel.text = "Perfect!!!"
        }
        if QuestionViewController.numberOfQuestion == FinishViewController.numberOfMissedQuestions {
            topLabel.text = "Stupid, Quit School bro"
        }
        if FinishViewController.numberOfMissedQuestions == 1 && QuestionViewController.numberOfQuestion != 1  {
            topLabel.text = "AHH Almost"
        }
        if QuestionViewController.numberOfQuestion > 1 && FinishViewController.numberOfMissedQuestions > 1 && QuestionViewController.numberOfQuestion != FinishViewController.numberOfMissedQuestions{
            topLabel.text = "Try Harder"
        }
        
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        
        // swipe gesture
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right){
            
            FinishViewController.numberOfMissedQuestions = 0
            let warningAlert = UIAlertController(title: "Warning", message: "Are you sure you want to return to home page", preferredStyle: UIAlertControllerStyle.alert)
            
            warningAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action: UIAlertAction!) in
                QuestionViewController.clickedButton = nil
                QuestionViewController.arrayOfButton = []
                QuestionViewController.numberOfQuestion = 0
                QuestionViewController.currentNumberOfQuestion = 0
                QuestionViewController.fetchedQuizOnQuestionViewController = []
                AnswerViewController.quizQuestion = []
                AnswerViewController.fetchedQuestionsOnAnswerViewController = []
                self.navigationController?.popToRootViewController(animated: false)
            }))
            
            warningAlert.addAction(UIAlertAction(title: "NO", style: .cancel, handler:nil))
            
            present(warningAlert, animated: true, completion: nil)
            //self.navigationController?.popToRootViewController(animated: false)
        }
    } // end of handleSwipe function
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
