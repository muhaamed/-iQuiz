//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/5/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    public static var quizQuestion = [Questions]()
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var arrayOfAnswerButtons : [UIButton] = []
    
    public static var fetchedQuestionsOnAnswerViewController = [Questions]()
    @IBAction func nextButton(_ sender: UIButton) {
        if QuestionViewController.currentNumberOfQuestion == 0 {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "finish")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }else{
            let viewController = storyboard?.instantiateViewController(withIdentifier: "question")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        arrayOfAnswerButtons = []
        arrayOfAnswerButtons.append(firstButton)
        arrayOfAnswerButtons.append(secondButton)
        arrayOfAnswerButtons.append(thirdButton)
        arrayOfAnswerButtons.append(fourthButton)

        
        let finalAnswerInt = Int (AnswerViewController.quizQuestion[QuestionViewController.numberOfQuestion - (QuestionViewController.currentNumberOfQuestion + 1)].answer)
        var finalAnswerText = ""
        label.text = AnswerViewController.quizQuestion[QuestionViewController.numberOfQuestion - (QuestionViewController.currentNumberOfQuestion + 1)].text
        finalAnswerText = AnswerViewController.quizQuestion[QuestionViewController.numberOfQuestion - (QuestionViewController.currentNumberOfQuestion + 1)].answers[finalAnswerInt! - 1]
        for i in 0...QuestionViewController.arrayOfButton.count - 1{
            //print (QuestionViewController.arrayOfButton.count)
            //print(arrayOfAnswerButtons.count)
            arrayOfAnswerButtons[i].setTitle(QuestionViewController.arrayOfButton[i].title(for: .normal), for: .normal)
            if arrayOfAnswerButtons[i].title(for: .normal) == finalAnswerText{
                arrayOfAnswerButtons[i].backgroundColor = UIColor.green
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
