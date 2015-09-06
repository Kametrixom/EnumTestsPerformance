//
//  main.swift
//  EnumTests
//
//  Created by Kametrixom Tikara on 06/09/15.
//  Copyright © 2015 Kametrixom Tikara. All rights reserved.
//


import Foundation

/*
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
*/

for nCases in [128, 256, 512, 1024] {
	let name = "C\(nCases)"
	
	let randomStrings = (0..<nCases).map{_ in "\"\(arc4random())\"" }
	
	print("enum \(name) : RawRepresentable {")
	for i in 0..<nCases {
		print("\tcase \(name)C\(i)")
	}
	
	print("\tstatic let rawToEnum : [String : \(name)] = [")
	for i in 0..<nCases {
		print("\t\t\(randomStrings[i]) : \(name)C\(i),")
	}
	print("\t]")
	
	print("\tstatic let hashToRaw : [String] = [")
	for i in 0..<nCases {
		print("\t\t\(randomStrings[i]),")
	}
	print("\t]")
	
	let toPrint = [
		"var rawValue : String {",
		"\treturn \(name).hashToRaw[hashValue]",
		"}",
		"",
		"init?(rawValue: String) {",
		"\tif let c = \(name).rawToEnum[rawValue] {",
		"\t\tself = c",
		"\t} else {",
		"\t\tself = \(name)C0",
		"\t\treturn nil",
		"\t}",
		"}"
	].map{ "\t\($0)" }
	
	print(toPrint.joinWithSeparator("\t\n"))
	
	print("}")
}

