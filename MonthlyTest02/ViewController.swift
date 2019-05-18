//
//  ViewController.swift
//  MonthlyTest02
//
//  Created by nh724 on 2019/01/11.
//  Copyright © 2019 西林光. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var lbClock: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Timer.scheduledTimer(
			withTimeInterval: 1.0,
			repeats: true) { (tmr) in
				
				// 日付の取得
				let dt = Date()
				let calendar = Calendar.current
				let year = calendar.component(.year, from: dt)
				let month = calendar.component(.month, from: dt)
				let day = calendar.component(.day, from: dt)
				let hour = calendar.component(.hour, from: dt)
				let minute = calendar.component(.minute, from: dt)
				let second = calendar.component(.second, from: dt)
				
				// ラベルに表示
				self.lbClock.text = "\(year)年\(month)月\(day)日 \n \(hour)時\(minute)分\(second)秒"
								
		}
	}


}

