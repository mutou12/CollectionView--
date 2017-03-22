//
//  ViewController.swift
//  拖拖拖
//
//  Created by 赫凯 on 2017/3/21.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var collegeview : UICollectionView?
    
    var arr:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize.init(width: self.view.frame.size.width, height: 50)
        
        arr = ["1adsasd asd","2asd saasd as as","3gfhgfdh df df hdf","412312 dfg fb bgsdf "]
        collegeview = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width),collectionViewLayout:layout)
        collegeview?.delegate = self
        collegeview?.dataSource = self
        collegeview?.allowsSelection = true
    
        collegeview?.backgroundColor = UIColor.white
        
        collegeview?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "colCell")
        
        let lonGe = UILongPressGestureRecognizer.init(target: self, action: #selector(handlelongGesture(long:)))
        collegeview?.addGestureRecognizer(lonGe)
        self.view.addSubview(collegeview!)
        
    }
    
    func handlelongGesture(long : UILongPressGestureRecognizer) {
        
        let location = long.location(in: collegeview)
        
        // 当手指的位置不在collectionView的cell范围内时为nil
        let notSureIndexPath = collegeview?.indexPathForItem(at: location)
        
        switch long.state {
        case .began:
            if let index = notSureIndexPath {
            
                collegeview?.beginInteractiveMovementForItem(at: index)
            }
            
            break
        case .changed:
            
            let xiu = CGPoint.init(x: self.view.frame.size.width/2, y: location.y)
            collegeview?.updateInteractiveMovementTargetPosition(xiu)
            break
            
        case .ended:
            
            collegeview?.endInteractiveMovement()
            break
            

        default:
            
            collegeview?.cancelInteractiveMovement()
            break
            
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let ID = "colCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID  , for: indexPath) as! MyCollectionViewCell
       
        cell.title?.text = arr[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let obj = arr[sourceIndexPath.item]
        arr.remove(at: sourceIndexPath.item)
        arr.insert(obj, at: destinationIndexPath.item)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

