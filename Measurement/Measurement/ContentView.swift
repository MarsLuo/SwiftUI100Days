//
//  ContentView.swift
//  Measurement
//
//  Created by Yang Dev Luo on 2021/2/2.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputValue = ""
    @State var fromUnit = UnitSpeed.metersPerSecond
    
    @State var toUnit = UnitSpeed.metersPerSecond
    
    let speedUnits:[String:UnitSpeed] = ["米/秒":UnitSpeed.metersPerSecond, "千米/小时": UnitSpeed.kilometersPerHour, "英里/小时": UnitSpeed.milesPerHour, "节": UnitSpeed.knots]
    
    var body: some View {
        Form{
            Section(header: Text("请输入要转换的值")) {
                TextField("输入值", text: $inputValue)
            }
            Section(header: Text("转换单位选择")) {
                Text("转换单位")
                Picker("Value", selection: $fromUnit) {
                    ForEach(speedUnits.sorted(by: {$0.key > $1.key}), id: \.key) { item in
                        Text("\(item.key)").tag(item.value)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text("目标单位")
                Picker("Value", selection: $toUnit) {
                    ForEach(speedUnits.sorted(by: {$0.key > $1.key}), id: \.key) { item in
                        Text("\(item.key)").tag(item.value)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.groupBoxStyle(DefaultGroupBoxStyle())
            Section(header: Text("")) {
                Text("\(outputValue, specifier: "%.2f")")
            }
        }
    }
    
    var outputValue: Double {
        let fromDouble = Double(inputValue) ?? 0.0
        let fromValue = Measurement(value: fromDouble, unit: fromUnit)
        let toValue = fromValue.converted(to: toUnit)
        return toValue.value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
