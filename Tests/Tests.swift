//
//  Tests.swift
//  Tests
//
//  Created by Kametrixom Tikara on 06/09/15.
//  Copyright © 2015 Kametrixom Tikara. All rights reserved.
//

import XCTest
import GameplayKit

extension CollectionType where Generator.Element == Int {
	func choose(n: Int, rep: Int) -> [Int] {
		return Array(Repeat(count: rep, repeatedValue:
			GKRandomSource().arrayByShufflingObjectsInArray(Array(self)).map{ $0 as! Int }.prefix(n)
		).flatten())
	}
}

class Tests: XCTestCase {
	let repeats = 20
	
	func test128Cases() {
		// Chooses 128 random case rawValues
		let repeatedRawValues = (0..<128).choose(128, rep: repeats).map{ rawValuesE128[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E128(rawValue: rawValue)
			}
		}
	}
    
	func test256Cases() {
		let repeatedRawValues = (0..<256).choose(128, rep: repeats).map{ rawValuesE256[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E256(rawValue: rawValue)
			}
		}
	}
	
	func test512Cases() {
		let repeatedRawValues = (0..<512).choose(128, rep: repeats).map{ rawValuesE512[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E512(rawValue: rawValue)
			}
		}
	}
	
	func test1024Cases() {
		let repeatedRawValues = (0..<1024).choose(128, rep: repeats).map{ rawValuesE1024[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E1024(rawValue: rawValue)
			}
		}
	}
	
}
