//
//  TodoItemTableViewCell.swift
//  UserDefaultsTodoList
//
//  Created by Gustavo Carvalho on 06/04/22.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.cellView.layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}
