//
//  AnswersCell.swift
//  AniMekvabidze12
//
//  Created by Mac User on 5/14/21.
//

import UIKit

class AnswersCell: UITableViewCell {
    

    @IBOutlet weak var answerLabel: UILabel!

    
    func provide(with answer: Answer) {
        answerLabel.text = answer.answer
    }

  
}
