//
//  ViewController.swift
//  CatAnimation
//
//  Created by InitialC on 2018/10/12.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import AVFoundation


private let animateCellID : String = "animateCellID"
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate lazy var animates = [[String]]()
    fileprivate lazy var durations = [TimeInterval]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableView.backgroundColor = .white
        tableView.register(UINib.init(nibName: "AnimateCell", bundle: nil), forCellReuseIdentifier: animateCellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...6 {
            let files = getFiles("cat\(i)")
            let duration = getDuration(files.count)
            durations.append(duration)
            animates.append(files)
        }
        //
        tableView.reloadData()

    }
    func getBasePath(_ folder : String) -> String {
        return Bundle.main.path(forResource: folder, ofType: "bundle") ?? ""
    }
    func getFiles(_ folderName : String) -> [String] {
        let fm = FileManager.default
        let basePath = getBasePath(folderName)
        let direnum = fm.enumerator(atPath: getBasePath(folderName))
        var files = [String]()
        direnum?.forEach({ (fileName) in
            if let fileName = fileName as? NSString {
                if fileName.pathExtension == "png" {
                    files.append(basePath + "/" + (fileName as String))
                }
            }
        })
        files.sort(by: {$0 < $1})
        return files
    }
    func getDuration(_ fileCount : Int) -> TimeInterval {
        if fileCount < 15 {
            return 0.25
        }
        return 0.1
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animates.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: animateCellID, for: indexPath) as! AnimateCell
        cell.selectionStyle = .none
        if indexPath.row < 6 {
            cell.duration = durations[indexPath.row]
            cell.fileNames = animates[indexPath.row]
        } else {
            cell.fileName = "default_load_gpic.gif"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

