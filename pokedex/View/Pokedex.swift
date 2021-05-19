//
//  Pokedex.swift
//  pokedex
//
//  Created by Lucas Parreira on 2/05/21.
//

import SwiftUI

struct Pokedex: View {
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var searchPokemon = ""
    @State var searching = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextField("Search Pokemon",text:$searchPokemon)
                        .padding(.leading,45)
                        .frame(height:45)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .onTapGesture {
                            searching = true
                        }
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                if searching {
                                    Button(action:{ searchPokemon = ""},
                                           label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .padding()
                                           })
                                }
                            })
                }
                
                LazyVGrid(columns: gridItems, spacing:16) {
                    ForEach(viewModel.pokemon.filter({"\($0)".contains(searchPokemon) || searchPokemon.isEmpty }), id: \.id){ pokemon in
                        NavigationLink(destination: PokemonDetail(pokemon: pokemon)){
                                PokemonCell(pokemon: pokemon)
                        }
                        
                    }
                }
            }
            .navigationTitle("Pokedex")
            .onAppear {
                viewModel.fetchPokemon()
            }
        }
    }
}

struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}
