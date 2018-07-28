//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Emma Tucker on 7/22/18.
//  Copyright © 2018 Emma Tucker. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
   
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
   
    func calculatePersonalityResults() {
        var tornado = 0
        var blizzard = 0
        var tsunami = 0
        var wildfire = 0
        var answerTypes: [Disaster] = []
        var answerTypeCount: [Disaster: Int] = [:]
        var topType: Disaster? = nil
        for i in responses {
            answerTypes.append(i.type)
        }
        
        for disaster in answerTypes {
            if disaster == .Tornado {
                tornado += 1
            } else if disaster == .Blizzard {
                blizzard += 1
            } else if disaster == .Tsunami {
                tsunami += 1
            } else if disaster == .Wildfire {
                wildfire += 1
            }
        answerTypeCount[.Blizzard] = blizzard
        answerTypeCount[.Tornado] = tornado
        answerTypeCount[.Tsunami] = tsunami
        answerTypeCount[.Wildfire] = wildfire
        
            for (type, count) in answerTypeCount {
                
                if topType == nil {
                    topType = type
                } else {
                    if count > answerTypeCount[topType!]! {
                        topType = type
                    } else {
                        continue
                    }
                }
            }
        }
        
        if let topType = topType {
            resultAnswerLabel.text = "You are a \(topType.rawValue)"
            resultDefinitionLabel.text = topType.definition
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
        print("Responses is now \(responses)")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        responses.removeAll()
         print("Responses is now \(responses)")
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
