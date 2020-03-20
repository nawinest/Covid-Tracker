//
//  ViewController.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainContentTableView: UITableView!
    var news: [NewsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mainContentTableView.delegate = self
        mainContentTableView.dataSource = self
        mainContentTableView.register(UINib(nibName: "PreventationCell", bundle: nil), forCellReuseIdentifier: "PreventationCell")
        mainContentTableView.register(UINib(nibName: "PreventationHeaderCell", bundle: nil), forCellReuseIdentifier: "PreventationHeaderCell")
        mainContentTableView.separatorStyle = .none
        mainContentTableView.estimatedRowHeight = 146
        mainContentTableView.sectionHeaderHeight = UITableView.automaticDimension;
        mainContentTableView.estimatedSectionHeaderHeight = 25;
        
        setupMockData()
    }
    
    func setupMockData() {
        let news1 = NewsModel(title: "Two members of House test positive for COVID-19", decriptio: "Two members of the House of Representatives have tested positive for the coronavirus illness COVID-19 and are self-quarantining, the lawmakers said Wednesday.Reps. Mario Diaz-Balart, R-Fla., and Ben McAdams, D-Utah, are the first two members of Congress who have said they tested positive for COVID-19.Diaz-Balart was the first to make the announcement Wednesday. His office said in a statement that after votes on Friday, he self-quarantined in Washington, D.C., and decided not to return home because his wife has a pre-existing condition.", image: "Thairath")
        let news2 = NewsModel(title: "ญี่ปุ่นเล็งใช้ยา HIV รักษาผู้ป่วยโควิด-19", decriptio: "ญี่ปุ่นกำลังวางแผนใช้ยาต้านเชื้อเอชไอวี รักษาผู้ป่วยไวรัสโควิด-19 ขณะที่พบผู้ติดเชื้อดังกล่าวบนเรือสำราญ ไดมอนด์ ปริ๊นเซส เพิ่มอีกถึง 88 รายในวันอังคาร", image: "news2")
        let news3 = NewsModel(title: "ติดเชื้อโควิด-19 พุ่ง 60 ราย ติดทั้งผับ", decriptio: "นายแพทย์สุวรรณชัย อธิบดีกรมควบคุมโรค กระทรวงสาธารณสุข แถลงสถานการณ์ไวรัสโควิด-19 วันนี้เพิ่ม 60 ราย เป็นรายที่ 213-272 จำแนกออกเป็นกลุ่มที่แรกสูงถึง 43 ราย โดยเกี่ยวข้องกับสนามมวย 12 ราย เป็นผู้ชม ญาติ ผู้ดูแลค่ายมวย เจ้าหน้าที่ทำงานในสนามมวย จากสนามมวยลุมพินี ราชดำเนิน และจิตรเมืองนนท์", image: "news1")
        news.append(news1)
        news.append(news2)
        news.append(news3)
        self.mainContentTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainContentTableView.dequeueReusableCell(withIdentifier: "PreventationCell", for: indexPath) as? PreventationCell
        if let uiCell = cell {
            uiCell.titleLabel.text = news[indexPath.row].title
            uiCell.decriptionLabel.text = news[indexPath.row].decriptio
            uiCell.imageBannerTitle.image = UIImage(named: news[indexPath.row].image ?? "Thairath")
            return uiCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = mainContentTableView.dequeueReusableCell(withIdentifier: "PreventationHeaderCell")
        return cell
    }
    
}
