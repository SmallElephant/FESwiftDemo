//
//  ViewController.swift
//  4-ExpandTableViewCell
//
//  Created by keso on 2017/1/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

struct ExpandSection {
    var title:String!
    var items:[String]!
    var expanded:Bool
    
    init(title:String,items:[String],expanded:Bool = true) {
        self.title = title
        self.items = items
        self.expanded = expanded
    }
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView?
    var sections:[ExpandSection] = []
    var tableHeaderView:UIView!
    var headerImgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")! as UITableViewCell 
        var content:String = ""
        if sections[indexPath.section].expanded {
            content = sections[indexPath.section].items[indexPath.row]
        }
        tableViewCell.textLabel?.text = content
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: 44.0))
        view.backgroundColor =  UIColor(hex: 0x2E3944)
        
        let textlabel:UILabel = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: view.bounds.width, height: 44.0))
        textlabel.text = sections[section].title
        textlabel.textColor = UIColor.white
        textlabel.font = UIFont.systemFont(ofSize: 15.0)
        view.addSubview(textlabel)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapSectionHeader(sender:)))
        view.tag = section
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].expanded ? 44 : 0
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY:CGFloat = scrollView.contentOffset.y
        
        if offsetY < 0 {
            let originalHeight:CGFloat = tableHeaderView.height
            
            let scale:CGFloat = (originalHeight - offsetY) / originalHeight
            let transformScale3D:CATransform3D = CATransform3DMakeScale(scale, scale, 1.0);
            let translation3D:CATransform3D = CATransform3DMakeTranslation(0, offsetY/2, 0);
            
            headerImgView.layer.transform = CATransform3DConcat(transformScale3D, translation3D)

        } else {
            headerImgView.layer.transform = CATransform3DIdentity
        }
    }
    
    func scrollViewDidScroll1(_ scrollView: UIScrollView) {
        let offsetY:CGFloat = scrollView.contentOffset.y
        
        if offsetY < 0 {
            headerImgView.y = offsetY
            headerImgView.height = -offsetY
        }
    }
    
    
    // MARK: - Actions
    
    func tapSectionHeader(sender:UITapGestureRecognizer) {
        let section:Int = (sender.view?.tag)!
        sections[section].expanded = !sections[section].expanded
        
        for i in 0..<sections[section].items.count {
            tableView?.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
    }
    
    
    // MARK: - SetUp
    
    func setUp() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 64, width:self.view.bounds.width, height: self.view.bounds.height - 64), style: .plain)
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        
        setUpTableHeader()
        
        self.view.addSubview(tableView!)
        
        sections = [
            ExpandSection(title: "简书", items: ["FlyElephant", "keso"]),
            ExpandSection(title: "编程语言", items: ["Swift", "Objective-C", "JavaScript", "Python"]),
            ExpandSection(title: "地区", items: ["北京", "河南", "江西"]),
        ]
    }
    
    func setUpTableHeader() {
        let frame:CGRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        
        tableHeaderView = UIView.init(frame: frame)
        headerImgView = UIImageView.init(image: UIImage.init(named: "Header.jpeg"))
        headerImgView.frame = frame
        headerImgView.contentMode = .scaleAspectFill
        
        tableHeaderView.addSubview(headerImgView)
        tableView?.tableHeaderView = tableHeaderView
    }
    
    func setUpTableHeader1() {
        let frame:CGRect = CGRect(x: 0, y: -200, width: self.view.bounds.width, height: 200)
        headerImgView = UIImageView.init(image: UIImage.init(named: "Header.jpeg"))
        headerImgView.frame = frame
        headerImgView.contentMode = .scaleAspectFill
        tableView?.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
        tableView?.addSubview(headerImgView)
    }
    


}

