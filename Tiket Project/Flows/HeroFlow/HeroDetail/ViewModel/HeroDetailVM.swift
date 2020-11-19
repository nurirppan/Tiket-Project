//
//  HeroDetailVM.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation
import RxSwift
import RxCocoa

class HeroDetailVM {
    
    private var models: HeroStatusModel?
    var tempSameAttributeHeroModel: [HeroStatusModel] = []
    
    var relayHeroDetail = BehaviorRelay<HeroStatusModel?>(value: nil)
    var relayTempSameAttributeHero = PublishSubject<[HeroStatusModel]>()
    
    
    let dispose = DisposeBag()
    
    init() { }
    
    struct Output {
        let outModel: Driver<HeroStatusModel?>
    }
    
    func transform() -> HeroDetailVM.Output {
        return Output(
            outModel: self.relayHeroDetail.asDriver()
        )
    }
    
    func fetchHeroDetail(id: Int, model: [HeroStatusResponse]) {
        for result in model {
            if id == result.id {
                self.models = self.returnHeroStatus(result: result)
                
                for resultSameAttrHero in model {
                    
                    let primaryAttr = self.models?.primaryAttr ?? ""
                    
                    if primaryAttr == resultSameAttrHero.primaryAttr {
                        let resultPrimaryAttr = self.returnHeroStatus(result: resultSameAttrHero)
                        self.tempSameAttributeHeroModel.append(resultPrimaryAttr)
                        continue
                    }
                }
            }
        }
        
        let sortPrimaryAttr = self.models?.primaryAttr ?? ""
        if sortPrimaryAttr  == "agi" {
            self.tempSameAttributeHeroModel.sort { $0.moveSpeed > $1.moveSpeed }
        } else if sortPrimaryAttr  == "str" {
            self.tempSameAttributeHeroModel.sort { $0.baseAttackMax > $1.baseAttackMax }
        } else {
            self.tempSameAttributeHeroModel.sort {$0.baseMana > $1.baseMana  }
        }
        let temp = self.tempSameAttributeHeroModel
        self.tempSameAttributeHeroModel.removeAll()
        
        self.tempSameAttributeHeroModel.append(contentsOf: temp[0...2])
        
        self.relayHeroDetail.accept(self.models ?? nil)
        self.relayTempSameAttributeHero.onNext(self.tempSameAttributeHeroModel)
        
        
    }
    
    
    
    private func returnHeroStatus(result: HeroStatusResponse) -> HeroStatusModel {
        return HeroStatusModel(
            id: result.id,
            name: result.name,
            localizedName: result.localizedName,
            primaryAttr: result.primaryAttr,
            attackType: result.attackType,
            roles: result.roles,
            img: result.img,
            icon: result.icon,
            baseHealth: result.baseHealth,
            baseHealthRegen: result.baseHealthRegen,
            baseMana: result.baseMana,
            baseManaRegen: result.baseManaRegen,
            baseArmor: result.baseArmor,
            baseMr: result.baseMr,
            baseAttackMin: result.baseAttackMin,
            baseAttackMax: result.baseAttackMax,
            baseStr: result.baseStr,
            baseAgi: result.baseAgi,
            baseInt: result.baseInt,
            strGain: result.strGain,
            agiGain: result.agiGain,
            intGain: result.intGain,
            attackRange: result.attackRange,
            projectileSpeed: result.projectileSpeed,
            attackRate: result.attackRate,
            moveSpeed: result.moveSpeed,
            turnRate: result.turnRate,
            cmEnabled: result.cmEnabled,
            legs: result.legs,
            proWin: result.proWin,
            proPick: result.proPick,
            heroID: result.heroID,
            proBan: result.proBan,
            the1_Pick: result.the1_Pick,
            the1_Win: result.the1_Win,
            the2_Pick: result.the2_Pick,
            the2_Win: result.the2_Win,
            the3_Pick: result.the3_Pick,
            the3_Win: result.the3_Win,
            the4_Pick: result.the4_Pick,
            the4_Win: result.the4_Win,
            the5_Pick: result.the5_Pick,
            the5_Win: result.the5_Win,
            the6_Pick: result.the6_Pick,
            the6_Win: result.the6_Win,
            the7_Pick: result.the7_Pick,
            the7_Win: result.the7_Win,
            the8_Pick: result.the8_Pick,
            the8_Win: result.the8_Win,
            nullPick: result.nullPick,
            nullWin: result.nullWin)
    }
}
