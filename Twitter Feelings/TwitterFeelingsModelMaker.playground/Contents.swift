import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/kevin/Downloads/twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Kevin Torres Martínez", shortDescription: "A model trained to classify sentiment on Tweets", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/kevin/Downloads/TwitterFeelingsClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "@Apple is a good company!")
