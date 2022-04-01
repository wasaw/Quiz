//
//  QuizTests.swift
//  QuizTests
//
//  Created by Александр Меренков on 3/21/22.
//

import XCTest
@testable import Quiz

class QuizTests: XCTestCase {
    
    var questionController: QuestionViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        questionController = QuestionViewController(category: "Linux", limit: 10)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        questionController = nil
        try super.tearDownWithError()
    }
    
    func testProgress() {

        questionController.limitQuestins = 10
        questionController.numberOfQuestion = 2

        questionController.installationProgress()
        XCTAssertEqual(questionController.progressDescription.persentLabel.text, "20.0%")
    }
    
    func testApi() {
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=6nBiIpBnHuQRJAUyBWEzPNXwfXicTDeTJXQngkai&category=Linux&limit=5")
        let promise = expectation(description: "Status code: 200")
        let sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                XCTFail("Error: \(error!.localizedDescription)")
                return
            }
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
