//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createOurFacts()
    
    }
    
    
    func getRandomFactAlongWithWhoSaidIt() -> (fact: String, whoSaidIt: String)? {
        if let steveFacts = facts["Steve Jobs"],
            let billFacts = facts["Bill Gates"] {
            
            let randomDude = randomPerson()
            
            if randomDude == "Steve Jobs" {
                
                let randomNumber = randomNumberFromZeroTo(steveFacts.count)
                let randomFact = steveFacts[randomNumber]
                return (randomFact, "Steve Jobs")
                
            } else {
                
                let randomNumber = randomNumberFromZeroTo(billFacts.count)
                let randomFact = billFacts[randomNumber]
                return (randomFact, "Bill Gates")
                
            } 
            
        } else {
            return nil
        }
    
    }
    
    func createOurFacts() {
        let steveFact1 = "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font."
        
        let steveFact2 = "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union."
        
        let steveFact3 = "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo."
        
        let steveFact4 = "He was a pescetarian, meaning he ate no meat except for fish."
        
        let steveFacts = [
            steveFact1,
            steveFact2,
            steveFact3,
            steveFact4
        ]
        
        let billFact1 = "He aimed to become a millionaire by the age of 30. However, he became a billionarie at 31."
        let billFact2 = "He scored 1590 (out of 1600) on his SATs."
        let billFact3 = "His foundation spends more on global health each year than the world health organization of the united nations"
        let billFact4 = "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game"
        let billFact5 = "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        
        let billFacts = [
            billFact1,
            billFact2,
            billFact3,
            billFact4,
            billFact5
        ]
        
        facts["Steve Jobs"] = steveFacts
        facts["Bill Gates"] = billFacts
        
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(1)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
        
    }
    
}