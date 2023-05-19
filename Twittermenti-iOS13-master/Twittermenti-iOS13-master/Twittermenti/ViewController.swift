//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

import SwifteriOS
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

//    let swifter = Swifter(consumerKey: "82Ej1BM1epiVpKCVU9TutaXcE", consumerSecret: "rtUtZl05j1M927kbeluzSBQKiyVju6ycV2NZwgJrPDs0g6qCv4")

    let swifter = Swifter(consumerKey: "JkNqq6TIm71cvxuimhQ2xAu7k", consumerSecret: "gOPRpvfv8qEBgRfEVCkKwbMD2eKLMIGZLNH7ci5VuzQtyr2Qzx", appOnly: true)
    let sentimentClassifier = TweeSentimentClassifer()

    override func viewDidLoad() {
        super.viewDidLoad()






    }

    @IBAction func predictPressed(_ sender: Any) {

        fetchTweets()


    }


    func fetchTweets(){
        if let searchText = textField.text{
            swifter.searchTweet(using: searchText, lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
                // Process the tweet data returned by the API
                for tweet in results.array ?? [] {
                    if let tweetText = tweet["full_text"].string {
                        // Do something with the tweet text, like display it in a UI or analyze its sentiment
                        print(tweetText)
                    }
                }
            }) { (error) in
                // Handle any errors that occurred while making the API request
                print("Error: \(error.localizedDescription)")
            }

//            swifter.searchTweet(using: searchText, lang: "en", count: 100, tweetMode: .extended) { [self] result, searchMetadata in
//                print(result)
//
//                var tweets = [TweeSentimentClassiferInput]()
//
//                for i in 0..<100{
//                    if let tweet = result[i]["full_text"].string{
//                     let tweetForClassification = TweeSentimentClassiferInput(text: tweet)
//                        tweets.append(tweetForClassification)
//                    }
//                }
//                makePrediction(with: tweets)
//            } failure: { error in
//                print("There was an error with the Twitter API Request, \(error)")
//            }
        }

    }

    func makePrediction(with tweets : [TweeSentimentClassiferInput]){
        do{
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            var sentimentScore = 0
            for pred in predictions{
                let sentiment = pred.label

                if sentiment == "Pos"{
                    sentimentScore += 1
                }else if sentiment == "Neg"{
                    sentimentScore -= 1
                }
            }
            print(sentimentScore)
            updateUI(with: sentimentScore)


        }catch{
            print("There was an error with making a predition, \(error)")

        }

    }

    func updateUI(with sentimentScore:Int ){
        if sentimentScore > 20{
            sentimentLabel.text = "😍"
        }else if sentimentScore > 10{
            sentimentLabel.text = "😀"
        }else if sentimentScore > 0{
            sentimentLabel.text = "🙂"
        }else if sentimentScore == 0{
            sentimentLabel.text = "😐"
        }else if sentimentScore > -10{
            sentimentLabel.text = "😀"
        }else if sentimentScore > -20{
            sentimentLabel.text = "😡"
        }else{
            sentimentLabel.text = "🤮"
        }
    }

}





