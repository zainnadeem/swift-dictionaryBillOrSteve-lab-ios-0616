//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var personAndFacts: [String:[String]] = [:]
    var answer: String = ""
    var counter: Int = 0
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var correctResponseCounter: UILabel!
   
    @IBOutlet weak var stevePicture: UIButton!
    
    @IBOutlet weak var billPicture: UIButton!
    
    

    
    func createFacts(){
        personAndFacts = ["Steve Jobs":["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                                        "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                                        "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                                        "He was a pescetarian, meaning he ate no meat except for fish."],
                          "Bill Gates":["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                                        "He scored 1590 (out of 1600) on his SATs.",
                                        "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                                        "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                                        "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }

    func getRandomFact() -> (fact: String?, name: String?) {
        let name = randomPerson()
        let facts = personAndFacts[name]
        let factNumber = randomNumberFromZeroTo((facts?.count)!)
        
        return(facts![factNumber], name)
        
}

    func showFact(){
        let answerAndFact = getRandomFact()
        factLabel.text = answerAndFact.fact
        answer = answerAndFact.name!
        
    }
  
    
    
    @IBAction func steveButtonTapped(sender: AnyObject) {
        if answer == "Steve Jobs" {
            counter = counter+1
            correctResponseCounter.text = "\(counter)"
        }else{
            
        }
       showFact()
    }


    @IBAction func billButtonTapped(sender: AnyObject) {
        if answer == "Bill Gates" {
            counter = counter+1
            correctResponseCounter.text = "\(counter)"
        }else{
            
        }
        showFact()
    }
    








}
