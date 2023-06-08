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
            
            
            Image("m3")
                
                .resizable()
                .frame(width: .infinity , height: 800, alignment: .top)
                .offset(x: -0, y:-35)
                
// efeito degrade
            Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.black.opacity(1.7)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
//scrollview
            ScrollView{
                VStack{//
                    
                
                        
                        VStack{
                            Text("NOVOS EPISODEOS ÀS SEXTAS")
                                .foregroundColor(.white)
                            Text("TITULO").font(.system(size: 90))
                                .foregroundColor(.white)
                                .bold()
                            Text("genero da serie, 5 de maio 2023, 59 minutos")
                                .foregroundColor(.white)
                            
                            
//button 1
                            Button(action: {
                                // Ação a ser executada quando o botão for pressionado
                                print("Botão pressionado!")
                            }, label: {
                                // Conteúdo do botão
                                HStack{
                                    Text(Image(systemName: "play.fill")).foregroundColor(.black)
                                    Text("Reproduzir Episodeo Grátis")
                                        .foregroundColor(.black)
                                        .font(.body).bold()
                                }
                                .padding().frame(width: 300 , height: 53)
                                .background(Color.white)
                                .cornerRadius(10)
                                
                            })
                            
//button 2
                            Button(action: {
                                // Ação a ser executada quando o botão for pressionado
                                print("Botão pressionado!")
                            }, label: {
                                // Conteúdo do botão
                                Text("Iniciar Periodo Grátis")
                                    .foregroundColor(.black)
                                    .font(.body).bold()
                                
                                    .padding().frame(width: 300 , height: 53)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                
                            })
                            
//propaganda
                            Text("7 dias gratis, depois 14,90/mes")
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            
//description
                            Text("The Beatles foi uma banda musical britânica de rock, formada na cidade de Liverpool em 1960. Com os integrantes John Lennon.")
                                .foregroundColor(.white)
                                .font(.headline)
                            
//final container top
                        }.frame(width: 390, height: 390, alignment: .top)
                            .blur(radius: 0)
                        
                        
                
                        
//card container
                        VStack(alignment: .leading){
                            Text("Temporada 1")
                                .foregroundColor(.white)
                                .font(.title).bold()
                                .padding(.top, 10)
                            ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(0..<6){i in
                                            VStack(alignment: .leading){
                                                CardView(img: "m\(i)")
                                                
                                                //description card
                                                Text("Episódio X")
                                                    .foregroundColor(.white)
                                                Text("The Beatles foi uma banda musical britanica de rock, formada na cidade de Liverpool em 1960.")
                                                    .foregroundColor(.white)
                                                
                                                
                                            }.frame(width: 230 , height: 260, alignment: .top)
                                        }
                                }
                            }
            
                        }.padding(.leading)
                        .padding(.bottom, 40)
                            .background(.black)
                            
        
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }//vstack
                .padding(.top, 300)
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
    var x = 0
    
    
    var body: some View{
        VStack{
            Image(img)
                .resizable().frame(width: 230 , height: 140)
            
            
        }
        
        
    }
}
