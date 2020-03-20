//
//  StatisticViewController.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit
import Alamofire

class StatisticViewController: UIViewController {
    @IBOutlet weak var caseBanner: UIView!
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var numberOfCase: UILabel!
    @IBOutlet weak var searchCountry: UISearchBar!
    var FullData: StatModel?
    var currentData: [Entry] = []
    var allCase = 0

    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: "StatCell", bundle: nil), forCellWithReuseIdentifier: "stat")
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = .zero
        collectionViewLayout.minimumLineSpacing = .zero
        collectionViewLayout.sectionInset = .zero
        mainCollectionView.collectionViewLayout = collectionViewLayout
        searchCountry.delegate = self
        caseBanner.layer.cornerRadius = 10.0
    }
    
    func reloadView() {
        lastUpdated.text = "*Informal data from open api"
        numberOfCase.text = "\(allCase)"
        self.mainCollectionView.reloadData()
    }
    
}

extension StatisticViewController: UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "stat", for: indexPath) as? StatCell
        if let cellDisplay = cell {
            let dataDisplay = currentData[indexPath.item]
            cellDisplay.contryLabel.text = dataDisplay.country
            cellDisplay.deathCaseLabel.text = dataDisplay.deaths
            cellDisplay.totalCaseLabel.text = dataDisplay.cases
            cellDisplay.recoveredCaseLabel.text = dataDisplay.recovered
            return cellDisplay
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.mainCollectionView.frame.width / 2 , height: 232)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentData = FullData?.entries?.filter({ (entry) -> Bool in
            guard let ec = entry.country else { return false }
            let text = searchText.lowercased()
            let ec_lower = ec.lowercased()
            return ec_lower.contains(text)
        }) ?? []
        
        if searchText == "" {
            currentData = FullData?.entries ?? []
        }
        
        self.reloadView()
    }
}

extension StatisticViewController {
    

//    func convertStringToDate(text: String, inputFormat: String = "yyyy-MM-dd'T'HH:mm", outputFormat: String? = "dd MMMM yyyy") -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = inputFormat
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        guard let date = dateFormatter.date(from: String(text.dropLast(5))) else { return "ไม่มีข้อมูล" }
//
//
//        dateFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
//        dateFormatter.locale = Locale(identifier: "th_TH")
//        dateFormatter.dateFormat = outputFormat
//        return dateFormatter.string(from: date)
//    }

    func fetchData() {
        let url = "https://interactive-static.scmp.com/sheet/wuhan/viruscases.json?fbclid=IwAR1WoCzTIylvWbAuOz2Y2GlTbgDhgUT16F6WIJTjwLUc_8hqq5PsZSP0Ros"
    
        
        let loadingScreen = LoadingScreenViewController()
        loadingScreen.modalPresentationStyle = .overCurrentContext
        self.present(loadingScreen, animated: false, completion: nil)
        AF.request(url).responseData { (response) in
            if let data = response.data {
                let jsonData = data
                do {
                    let statResponse = try JSONDecoder().decode(StatModel.self, from: jsonData)
                    statResponse.entries?.forEach({ (item) in
                        self.allCase += Int(item.cases!) ?? 0
                    })
                    self.FullData = statResponse
                    self.currentData = statResponse.entries ?? []
                    self.reloadView()
                    loadingScreen.dismiss(animated: false, completion: nil)
                } catch {
                    print("JSONSerialization error:", error)
                }
            }
        }
    }
    
}

