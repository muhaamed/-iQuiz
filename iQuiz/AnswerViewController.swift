//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/5/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    public static var fetchedQuestionsOnAnswerViewController = [Questions]()
    @IBAction func nextButton(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "question")
        self.navigationController?.pushViewController(viewController!, animated: true)
//        if AnswerViewController.fetchedQuestionsOnAnswerViewController.count == 1{
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "finish")
//            self.navigationController?.pushViewController(viewController!, animated: true)
//        }
//        else{
//            let viewController = storyboard?.instantiateViewController(withIdentifier: "question")
//            self.navigationController?.pushViewController(viewController!, animated: true)
//        }
        
        //self.navigationController?.popToRootViewController(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
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
