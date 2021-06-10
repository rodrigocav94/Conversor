//
//  ContentView.swift
//  Conversor
//
//  Created by Rodrigo Cavalcanti on 20/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var entrada = ""
    @State private var entradaEscolhida = 0
    @State private var saidaEscolhida = 1
    
    var entradaNumero: Double {
        Double(entrada) ?? 0
    }
    var fConvertido: Double {
        (entradaNumero - 32) * 5/9
    }
    var kConvertido: Double {
        (entradaNumero - 273.15)
    }
    
    var entradaEmCelsius: Double {
        switch entradaEscolhida {
        case 0:
            return entradaNumero
        case 1:
            return fConvertido
        case 2:
            return kConvertido
        default:
            return 0
        }
    }
    
    var saidaConvertida: Double {
        switch saidaEscolhida {
        case 0:
            return (entradaEmCelsius)
        case 1:
            return ((entradaEmCelsius * 9/5) + 32)
        case 2:
            return (entradaEmCelsius + 273.15)
        default:
            return (0)
        }
    }
    
    let unidades = ["Celsius", "Fahrenheit", "Kelvin"]
    let siglas = ["ºC", "ºF", "ºK"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Digite um valor")) {
                    TextField("Quantidade", text: $entrada)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Escolha a unidade de entrada")) {
                    Picker("Entrada", selection: $entradaEscolhida) {
                        ForEach(0 ..< unidades.count) {
                            Text("\(unidades[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Escolha a unidade de saída")) {
                    Picker("Saída", selection: $saidaEscolhida) {
                        ForEach(0 ..< unidades.count) {
                            Text("\(unidades[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("O resultado é \(saidaConvertida, specifier: "%.2F") \(siglas[saidaEscolhida])")
                }
            }
            .navigationTitle("Conversor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
