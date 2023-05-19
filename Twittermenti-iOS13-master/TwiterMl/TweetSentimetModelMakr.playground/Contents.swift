import Cocoa
import CreateML

 let data = try MLDataTable(contentsOf: URL(fileURLWithPath:"/Users/jaydipgoti/Downloads/twitter-sanders-apple3.csv"))

let(tranigData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sentimantClassifier = try MLTextClassifier(trainingData: tranigData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimantClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Daksh", shortDescription: "A model traind to classify sentiment on Tweets", version: "1.0")

try sentimantClassifier.write(to: URL(fileURLWithPath: "/Users/jaydipgoti/Downloads/TweeSentimentClassifer"))
  
try sentimantClassifier.prediction(from: "@Apple is terrible company!")
