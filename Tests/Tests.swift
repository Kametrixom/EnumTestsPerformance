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
	let repeatsDefault = 20
	let repeatsCustom = 200
	
	func test128Cases() {
		// Chooses 128 random case rawValues
		let repeatedRawValues = (0..<128).choose(128, rep: repeatsDefault).map{ rawValuesE128[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E128(rawValue: rawValue)
			}
		}
	}
    
	func test256Cases() {
		let repeatedRawValues = (0..<256).choose(128, rep: repeatsDefault).map{ rawValuesE256[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E256(rawValue: rawValue)
			}
		}
	}
	
	func test512Cases() {
		let repeatedRawValues = (0..<512).choose(128, rep: repeatsDefault).map{ rawValuesE512[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E512(rawValue: rawValue)
			}
		}
	}
	
	func test1024Cases() {
		let repeatedRawValues = (0..<1024).choose(128, rep: repeatsDefault).map{ rawValuesE1024[$0] }

		measureBlock {
			for rawValue in repeatedRawValues {
				_ = E1024(rawValue: rawValue)
			}
		}
	}
	
	func test128CustomCases() {
		// Chooses 128 random case rawValues
		let repeatedRawValues = (0..<128).choose(128, rep: repeatsCustom).map{ C128.hashToRaw[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = C128(rawValue: rawValue)
			}
		}
	}
	
	func test256CustomCases() {
		let repeatedRawValues = (0..<256).choose(128, rep: repeatsCustom).map{ C256.hashToRaw[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = C256(rawValue: rawValue)
			}
		}
	}
	
	func test512CustomCases() {
		let repeatedRawValues = (0..<512).choose(128, rep: repeatsCustom).map{ C512.hashToRaw[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = C512(rawValue: rawValue)
			}
		}
	}
	
	func test1024CustomCases() {
		let repeatedRawValues = (0..<1024).choose(128, rep: repeatsCustom).map{ C1024.hashToRaw[$0] }
		
		measureBlock {
			for rawValue in repeatedRawValues {
				_ = C1024(rawValue: rawValue)
			}
		}
	}
    
    
    func test128Comparison() {
        let a = (0..<128).choose(128, rep: 10000).map{ rawValuesE128[$0] }
        let b = (0..<128).choose(128, rep: 10000).map{ rawValuesE128[$0] }
        
        measureBlock {
            for (a, b) in zip(a, b) {
                let x = a == b
                let _ = x
            }
        }
    }
    
    func test256Comparison() {
        let a = (0..<256).choose(128, rep: 10000).map{ rawValuesE256[$0] }
        let b = (0..<256).choose(128, rep: 10000).map{ rawValuesE256[$0] }
        
        measureBlock {
            for (a, b) in zip(a, b) {
                let x = a == b
                let _ = x
            }
        }
    }
    
    func test512Comparison() {
        let a = (0..<512).choose(128, rep: 10000).map{ rawValuesE512[$0] }
        let b = (0..<512).choose(128, rep: 10000).map{ rawValuesE512[$0] }
        
        measureBlock {
            for (a, b) in zip(a, b) {
                let x = a == b
                let _ = x
            }
        }
    }
    
    func test1024Comparison() {
        let a = (0..<1024).choose(128, rep: 10000).map{ rawValuesE1024[$0] }
        let b = (0..<1024).choose(128, rep: 10000).map{ rawValuesE1024[$0] }
        
        measureBlock {
            for (a, b) in zip(a, b) {
                let x = a == b
                let _ = x
            }
        }
    }

	
}
