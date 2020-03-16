//
//  ViewController.swift
//  StackOverflowDemo
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import UIKit
import Alamofire

class DashBoardVC: MasterVC, UITableViewDelegate, UITableViewDataSource, JsonControllerDelegate{

    @IBOutlet weak var displayTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height, width: view.frame.size.width, height:44))
        let navigationItem = UINavigationItem()
        navigationItem.title = "Stack Overflow Questions"
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        // Do any additional setup after loading the view.
        displayTable.delegate = self
        displayTable.dataSource = self
        let objJsonController = JsonController()
        objJsonController.delegate = self
        objJsonController.callAPI()
        
    }
    
    func callBackAfterDownload()
    {
        displayTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (PersistentDataModel.shared().jsonData?.items!.count) == nil {
            return 0
        }
        return (PersistentDataModel.shared().jsonData?.items!.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        cell.tag = indexPath.row
        if let answerCountValue = PersistentDataModel.shared().jsonData?.items![indexPath.row].answerCount {
            cell.answerCount.text = String(answerCountValue)
        }
        else {
            cell.answerCount.text = ""
        }
        cell.question.text = PersistentDataModel.shared().jsonData?.items![indexPath.row].title
        cell.tags.text = " " + DashBoardController.init().addingAllTags(tags: (PersistentDataModel.shared().jsonData?.items![indexPath.row].tags!)!)
        cell.time.text = DashBoardController.init().timestampToDate(timeResult: Double((PersistentDataModel.shared().jsonData?.items![indexPath.row].creationDate!)!))
        cell.btnOwner.setTitle((PersistentDataModel.shared().jsonData?.items![indexPath.row].owner?.displayName!), for: .normal)
        cell.btnOwner.tag = indexPath.row
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 100
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.index = indexPath.row
        vc.showType = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func ownerBtnPress(_ sender: Any) {
        let ownerBtn = (sender as! UIButton)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.index = ownerBtn.tag
        vc.showType = "owner"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

