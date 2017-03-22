//
//  MyCollectionViewCell.swift
//  拖拖拖
//
//  Created by 赫凯 on 2017/3/21.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var title : UILabel?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        // 将 title 注册到单元格
        title = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        title?.textColor = UIColor.blue;
        title?.layer.shadowColor = UIColor.gray.cgColor
        title?.layer.shadowOffset = CGSize.init(width: 4, height: 4)
        title?.layer.shadowOpacity = 0.5
        title?.layer.shadowRadius = 4
        
        self.addSubview(title!);
        title?.backgroundColor = UIColor.init(red: 212, green: 112, blue: 162, alpha: 0.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
