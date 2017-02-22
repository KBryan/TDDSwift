//
//  LocationTests.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-23.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest
import CoreLocation

@testable import TDDExample

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func performNotEqualTestWith(firstName:String,secondName:String,firstLongLat:(Double,Double)?,secondLongLat:(Double,Double)?) {
        var firstCoord:CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord:CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude:1,longitude:1)
        let location = Location(name: "",coordinate:coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    func test_Init_WhenGivenName_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        XCTAssertEqual(first, second)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 1.0, longitude: 0.0)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        XCTAssertNotEqual(first, second)
    }
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        XCTAssertNotEqual(first, second)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
