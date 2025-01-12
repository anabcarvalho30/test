//
//  AddBagSheet.swift
//  ToDoListApp
//
//  Created by iredefbmac_31 on 09/01/25.
//

import SwiftUI

struct AddBagSheet: View {
    @Binding var bags: [Bag]
    
    @State private var newBagName: String = ""
    @State private var selectedColor: Color = .blue
    @State private var selectedDate: Date = Date()

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List{
            Section{
                TextField("Nome", text: $newBagName)
                    .padding(.top, 25)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: .secondary, radius: 3, x: 0, y:2)
                
                HStack{
                    Text("Escolha uma data")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(red: 0.11, green: 0.12, blue: 0.15).opacity(0.72))
                    
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                }.padding(.horizontal, 30)
                
                HStack{
                    Text("Escolha uma cor")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(red: 0.11, green: 0.12, blue: 0.15).opacity(0.72))
                    
                    ColorPicker("", selection: $selectedColor)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                }.padding(.horizontal, 30)
                
                Button(action: saveBag) {
                    Text("SALVAR")
                        .foregroundColor(.white)
                        .padding()
                        .background(.purple)
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .bold))
                    
//                    let oneBag = Bag(name: newBagName, color: selectedColor, dateOfPurchase: selectedDate)
//                    print(oneBag)
//                    if newBagName != ""{
//                        modelContext.insert(oneBag)
//                    }
                    
                } .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 25)
                
                Spacer()
            } header: {
                Text("Adicione compras")
            }
        }
    }
    private func saveBag() {
            guard !newBagName.isEmpty else { return }

            let newBag = Bag(
                listOfItens: [],
                name: newBagName,
                color: selectedColor,
                dateOfPurchase: selectedDate
            )
            bags.append(newBag)

            presentationMode.wrappedValue.dismiss()
        }
}



