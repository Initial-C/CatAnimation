//
//  ListViewController.swift
//  Example
//
//  Created by InitialC on 2018/7/30.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import Cribug

class ListViewController: UITableViewController {

    static let downloadManager = MCManager("ListViewController", isStoreInfo: true)

    lazy var URLStrings: [String] = {
        return ["http://api.gfs100.cn/upload/20171219/201712191530562229.mp4",
                "http://api.gfs100.cn/upload/20180202/201802021621577474.mp4",
                "http://api.gfs100.cn/upload/20180202/201802021048136875.mp4",
                "http://api.gfs100.cn/upload/20180122/201801221619073224.mp4",
                "http://api.gfs100.cn/upload/20180202/201802021048136875.mp4",
                "http://api.gfs100.cn/upload/20180126/201801261120124536.mp4",
                "http://api.gfs100.cn/upload/20180201/201802011423168057.mp4",
                "http://api.gfs100.cn/upload/20180126/201801261545095005.mp4",
                "http://api.gfs100.cn/upload/20171218/201712181643211975.mp4",
                "http://api.gfs100.cn/upload/20171219/201712191351314533.mp4",
                "http://api.gfs100.cn/upload/20180126/201801261644030991.mp4",
                "http://api.gfs100.cn/upload/20180202/201802021322446621.mp4",
                "http://api.gfs100.cn/upload/20180201/201802011038548146.mp4",
                "http://api.gfs100.cn/upload/20180201/201802011545189269.mp4",
                "http://api.gfs100.cn/upload/20180202/201802021436174669.mp4",
                "http://api.gfs100.cn/upload/20180131/201801311435101664.mp4",
                "http://api.gfs100.cn/upload/20180131/201801311059389211.mp4",
                "http://api.gfs100.cn/upload/20171219/201712190944143459.mp4"]
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11, *) {
        } else {
            tableView.contentInset.top = 64
            tableView.scrollIndicatorInsets.top = 64
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return URLStrings.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListViewCell
        cell.URLStringLabel.text = "视频\(indexPath.row + 1).mp4"
        let URLStirng = URLStrings[indexPath.row]
        cell.downloadClosure = { cell in
            ListViewController.downloadManager.isStartDownloadImmediately = true
            ListViewController.downloadManager.download(URLStirng, fileName: cell.URLStringLabel.text)
        }

        return cell
    }


}