//
//  main.swift
//  EnumTests
//
//  Created by Kametrixom Tikara on 06/09/15.
//  Copyright © 2015 Kametrixom Tikara. All rights reserved.
//


import Foundation

for nCases in [128, 256, 512, 1024] {
	let name = "E\(nCases)"
	
	let randomStrings = (0..<nCases).map{_ in "\"\(arc4random())\"" }
	
	print("enum \(name) : String {")
	for i in 0..<nCases {
		print("\tcase \(name)C\(i) = \(randomStrings[i])")
	}
	print("}")
	
	print("let rawValues\(name) = [")
	for i in 0..<nCases {
		print("\t\(randomStrings[i]),")
	}
	print("]")
}


