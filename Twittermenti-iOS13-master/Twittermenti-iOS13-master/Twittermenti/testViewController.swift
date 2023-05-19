//
//  testViewController.swift
//  Twittermenti
//
//  Created by Jaydip Goti on 05/04/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//import Alamofire
//import SwiftyJSON
//import SwifteriOS
//
//import Foundation
//import OAuthSwift
class testViewController: UIViewController {
    
     let consumerKey = "JkNqq6TIm71cvxuimhQ2xAu7k"
     let consumerSecret = "gOPRpvfv8qEBgRfEVCkKwbMD2eKLMIGZLNH7ci5VuzQtyr2Qzx"
     let accessToken = "1640230874686930946-XfW1BgkwsxxHSjHWnOhL8k0qqiPg7M"
     let accessTokenSecret = "evxH1Mo1qoJWKlOgojmdQLUTlfd7pRpQKlKTzhuSXMVaB"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
//        let oauthSwift = OAuth1Swift(
//                       consumerKey: consumerKey,
//                       consumerSecret: consumerSecret,
//
//                       requestTokenUrl: "https://api.twitter.com/oauth/request_token",
//                           authorizeUrl: "https://api.twitter.com/oauth/authorize",
//                           accessTokenUrl: "https://api.twitter.com/oauth/access_token"
//
//                   )
//
//
//                   oauthSwift.client.credential.oauthToken = accessToken
//                   oauthSwift.client.credential.oauthTokenSecret = accessTokenSecret
//
//        oauthSwift.client.get(
//            "https://api.twitter.com/1.1/search/tweets.json",
//            parameters: ["q": "@Apple", "count": 100]
//
//        ) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any], let tweets = json["statuses"] as? [[String: Any]] {
//                        let tweetTexts = tweets.compactMap { $0["text"] as? String }
//                        print(tweetTexts)
//                    }
//                } catch {
//                    print("catch Error",error.localizedDescription)
//                }
//            case let .failure(error):
//                print("fech error",error.localizedDescription)
//            }
//        }

        
        
        
        func fetchTweets(query: String, completion: @escaping (Result<[String], Error>) -> Void) {
            let headers: HTTPHeaders = [
                "Authorization": "AAAAAAAAAAAAAAAAAAAAADoQmgEAAAAAaM8XYksmNT2mtoCx91MvrmgFAI8%3DYGr4VKAN1k7HG44kZUbyLYhAsYHNaMAAjJJtLondBDsrITS4Um",
                "User-Agent": "MyTwitterApp/1.0.0"
            ]
            
            let parameters: Parameters = [
                "query": query,
                "max_results": 100
            ]
            
            AF.request("https://api.twitter.com/2/tweets/search/recent", parameters: parameters, headers: headers)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        var tweets = [String]()
                        for tweet in json["data"].arrayValue {
                            if let text = tweet["text"].string {
                                tweets.append(text)
                            }
                        }
                        completion(.success(tweets))
                    case .failure(let error):
                        completion(.failure(error))
                    }
            }
        }
        
        fetchTweets(query: "@apple") { result in
            switch result {
            case .success(let tweets):
                print("Fetched \(tweets.count) tweets:")
                for tweet in tweets {
                    print("- \(tweet)")
                }
            case .failure(let error):
                print("Error fetching tweets: \(error)")
            }
        }

        
        
        
        
    }
    
}
