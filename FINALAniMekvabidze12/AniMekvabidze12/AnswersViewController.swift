//
//  AnswersViewController.swift
//  AniMekvabidze12
//
//  Created by Mac User on 5/14/21.
//

import UIKit

protocol AnswerDelegate: AnyObject {
    func chosennAnswer(answer: String)
}

class AnswersViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    weak var delegate: AnswerDelegate?
    
    var question = Question(question: "", answers: [], setAnswer: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        questionLabel.text = question.question
    }
    

    
    func gotoQuestions(answerIndex: Int){
        delegate?.chosennAnswer(answer: question.answers[answerIndex].answer)
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension AnswersViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell_Identifier") as! AnswersCell
        cell.provide(with: question.answers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoQuestions(answerIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
        
    }
}
