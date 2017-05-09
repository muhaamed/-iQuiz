//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/4/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var questionProgress: UILabel!
    
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    
    public static var arrayOfButton : [UIButton] = []
    public static var clickedButton:String? = nil
    @IBAction func answerOptions(_ sender: UIButton) {
        let title = sender.title(for: .normal)
        
        for i in QuestionViewController.arrayOfButton{
            if i.title(for: .normal) == title{
                i.backgroundColor = UIColor.lightGray
                QuestionViewController.clickedButton = i.title(for: .normal)
            }else{
                i.backgroundColor = UIColor.white
            }
        }
        
    }
    
    public static var numberOfQuestion = 0
    public static var currentNumberOfQuestion = 0
    public static var fetchedQuizOnQuestionViewController = [Quiz]()
    var fetchedQuestions = [Questions]()
    @IBAction func submitButton(_ sender: UIButton) {
        if QuestionViewController.clickedButton != nil{
            AnswerViewController.fetchedQuestionsOnAnswerViewController = fetchedQuestions
            QuestionViewController.currentNumberOfQuestion = QuestionViewController.currentNumberOfQuestion - 1
            AnswerViewController.quizQuestion = fetchedQuestions
            let viewController = storyboard?.instantiateViewController(withIdentifier: "answer")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }else{
            let warningAlert = UIAlertController(title: "Warning", message: "Please select an answer", preferredStyle: UIAlertControllerStyle.alert)
            warningAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
            
            present(warningAlert, animated: true, completion: nil)
        }
        
    } // end of submit button
    
    @IBOutlet weak var label: UILabel!
    public static var cellName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        //label.text = QuestionViewController.cellName
        QuestionViewController.arrayOfButton = []
        for subject in QuestionViewController.fetchedQuizOnQuestionViewController{
            if (subject.title == QuestionViewController.cellName){
                let questions: [Dictionary<String, Any>] = subject.questions
                for questionsItems in questions{
                    let text = questionsItems["text"] as! String
                    let answers : [String] = questionsItems["answers"] as! Array
                    let answer = questionsItems["answer"] as! String
                    self.fetchedQuestions.append(Questions(text: text, answer: answer, answers: answers))
                }
            }
        }
        QuestionViewController.arrayOfButton.append(firstButton)
        QuestionViewController.arrayOfButton.append(secondButton)
        QuestionViewController.arrayOfButton.append(thirdButton)
        QuestionViewController.arrayOfButton.append(fourthButton)
        label.text = fetchedQuestions[QuestionViewController.numberOfQuestion - QuestionViewController.currentNumberOfQuestion].text
        label.backgroundColor = UIColor.white
        questionProgress.text = "Question \(QuestionViewController.numberOfQuestion - QuestionViewController.currentNumberOfQuestion + 1) of \(QuestionViewController.numberOfQuestion)"
        //print(fetchedQuestions[QuestionViewController.numberOfQuestion - QuestionViewController.currentNumberOfQuestion].answers)
        for i in 0...fetchedQuestions[QuestionViewController.numberOfQuestion - QuestionViewController.currentNumberOfQuestion].answers.count - 1{
            QuestionViewController.arrayOfButton[i].setTitle(fetchedQuestions[QuestionViewController.numberOfQuestion - QuestionViewController.currentNumberOfQuestion].answers[i], for: .normal)
            //print(QuestionViewController.arrayOfButton[i].title(for: .normal)!)
        }
        
        // set the color and border of buttons 
        for i in QuestionViewController.arrayOfButton{
            i.backgroundColor = UIColor.white
            i.layer.borderWidth = 1
            i.layer.cornerRadius = 10
            i.layer.borderColor = UIColor.gray.cgColor
            i.setTitleColor(UIColor.black, for: .normal)
        }
        
        // submit button rounded
        submitButton.layer.cornerRadius = 30
        
        // swipe gestures for the question scene 
        //let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes(sender: <#T##UISwipeGestureRecognizer#>))
        
        
    }// end of viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // handling the swiping of scene
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left){
            if QuestionViewController.clickedButton != nil{
                AnswerViewController.fetchedQuestionsOnAnswerViewController = fetchedQuestions
                QuestionViewController.currentNumberOfQuestion = QuestionViewController.currentNumberOfQuestion - 1
                AnswerViewController.quizQuestion = fetchedQuestions
                let viewController = storyboard?.instantiateViewController(withIdentifier: "answer")
                self.navigationController?.pushViewController(viewController!, animated: true)
            }else{
                let warningAlert = UIAlertController(title: "Warning", message: "Please select an answer", preferredStyle: UIAlertControllerStyle.alert)
                warningAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
                
                present(warningAlert, animated: true, completion: nil)
            }

        }
        if (sender.direction == .right){
            self.navigationController?.popToRootViewController(animated: false)
        }
    } // end of handleSwipe function

}

class Questions {
    var text : String
    var answer : String
    var answers : [String]
    //var question
    init(text : String, answer : String, answers : [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
}
