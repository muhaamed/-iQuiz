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
    @IBAction func submitButton(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "answer")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    @IBOutlet weak var label: UILabel!
    public static var cellName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = QuestionViewController.cellName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
