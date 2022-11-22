//
//  ContentView.swift
//  Ipoteka_Calculate
//
//  Created by mac on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var summa = ""
    @State private var percents = 0
    @State private var months = ""
    
    let tipPercent = [5, 10, 15, 20]
    
    var amountPay: Double {
        let summa1 = Double(summa) ?? 0
        let months1 = Double(months) ?? 0
        let tipSelectionPercent = Double(tipPercent[percents])
        let payMonth = Double(summa1 / months1)
        let percentMonth = Double(summa1 / 100 * tipSelectionPercent / months1)
        let amountPayMonth = Double(payMonth + percentMonth)
        return amountPayMonth
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            Section("Расчитай легко платеж"){
                Image("home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Калькулятор ипотеки")
                    .padding()
                    .font(.largeTitle)
            }
            Form{
            Section("Введите сумму ипотеки, выберите % и срок"){
            TextField("Введите сумму ипотеки", text: $summa)
                Picker("Percent" ,selection: $percents) {
                    ForEach(0..<tipPercent.count) {
                        Text("\(self.tipPercent[$0]) %")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            TextField("Введите срок ипотеки в месяцах", text: $months)
           
            }
            
            Section("Ваш платеж") {
                Text(" \(amountPay.isNaN ? 0: amountPay, specifier: "%.2f")")
            }
            
        }
            Image("happy")
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                    
                     .frame(width: 380, height: 200)//рамка
                     .clipShape(Capsule())//овал
                     .overlay(Capsule().stroke(Color.black, lineWidth: 1))// рамка
                     .shadow(color: .black, radius: 2)//тень
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
