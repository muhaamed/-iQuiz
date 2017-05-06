//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/4/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    public static var fetchedQuizOnQuestionViewController = [Quiz]()
    var fetchedQuestions = [Questions]()
    @IBAction func submitButton(_ sender: UIButton) {
        AnswerViewController.fetchedQuestionsOnAnswerViewController = fetchedQuestions
        let viewController = storyboard?.instantiateViewController(withIdentifier: "answer")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    @IBOutlet weak var label: UILabel!
    public static var cellName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = QuestionViewController.cellName
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
        label.text = fetchedQuestions[0].text
        //print(fetchedQuestions[0].text)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


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
