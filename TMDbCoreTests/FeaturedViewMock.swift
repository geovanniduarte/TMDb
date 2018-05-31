//
//  FeaturedViewMock.swift
//  TMDbCoreTests
//
//  Created by DesarrolloMac1 on 28/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
@testable import TMDbCore

final class FeaturedViewMock: FeaturedView {
    
    var setShowHeaderTitleCalls : [String] = []
    var setMovieHeaderTitleCalls : [String] = []
    var updateWithShowsCalls : [[Show]] = []
    var updateWithMoviesCalls : [[Movie]] = []
    
    func setShowsHeaderTitle(_ title: String) {
        setShowHeaderTitleCalls.append(title)
    }
    
    func setMoviesHeaderTitle(_ title: String) {
        setMovieHeaderTitleCalls.append(title)
    }
    
    func update(with shows: [Show]) {
        updateWithShowsCalls.append(shows)
    }
    
    func update(with movies: [Movie]) {
        updateWithMoviesCalls.append(movies)
    }
    
    
}
