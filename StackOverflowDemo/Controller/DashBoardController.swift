//
//  DashBoardController.swift
//  StackOverflowDemo
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import UIKit

class DashBoardController: NSObject {
    
    func rowHeightCalculation() {
        
        
        let items = PersistentDataModel.shared().jsonData?.items
        for i in 0..<items!.count {
            var height = CGFloat(100)
            let increaseHeightForQuestion = self.heightForCellCalculation(text: (items?[i].title)!, width: CGFloat(239))
            let increaseHeightForTags = self.heightForCellCalculation(text: self.addingAllTags(tags: (items?[i].tags)!), width: CGFloat(239))
            let difference = increaseHeightForQuestion + increaseHeightForTags - 60
            if difference > 0
            {
                height = height + difference
            }
            PersistentDataModel.shared().rorHeight.append(height)
        }

        
    }
    
    func addingAllTags(tags : [String]) -> String {
        var tag = ""
        for i in 0..<tags.count
        {
            if tag == ""
            {
                tag = tags[i] + ","
            }
            else
            {
                tag = tag + tags[i]
                if i < tags.count - 1
                {
                    tag = tag + ","
                }
            }
        }
        return tag
    }
    
    func innerCellCalculation(cell : TableViewCell) {
        cell.question.text = PersistentDataModel.shared().jsonData?.items?[cell.tag].title
        cell.tags.text = self.addingAllTags(tags: (PersistentDataModel.shared().jsonData?.items?[cell.tag].tags!)!)

    }
    
    private func heightForView(text:String, cell : TableViewCell, label : UILabel) -> CGFloat{
        
        let previousHeight = label.frame.height
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        label.sizeToFit()
        if label.frame.height - previousHeight > 0
        {
            return label.frame.height
        }
        else
        {
            return 0.0
        }
    }
    
    private func heightForCellCalculation(text:String, font:UIFont? = nil, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        if font != nil
        {
            label.font = font
        }
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func timestampToDate(timeResult : Double)-> String  {
        let date = Date(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }

}
