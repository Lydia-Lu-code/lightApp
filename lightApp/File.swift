//
//  File.swift
//  lightApp
//
//  Created by 維衣 on 2022/8/2.
//

import Foundation

//class Numerology{
struct Numerology{
    var numerologyKey: Int = 0
    var numerologyValue: String = ""
    
    init(numerologyKey: Int ,numerologyValue: String) {
        self.numerologyKey = numerologyKey
        self.numerologyValue = numerologyValue
    }
}

let numerologys = [Numerology(numerologyKey: 1, numerologyValue: "紅"),
           Numerology(numerologyKey: 2, numerologyValue: "橙"),
           Numerology(numerologyKey: 3, numerologyValue: "黃"),
           Numerology(numerologyKey: 4, numerologyValue: "綠"),
           Numerology(numerologyKey: 5, numerologyValue: "藍"),
           Numerology(numerologyKey: 6, numerologyValue: "靛"),
           Numerology(numerologyKey: 7, numerologyValue: "紫"),
           Numerology(numerologyKey: 8, numerologyValue: "粉"),
           Numerology(numerologyKey: 9, numerologyValue: "白")]

//let 生命靈數 = [1:"紅", 2:"橙", 3:"黃", 4:"綠", 5:"藍", 6:"靛", 7:"紫", 8:"金粉", 9:"白"]
//let cde :Dictionary<Int:Any> =  [1:"紅", 2:"橙", 3:"黃", 4:"綠", 5:"藍", 6:"靛", 7:"紫", 8:"金粉", 9:"白"]

