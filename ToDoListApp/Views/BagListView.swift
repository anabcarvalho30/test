//
//  ContentView.swift
//  ToDoListApp
//
//  Created by iredefbmac_31 on 18/12/25
//

// Estou pensando sobre como organizar melhor as compras fixas e listas de compras, será que é realmente preciso ter um bagcard como modelo de card quando os itens da lista já serao os cards em si, eu consigo dentro do swift ui fazer essas mudanças de estilizaçao de cada card sem deixar o código desorganizado ou abarrotado? será nesse mesmo arquivo .swift ou outro?
import SwiftUI
import SwiftData

struct BagListView: View {
    
    @State private var bags: [Bag] = []  // Lista de bags
    @State private var isPresentingAddBag: Bool = false
    @State var viewModel: BagViewModel = BagViewModel()
    
    var body: some View {
        
        NavigationView {
            List{
                ZStack {
                    Image("ReStock")
                        .frame(maxWidth: .infinity)
                   
                    NavigationLink(destination: ConfigView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.purple)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.system(size: 20, weight: .bold))
                    }.buttonStyle(PlainButtonStyle())
                }

                HStack {
                    Text("NOVA COMPRA")
                        .padding(.leading)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(Color.secondary)
                    Spacer()
                    Button {
                        isPresentingAddBag = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.purple)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .padding(.trailing)
                }.listRowSeparator(.hidden)
                    .padding([.leading, .trailing], 5)
                
                // Seção de "Compras Fixas"
                if !viewModel.bagListFix.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Compras Fixas")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(Color.secondary)
                            .padding(.leading, 20)
                        
                        
                        
                        ForEach(viewModel.bagListFix) { bag in
                            BagCard(oneBag: bag)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                    Button(action:{
                                        print("Test")
                                    }){
                                        Label("delete", systemImage: "trash")
                                    }
                                }
                        }.scrollContentBackground(.hidden)
                            .padding(.vertical, 4)
                        
                    }.listRowSeparator(.hidden)
                }
                
                //          Seção de "Listas de Compras"
                if !viewModel.bagListAll.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Listas de Compras")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(Color.secondary)
                            .padding(.leading, 20)
                            .padding(.top, 5)
                        
                        ForEach(viewModel.bagListAll) { bag in
                            BagCard(oneBag: bag)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                    Button(action:{
                                        print("Test")
                                    }){
                                        Label("delete", systemImage: "trash")
                                    }
                                }
                        }
                        .scrollContentBackground(.hidden)
                        .padding(.vertical, 4)
                    }
                }
                
                Spacer()
            }.listStyle(.plain)
                .listRowSeparator(Visibility.hidden)
                .sheet(isPresented: $isPresentingAddBag) {
                    AddBagSheet(bags: $bags)
                }
        }
    }
}

#Preview {
    BagListView()
}
