//
//  HorizontalScrollView.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 07/06/23.
//

import SwiftUI

struct HorizontalScrollView: View {
    
    
//    @StateObject private var dataSection = DataSection(subtitle: "subtitle", backGroundMovie: "m0")
    
    @ObservedObject datasection: DataSection

    //quantidade de filmes na scrollView hotrizontal
    var sizeFilmes = 10

    var filmes = ["filme0", "filme1", "filme2", "filme3"]
    
    var body: some View {
    
        
    
        
        VStack(alignment: .leading){
            Text("\(datasection.subtitle)").padding()
            ScrollView(.horizontal){
                LazyHGrid(rows: [GridItem(.fixed(100))]) {
                    ForEach(filmes, id: \.self) { item in
                        Text(item)
                            .frame(width: 230, height: 150)
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                    }
                }
            }.padding(.leading)
        }
        
        
       }
            
    }


struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView()
    }
}
