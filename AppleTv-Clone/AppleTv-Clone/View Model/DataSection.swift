//
//  DataSection.swift
//  AppleTv-Clone
//
//  Created by Gabriel Rossi on 07/06/23.
//

import SwiftUI


public class DataSection: ObservableObject{

    @Published var subtitle: String
    @Published var backGroundMovie: String
    
    
    
    init(subtitle: String, backGroundMovie: String) {
        self.subtitle = subtitle
        self.backGroundMovie = backGroundMovie
    }
    
}
