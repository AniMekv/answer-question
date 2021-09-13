//
//  ViewController.swift
//  AniMekvabidze12
//
//  Created by Mac User on 5/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var myQuestionsArray = [
        Question(question: "Where would you like to travel?",
                 answers: [
                    Answer(answer: "Europe"), Answer(answer: "Asia"),
                    Answer(answer: "Africa "),
                    Answer(answer: "Should see Georgia first")],
                    setAnswer: ""),
        Question(question: "What is your favorite animal?",
                 answers: [
                    Answer(answer: "Dog"), Answer(answer: "cat"),
                    Answer(answer: "rabbit"),
                    Answer(answer: "Everything if it doesn't bite")],
                    setAnswer: ""),
        Question(question: "What will you do at the Weekend?",
                 answers: [
                    Answer(answer: "Drink"), Answer(answer: "Meet friends"),
                    Answer(answer: "Watch movie"),
                    Answer(answer: "All of them")],
                    setAnswer: ""),
        Question(question: "What day is today?",
                 answers: [
                    Answer(answer: "Monday"), Answer(answer: "Wednesday"),
                    Answer(answer: "Friday"), Answer(answer: "None of them")],
                    setAnswer: ""),
        Question(question: "what is your favourite color?",
                 answers: [
                    Answer(answer: "green"), Answer(answer: "blue"),
                    Answer(answer: "red"),   Answer(answer: "None of them")],
                    setAnswer: "")]
    
    
    var ChosenQuestionIndex: Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func gotoAnswers(questionIndex: Int) {
        
        ChosenQuestionIndex = questionIndex
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AnswersViewController") as! AnswersViewController
        vc.question = myQuestionsArray[questionIndex]
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, AnswerDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myQuestionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell_Identifier") as! QuestionsCell
        cell.provideWith(with: myQuestionsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoAnswers(questionIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
        
    }
        
    func chosennAnswer(answer: String) {
        myQuestionsArray[ChosenQuestionIndex].setAnswer = answer
        
        tableView.reloadRows(at: [IndexPath(row: ChosenQuestionIndex, section: 0)], with: .automatic)
        
    }

}
