//
//  PokemonCell.swift
//  pokedex
//
//  Created by Lucas Parreira on 2/05/21.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    var pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top,4)
                    .padding(.leading)
                
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width:100, height: 24)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width:68, height: 68)
                        .padding([.bottom,.trailing],4)
                }
            }
        }
        .background(Color.white)
        .border(Color.black, width: 1)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: Pokemon(id: 1, name: "Bulbasaur", imageUrl: "Pokemon", type: "Poison",description: "..."))
    }
}
