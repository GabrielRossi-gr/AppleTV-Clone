//
//  HorizontalScrollView.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 07/06/23.
//

import SwiftUI

struct HorizontalScrollView: View {
    
    //titulo navigation view
    @State
    var detailTitle = "Titulo"
    
    //quantidade de filmes na scrollView hotrizontal
    @State
    var sizeFilmes = 10
    
    //titulo da subtitle
    @State
    var subTitleView = "SubTitle"
    
    
    var body: some View {
        
      
        VStack(alignment: .leading,.){
                Text("\(subTitleView)").frame(alignment: .leading)
                ScrollView(.horizontal){
                    HStack{
                        ForEach (1...sizeFilmes, id: \.self){ index in
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 200, height: 200)
                                .padding(.horizontal, 4)
                        }
                    }
                    
                }
            }//final VStack
        //.frame(alignment: .topLeading)
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView()
    }
}
