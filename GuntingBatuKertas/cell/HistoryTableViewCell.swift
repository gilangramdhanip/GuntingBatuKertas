//
//  HistoryTableViewCell.swift
//  GuntingBatuKertas
//
//  Created by Gilang Ramdhani Putra on 26/06/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var score: UILabel!
    
    let cellIdentifier = "historyItems"
    
    static func nib()-> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(){
        
    }
    
}
