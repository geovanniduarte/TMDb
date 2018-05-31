//
//  FeaturedPresenterTests.swift
//  TMDbCoreTests
//
//  Created by DesarrolloMac1 on 27/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTests: XCTestCase {
    private var sut : FeaturedPresenter!
    
    // Collaborators
    private let detailNavigatorMock = DetailNavigatorMock()
    private let  featuredViewMock = FeaturedViewMock()
    
    override func setUp() {
        super.setUp()
        
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock)
        sut.view = featuredViewMock
    }
    
    func test_DidLoad_setHeaderTitles() {
        //when
        sut.didLoad()
        
        // then
        XCTAssertEqual(featuredViewMock.setShowHeaderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setShowHeaderTitleCalls.first, NSLocalizedString("ON TV", comment: ""))
        XCTAssertEqual(featuredViewMock.setMovieHeaderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setMovieHeaderTitleCalls.first, NSLocalizedString("IN THEATERS", comment: ""))
    }
    
         //given       //when        //then
    func testShow_didSelectShow_navigatesToShow() {
        // given
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: [])
        
        // when
        sut.didSelect(show: show)
        
        //then
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.first, show.identifier)
    }
    func testMovie_didSelectMovie_navigatesToMovie() {
        // given
        let movie = Movie(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        releaseDate: nil,
                        genreIdentifiers: [])
        
        // when
        sut.didSelect(movie: movie)
        
        //then
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.first, movie.identifier)
    }
    
    
}
