//
//  main.swift
//  travelTimeGrabber
//
//  Created by Taylor H. Gilbert on 5/30/15.
//  Copyright (c) 2015 Taylor H. Gilbert. All rights reserved.
//

import Foundation


println("Hello, World!")

let locations: [String: CGPoint] = [
    "HOME": CGPointMake(37.141771, -121.979310),
    "UPPER_17_N": CGPointMake(37.153301, -121.985222)]

let outputPath = "/Users/taylorg/Desktop/tripOutput.txt"

var output = ""

let startingPoint = locations["HOME"]!
let endingPoint = locations["UPPER_17_N"]!

let URLString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(startingPoint.x),\(startingPoint.y)&destination=\(endingPoint.x),\(endingPoint.y)&departure_time=now&key=AIzaSyDWDlWnzO1T6ia7hPWwYndf-9mZFwdMCRs"
let URL = NSURL(string: URLString)!
let response = NSString(contentsOfURL: URL, encoding: NSUTF8StringEncoding, error: nil)!

println(response)

let durationSplit = response.componentsSeparatedByString("\"duration\" : {")

assert(durationSplit.count>1, "durationSplit failed")
let valueSplit = durationSplit[1].componentsSeparatedByString("\"value\" : ")
assert(valueSplit.count>1, "valueSplit failed")
let newlineSplit = valueSplit[1].componentsSeparatedByString("\n")
assert(newlineSplit.count>1, "newlineSplit failed")
let value = newlineSplit[0].integerValue!

response.writeToFile(outputPath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
