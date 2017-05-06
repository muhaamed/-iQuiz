//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 5/6/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBAction func finishButton(_ sender: UIButton) {
        let warningAlert = UIAlertController(title: "Warning", message: "Are you sure you want to return to home page", preferredStyle: UIAlertControllerStyle.alert)
        
        warningAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action: UIAlertAction!) in
            self.navigationController?.popToRootViewController(animated: false)
        }))
        
        warningAlert.addAction(UIAlertAction(title: "NO", style: .cancel, handler:nil))
        
        present(warningAlert, animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
