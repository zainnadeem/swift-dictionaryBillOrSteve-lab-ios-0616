//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!

    var facts: [String: [String]] = [:]
    var currentFact: (fact: String, subject: String)? = nil
    var correctGuesses = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }

    @IBAction func stevePressed(sender: UIButton) {
        makeGuess("Steve Jobs")
    }

    @IBAction func billPressed(sender: UIButton) {
        makeGuess("Bill Gates")
    }
    
    private func createFacts() {
        facts["Steve Jobs"] = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish.",
        ]
        facts["Bill Gates"] = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.",
        ]
    }

    func showFact() {
        currentFact = getRandomFact()
        if let currentFact = currentFact {
            factLabel.text = currentFact.fact
        } else {
            disableUI()
        }
    }

    private func disableUI() {
        factLabel.text = ""
        steveButton.enabled = false
        billButton.enabled = false
    }

    private func makeGuess(guess: String) {
        if let currentFact = currentFact {
            if currentFact.subject == guess {
                correctGuesses += 1
                counter.text = "\(correctGuesses)"
            }
        }
        showFact()
    }

    func getRandomFact() -> (fact: String, subject: String)? {
        let subject = randomPerson()
        if let facts = facts[subject] {
            let idx = randomNumberFromZeroTo(facts.count)
            if idx < facts.count {
                let fact = facts[idx]
                return (fact: fact, subject: subject)
            } else {
                return nil
            }
        } else {
            return nil
        }
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
}
