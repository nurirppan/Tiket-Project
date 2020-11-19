//
//  HeroStatusEntity.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 20/11/20.
//

import Foundation
import RxCocoa

class HeroStatusCore {
    var id: Int
    var name, localizedName: String
    var primaryAttr: String
    var attackType: String
    var roles: [String]
    var img, icon: String
    var baseHealth: Int
    var baseHealthRegen: Double?
    var baseMana: Int
    var baseManaRegen, baseArmor: Double
    var baseMr, baseAttackMin, baseAttackMax, baseStr: Int
    var baseAgi, baseInt: Int
    var strGain, agiGain, intGain: Double
    var attackRange, projectileSpeed: Int
    var attackRate: Double
    var moveSpeed: Int
    var turnRate: Double
    var cmEnabled: Bool
    
    init(_ id: Int, _  name: String, _  localizedName: String, _  primaryAttr: String, _  attackType: String, _  roles: [String], _  img: String, _  icon: String, _  baseHealth: Int, _  baseHealthRegen: Double, _  baseMana: Int, _  baseManaRegen: Double, _  baseArmor: Double, _  baseMr: Int, _  baseAttackMin: Int, _  baseAttackMax: Int, _  baseStr: Int, _  baseAgi: Int, _  baseInt: Int, _  strGain: Double, _  agiGain: Double, _  intGain: Double, _  attackRange: Int, _  projectileSpeed: Int, _  attackRate: Double, _  moveSpeed: Int, _  turnRate: Double, _  cmEnabled: Bool) {
            self.id = id
            self.name = name
            self.localizedName = localizedName
            self.primaryAttr = primaryAttr
            self.attackType = attackType
            self.roles = roles
            self.img = img
            self.icon = icon
            self.baseHealth = baseHealth
            self.baseHealthRegen = baseHealthRegen
            self.baseMana = baseMana
            self.baseManaRegen = baseManaRegen
            self.baseArmor = baseArmor
            self.baseMr = baseMr
            self.baseAttackMin = baseAttackMin
            self.baseAttackMax = baseAttackMax
            self.baseStr = baseStr
            self.baseAgi = baseAgi
            self.baseInt = baseInt
            self.strGain = strGain
            self.agiGain = agiGain
            self.intGain = intGain
            self.attackRange = attackRange
            self.projectileSpeed = projectileSpeed
            self.attackRate = attackRate
            self.moveSpeed = moveSpeed
            self.turnRate = turnRate
            self.cmEnabled = cmEnabled
        }
}
