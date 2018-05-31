//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by DesarrolloMac1 on 26/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
protocol DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64)
    func navigateToMovie(withIdentifier identifier: Int64)
}
