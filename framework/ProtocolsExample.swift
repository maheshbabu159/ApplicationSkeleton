//
//  ProtocolsExample.swift
//  framework
//
//  Created by apple on 04/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
