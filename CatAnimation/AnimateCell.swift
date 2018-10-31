//
//  AnimateCell.swift
//  CatAnimation
//
//  Created by InitialC on 2018/10/15.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import YYImage

class AnimateCell: UITableViewCell {

    @IBOutlet weak var animateImv: YYAnimatedImageView!
    var duration : TimeInterval = 0.1
    var fileNames : [String]? {
        didSet {
            if let names = fileNames {
                let animateImg = YYFrameImage.init(imagePaths: names, oneFrameDuration: duration, loopCount: 0)
                animateImv.image = animateImg
            }
        }
    }
    var fileName : String? {
        didSet {
            if let name = fileName {
                animateImv.image = YYImage.init(named: name)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
