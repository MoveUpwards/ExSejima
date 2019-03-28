//
//  MUDateTests.swift
//  ExSejimaTests
//
//  Created by Loïc GRIFFIE on 28/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import XCTest
@testable import ExSejima

class MUDateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        NSTimeZone.default = TimeZone(abbreviation: "UTC")! //swiftlint:disable:this force_unwrapping
    }

    func testFromComponents() {
        let current = Date().addingTimeInterval(-86_400).timeIntervalSinceNow
        let date = Date(day: -1).timeIntervalSinceNow
        XCTAssertNotNil(date)

        // Cast to Int to avoid milliseconds
        XCTAssertEqual(Int(date), Int(current))
    }

    func testIsInToday() {
        XCTAssert(Date().isToday)
        let tomorrow = Date().addingTimeInterval(86_400)
        XCTAssertFalse(tomorrow.isToday)
        let yesterday = Date().addingTimeInterval(-86_400)
        XCTAssertFalse(yesterday.isToday)
    }

    func testDateIso8601() {
        let date = Date(timeIntervalSince1970: 200532)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

        XCTAssertEqual(date.iso8601(), formatter.string(from: date))
    }

    func testDateFormat() {
        let date = Date(timeIntervalSince1970: 200532)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        XCTAssertEqual(date.string(), date.description)
        XCTAssertEqual(date.string(), formatter.string(from: date))

        formatter.dateFormat = "dd/MM/yyyy"
        XCTAssertEqual(date.string("dd/MM/yyyy"), formatter.string(from: date))

        formatter.dateFormat = "HH:mm"
        XCTAssertEqual(date.string("HH:mm"), formatter.string(from: date))

        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        XCTAssertEqual(date.string("dd/MM/yyyy HH:mm"), formatter.string(from: date))

        formatter.dateFormat = "iiiii"
        XCTAssertEqual(date.string("iiiii"), formatter.string(from: date))
    }

    func testDateString() {
        let date = Date(timeIntervalSince1970: 512)
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .none

        formatter.dateStyle = .short
        XCTAssertEqual(date.string(date: .short), formatter.string(from: date))

        formatter.dateStyle = .medium
        XCTAssertEqual(date.string(date: .medium), formatter.string(from: date))

        formatter.dateStyle = .long
        XCTAssertEqual(date.string(date: .long), formatter.string(from: date))

        formatter.dateStyle = .full
        XCTAssertEqual(date.string(date: .full), formatter.string(from: date))

        formatter.timeStyle = .short
        formatter.dateStyle = .short
        XCTAssertEqual(date.string(date: .short, time: .short), formatter.string(from: date))

        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        XCTAssertEqual(date.string(date: .medium, time: .medium), formatter.string(from: date))

        formatter.timeStyle = .long
        formatter.dateStyle = .long
        XCTAssertEqual(date.string(date: .long, time: .long), formatter.string(from: date))

        formatter.timeStyle = .full
        formatter.dateStyle = .full
        XCTAssertEqual(date.string(date: .full, time: .full), formatter.string(from: date))

        formatter.dateStyle = .none

        formatter.timeStyle = .short
        XCTAssertEqual(date.string(time: .short), formatter.string(from: date))

        formatter.timeStyle = .medium
        XCTAssertEqual(date.string(time: .medium), formatter.string(from: date))

        formatter.timeStyle = .long
        XCTAssertEqual(date.string(time: .long), formatter.string(from: date))

        formatter.timeStyle = .full
        XCTAssertEqual(date.string(time: .full), formatter.string(from: date))
    }

    func testDayInterval() {
        let offset = 12600.0
        // "1970-01-01 01:00:00 +0000"
        let date = Date(timeIntervalSince1970: offset)

        // start: "1970-01-01 00:00:00 +0000"
        // end: "1970-01-01 23:59:59 +0000"
        let (start, end) = Date().dayInterval(for: date)
        XCTAssertEqual(start.timeIntervalSince1970, date.addingTimeInterval(-offset).timeIntervalSince1970)
        XCTAssertEqual(end.timeIntervalSince1970, date.addingTimeInterval(86_399 - offset).timeIntervalSince1970)
    }

    func testYearsSince() {
        let date = Date(year: -20)
        let years = Date().yearsSince(date)
        XCTAssertEqual(years, 20)
    }

    func testTimeInterval() {
        XCTAssertEqual(TimeInterval.second, 1)
        XCTAssertEqual(TimeInterval.minute, 60)
        XCTAssertEqual(TimeInterval.hour, 3600)
        XCTAssertEqual(TimeInterval.day, 86400)
    }
}
