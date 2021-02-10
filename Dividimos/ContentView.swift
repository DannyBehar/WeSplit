//
//  ContentView.swift
//  Dividimos
//
//  Created by Ana Claudia de Mauro on 08/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let numberPerson = Double(numberOfPeople) ?? 0
//        let peopleCount = Double(numberPerson + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / numberPerson
        
        return amountPerPerson
    }
    
    var totalCheck: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Quantia", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Quantidade de pessoas", text: $numberOfPeople)
                        .keyboardType(.numberPad)
//                    Picker("Quantidade de pessoas", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) pessoas")
                        }
                Section (header: Text("Você quer dar quanto de gorjeta?")) {
                    Picker("% da gorjeta", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("Total por pessoa")) {
                    Text("R$ \(totalPerPerson, specifier: "%.2f")")
                    }
                Section (header: Text("Total mais gorjeta")) {
                    Text("R$ \(totalCheck, specifier: "%.2f")")
            }
        }
        .navigationBarTitle("Dividimos")
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
