//
//  HeroStatusModel.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

struct HeroStatusModel {
    let id: Int
    let name, localizedName: String
    let primaryAttr: String
    let attackType: String
    let roles: [String]
    let img, icon: String
    let baseHealth: Int
    let baseHealthRegen: Double?
    let baseMana: Int
    let baseManaRegen, baseArmor: Double
    let baseMr, baseAttackMin, baseAttackMax, baseStr: Int
    let baseAgi, baseInt: Int
    let strGain, agiGain, intGain: Double
    let attackRange, projectileSpeed: Int
    let attackRate: Double
    let moveSpeed: Int
    let turnRate: Double
    let cmEnabled: Bool
//    let legs, proWin, proPick, heroID: Int
//    let proBan, the1_Pick, the1_Win, the2_Pick: Int
//    let the2_Win, the3_Pick, the3_Win, the4_Pick: Int
//    let the4_Win, the5_Pick, the5_Win, the6_Pick: Int
//    let the6_Win, the7_Pick, the7_Win, the8_Pick: Int
//    let the8_Win, nullPick, nullWin: Int
}
