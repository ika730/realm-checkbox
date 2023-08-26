//
//  ViewController.swift
//  realm
//
//  Created by Nakagawa Kosuke on 2023/08/19.
//

import UIKit
import RealmSwift

class PowerSupply: Object {
    @objc dynamic var floor = 0
    @objc dynamic var onOff = false
    


    override static func primaryKey() -> String? {
        return "floor"
    }
    
}


class ViewController: UIViewController {
    let realm = try! Realm()
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any) {
        //押されたボタンのidの番号を取得
        let b:UIButton = sender as! UIButton
        let id = b.tag
        
        //押された階の情報を保存するためのコード
        let powerSupply = PowerSupply()
        
        //realmで取得するコード、スイッチがonならoffにoffならonにする
        let currentFloor1 = realm.objects(PowerSupply.self).filter("floor == \(id)")
        if  currentFloor1[0].onOff{
            powerSupply.onOff = !currentFloor1[0].onOff
        }else{
            powerSupply.onOff = true
        }
        powerSupply.floor = id
        
        //取得し更新した情報を保存するコード
        try! realm.write{
            realm.add(powerSupply,update: .modified)
        }
        
        let results = realm.objects(PowerSupply.self)
        print(results)
        setLabel()
        
        
        
    }
    func setLabel(){
      let results = realm.objects(PowerSupply.self)
       let firstFloor = realm.objects(PowerSupply.self).filter("floor == \(1)")
        if firstFloor[0].onOff {
            firstLabel.text = "on"
        }else{
            firstLabel.text = "off"
        }
        let secondFloor = realm.objects(PowerSupply.self).filter("floor == \(2)")
        if secondFloor[0].onOff {
            secondLabel.text = "on"
        }else{
            secondLabel.text = "off"
        }
        let thirdFloor = realm.objects(PowerSupply.self).filter("floor == \(3)")
        if thirdFloor[0].onOff {
            thirdLabel.text = "on"
        }else{
            thirdLabel.text = "off"
        }
        let forthFloor = realm.objects(PowerSupply.self).filter("floor == \(4)")
        if forthFloor[0].onOff {
            forthLabel.text = "on"
        }else{
            forthLabel.text = "off"
        }
        let fifthFloor = realm.objects(PowerSupply.self).filter("floor == \(5)")
        if fifthFloor[0].onOff {
            fifthLabel.text = "on"
        }else{
            fifthLabel.text = "off"
        }
    }

}

