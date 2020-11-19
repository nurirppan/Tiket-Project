//
//  ReadHeroStatus.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 20/11/20.
//

import Foundation
import RxCocoa
import CoreData

public class ReadHeroStatus {
    
    var models = [HeroStatusCore]()
    
    public func readHeroStatus() {
        
        // refer to Appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        // create a context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // fetch data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HeroStatusEntity")
        
        do{
            
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for i in 0 ..< result.count{
                
//                models.append(
//                    HeroStatusCore(
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String,
//                        result[i].value(forKey: "") as! String))
                
            }
            
            
        } catch let e {
            print(e)
        }
    }
    
}
//        user.setValue(db., forKey: "id")
//        user.setValue(db., forKey: "name")
//        user.setValue(db., forKey: "localizedName")
//        user.setValue(db., forKey: "primaryAttr")
//        user.setValue(db., forKey: "attackType")
//        user.setValue(db., forKey: "roles")
//        user.setValue(db., forKey: "img")
//        user.setValue(db., forKey: "icon")
//        user.setValue(db., forKey: "baseHealth")
//        user.setValue(db., forKey: "baseHealthRegen")
//        user.setValue(db., forKey: "baseMana")
//        user.setValue(db., forKey: "baseManaRegen")
//        user.setValue(db., forKey: "baseArmor")
//        user.setValue(db., forKey: "baseMr")
//        user.setValue(db., forKey: "baseAttackMin")
//        user.setValue(db., forKey: "baseAttackMax")
//        user.setValue(db., forKey: "baseStr")
//        user.setValue(db., forKey: "baseAgi")
//        user.setValue(db., forKey: "baseInt")
//        user.setValue(db., forKey: "strGain")
//        user.setValue(db., forKey: "agiGain")
//        user.setValue(db., forKey: "intGain")
//        user.setValue(db., forKey: "attackRange")
//        user.setValue(db., forKey: "projectileSpeed")
//        user.setValue(db., forKey: "attackRate")
//        user.setValue(db., forKey: "moveSpeed")
//        user.setValue(db., forKey: "turnRate")
//        user.setValue(db., forKey: "cmEnabled")
