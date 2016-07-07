# Dictionaries: Steve & Bill Facts

![Drawing](http://i.imgur.com/wDKdQ8a.jpg?1)

## Learning Objectives - The student should be able to...

* Solve this lab which encompasses the full use of dictionaries and accessing elements within a dictionary.
* This lab won't just solely be about dictionaries (as we will be using Xcode), so the student should be able to tackle all the problems presented within this lab which might include
	* IBActions
	* IBOutlets
	* Tuples
	* Functions with return values
	* Arrays
	* Dictionaries
	* Accessing elements within a dictionary

## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.
* Can create and use Arrays.
* Can iterate over an Array using a for-in loop.
* Can iterate over an Array calling enumerate().
* Work with the following methods on arrays:
	* append()
	* insert(_:atIndex:)
	* removeAtIndex()
	* subscript syntax with arrays
	* count
	* isEmpty
	* Optionals
* Can work with dictionaries 
* Can iterate over a dictionary
* Knows about optionals (should at this point)

## Outline / Notes

* I think the final product should look like this:

![FinalProduct](http://i.imgur.com/K3V6yBg.png?1)

*  In this repo, is an xcode project (workspace file should be opened as it includes pods)
* I think we should remove all the code from the ViewController.swift files except the following:

```swift
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
```

* We should provide them with those two methods and inform them how to interact with them.
* We should instruct them to create a variable above the `viewDidLoad()` method which will be of type [`String` : [`String`]] which is a dictionary where the keys are of type `String` and the values are arrays of type [`String`].
* There should be two keys that represent "Bill Gates" and "Steve Jobs". The values to those keys will be an array containing facts about that individual. We should give them the list of facts within the instructions:

###Steve Facts
* "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font."
* "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union."
* "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo."
* "He was a pescetarian, meaning he ate no meat except for fish."

###Bill Facts
* "He aimed to become a millionaire by the age of 30. However, he became a billionarie at 31."
* "He scored 1590 (out of 1600) on his SATs."
* "His foundation spends more on global health each year than the world health organization of the united nations"
* "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game"
* "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."

* They should first to be asked to create a function that takes no arguments and doesn't return anything. It will in essence create our `facts` variable we declared above the `viewDidLoad()` method. The name of the method should be `createOurFacts()`.

* Using the two random functions supplied to them they should wind up making something like this:

```swift
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
```

* As well, this game should work! They should hook up all the buttons and labels and know when to call on this function. The end product should be that when the screen loads up, a fact is displayed in the middle label with the top label's 0 / 9 <-- the 9 represents the count of total facts and 0 represents how many were guessed correctly until they get to the end.
* In tapping either Steve or Bill, the top label will update to reflect whether or not it was correct by incremeinging up by 1. Then a new fact will display in the center of the screen.
* Things I didn't think of or include yet... should we include that counter at the top? Is that too much for them to do... to grab a fact and then remove it from the dictionary? Maybe not.... but in the method I included above and in the repo in grabbing a fact, I'm not removing the one which was pulled which means it could be asked again.
* Tests should be written for this lab.
* As well, this was an IDEA I was thinking... but this could be taken in a completely different direction.

<a href='https://learn.co/lessons/DictionaryAllLab' data-visibility='hidden'>View this lesson on Learn.co</a>
