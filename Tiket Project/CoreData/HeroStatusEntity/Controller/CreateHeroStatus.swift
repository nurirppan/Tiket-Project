//
//  CreateHeroStatus.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 20/11/20.
//

import Foundation
import CoreData
import RxCocoa

public class CreateHeroStatus {
    
    func createHeroStatus(db: [HeroStatusResponse]) {
        
        DispatchQueue.main.async {
            // refer to Appdelegate
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            
            // create a context
            let managedContext = appDelegate.persistentContainer.viewContext
            
            // entity for new record
            let userEntity = NSEntityDescription.entity(forEntityName: "HeroStatusEntity", in:managedContext)
            
            // add data
            for item in db {
                let user = NSManagedObject(entity:userEntity!, insertInto: managedContext)
                user.setValue(item.id, forKey: "id")
                user.setValue(item.name, forKey: "name")
                user.setValue(item.localizedName, forKey: "localizedName")
                user.setValue(item.primaryAttr, forKey: "primaryAttr")
                user.setValue(item.attackType, forKey: "attackType")
                //                user.setValue(item.roles, forKey: "roles")
                user.setValue(item.img, forKey: "img")
                user.setValue(item.icon, forKey: "icon")
                user.setValue(item.baseHealth, forKey: "baseHealth")
                user.setValue(item.baseHealthRegen, forKey: "baseHealthRegen")
                user.setValue(item.baseMana, forKey: "baseMana")
                user.setValue(item.baseManaRegen, forKey: "baseManaRegen")
                user.setValue(item.baseArmor, forKey: "baseArmor")
                user.setValue(item.baseMr, forKey: "baseMr")
                user.setValue(item.baseAttackMin, forKey: "baseAttackMin")
                user.setValue(item.baseAttackMax, forKey: "baseAttackMax")
                user.setValue(item.baseStr, forKey: "baseStr")
                user.setValue(item.baseAgi, forKey: "baseAgi")
                user.setValue(item.baseInt, forKey: "baseInt")
                user.setValue(item.strGain, forKey: "strGain")
                user.setValue(item.agiGain, forKey: "agiGain")
                user.setValue(item.intGain, forKey: "intGain")
                user.setValue(item.attackRange, forKey: "attackRange")
                user.setValue(item.projectileSpeed, forKey: "projectileSpeed")
                user.setValue(item.attackRate, forKey: "attackRate")
                user.setValue(item.moveSpeed, forKey: "moveSpeed")
                user.setValue(item.turnRate, forKey: "turnRate")
                user.setValue(item.cmEnabled, forKey: "cmEnabled")
            }
            do {
                try managedContext.save()
            } catch let error as NSError{
                print(error)
            }
            
        }
        
    }
    
}
