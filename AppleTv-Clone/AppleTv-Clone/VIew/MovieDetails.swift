//
//  MovieDetails.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 07/06/23.
//

import SwiftUI

struct MovieDetails: View {
    @ObservedObject var seriesView: SeriesViewModel
    
    
    var body: some View {
        
        ZStack{
            Image("m3").resizable()
            
            
            ScrollView{
                VStack{//
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("kkk")
                            .colorInvert()
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                ForEach(0..<6){i in
                                    CardView(img: "m\(i)")
                                        
                                }
                            }
                        }
                        
                    }.padding(.leading)
                        .padding(.bottom, 30)
                        .background(.black)
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("kkk")
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                ForEach(0..<6){i in
                                    CardView(img: "m\(i)")
                                }
                            }
                        }
                    }.padding(.leading)
                    
                    
                }//vstack
                .padding(.top, 650)
                
            }
            
            
        }
    }
}


struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(seriesView: SeriesViewModel())
    }
    
}


struct CardView: View{
    var img = ""

    var body: some View{
        VStack{
            Image(img)
                .resizable()
        }
        
        
    }
}
