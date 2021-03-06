//
//  Merchant+CoreDataProperties.swift
//  Axxess+
//
//  Created by Michelline Tran on 7/20/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import Foundation
import CoreData


extension Merchant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Merchant> {
        return NSFetchRequest<Merchant>(entityName: "Merchant")
    }

    @NSManaged public var address: String?
    @NSManaged public var continualDeal: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var oneTimeDeals: NSSet?

}

// MARK: Generated accessors for oneTimeDeals
extension Merchant {

    @objc(addOneTimeDealsObject:)
    @NSManaged public func addToOneTimeDeals(_ value: OneTimeDeal)

    @objc(removeOneTimeDealsObject:)
    @NSManaged public func removeFromOneTimeDeals(_ value: OneTimeDeal)

    @objc(addOneTimeDeals:)
    @NSManaged public func addToOneTimeDeals(_ values: NSSet)

    @objc(removeOneTimeDeals:)
    @NSManaged public func removeFromOneTimeDeals(_ values: NSSet)

}

// MARK: Helpers
extension Merchant {
    func checkAvailableOneTimeDeals() -> Int {
        var availableDealsCount = 0
        
        guard let deals = oneTimeDeals as? Set<OneTimeDeal> else { assertionFailure("Failed to cast merchant.oneTimeDeals as Set<OneTimeDeal>"); return 0 }
        
        for deal in deals {
            if !deal.used { availableDealsCount += 1 }
        }
        
        return availableDealsCount
    }
}
