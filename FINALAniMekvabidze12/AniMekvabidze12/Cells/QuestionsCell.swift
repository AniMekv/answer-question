//
//  QuestionsCell.swift
//  AniMekvabidze12
//
//  Created by Mac User on 5/14/21.
//

import UIKit

class QuestionsCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    
    func provideWith(with question: Question) {
        questionLabel.text = question.question
        answerLabel.text = question.setAnswer
        
    }

}
