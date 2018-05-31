//
//  DetailNavigatorMock.swift
//  TMDbCoreTests
//
//  Created by DesarrolloMac1 on 28/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
@testable import TMDbCore

final class DetailNavigatorMock : DetailNavigator {
    var navigateToShowCalls : [Int64] = []
    var navigateToMovieCalls : [Int64] = []
    
    func navigateToShow(withIdentifier identifier: Int64) {
        navigateToShowCalls.append(identifier)
    }
    
    func navigateToMovie(withIdentifier identifier: Int64) {
        navigateToMovieCalls.append(identifier)
    }
}
