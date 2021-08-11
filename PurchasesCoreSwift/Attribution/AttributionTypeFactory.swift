//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  AttributionTypeFactory.swift
//  PurchasesCoreSwift
//
//  Created by Juanpe Catalán on 9/7/21.
//  Copyright © 2021 Purchases. All rights reserved.
//

import Foundation

// TODO (post-migration): change back to internal.
@objc(RCAttributionTypeFactory)
public class AttributionTypeFactory: NSObject {

    @objc public func adClientProxy() -> AdClientProxy? {
        return AdClientProxy.adClientClass == nil ? nil : AdClientProxy()
    }

    @objc public func atTrackingProxy() -> TrackingManagerProxy? {
        return TrackingManagerProxy.trackingClass == nil ? nil : TrackingManagerProxy()
    }

    @objc public func asIdentifierProxy() -> ASIdentifierManagerProxy? {
        return ASIdentifierManagerProxy.identifierClass == nil ? nil : ASIdentifierManagerProxy()
    }

}