//
//  DataModel.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 08/06/23.
//


import SwiftUI

public class DataModel: ObservableObject{
    
    @Published var titulo = ""
    @Published var backGroundImage = ""
    
    init(titulo: String = "", backGroundImage: String = "") {
        self.titulo = titulo
        self.backGroundImage = backGroundImage
    }
}
