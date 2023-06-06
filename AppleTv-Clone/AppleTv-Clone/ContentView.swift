//
//  ContentView.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 06/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            VStack {
                Form {
                    List {
                        Text("A")
                        Text("A")
                        Text("A")
                        Text("A")
                    }
                }
            }.navigationTitle(Text("A"))
        }
        
        VStack{
            Text("macarronada")
            Text("macarronada")
            Text("macarronada")
            Text("macarronada")
        }
        
        
        
        
        HStack{
            
            Text("ejfwe")
        }
    }
    
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        
    }
}
