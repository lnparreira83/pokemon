//
//  PokemonDetail.swift
//  pokedex
//
//  Created by Lucas Parreira on 16/05/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetail: View {
    let pokemon:Pokemon
    @State var amount = 360.0
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    
    var body: some View {
        ZStack{
            ScrollView{
                Button(action:{
                    withAnimation (.interpolatingSpring(stiffness: 5, damping: 1)) {
                        self.amount += 360
                    }
                },label: {
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .frame(width:200, height: 200)
                })
                .rotation3DEffect(
                    .degrees(amount),
                    axis: (x:0,y:1,z:0))
              
                VStack{
                    Spacer()
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .bold()
                        
                    Text(pokemon.type)
                        .font(.subheadline)
                        .italic()
                        .padding()
                    Text(pokemon.description)
                        .padding()
                }
                
            }
            
        }
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: MOCK_POKEMON[0])
    }
}
