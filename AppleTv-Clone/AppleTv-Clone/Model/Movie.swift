//
//  Movie.swift
//  MovieAPI
//
//  Created by Pedro Franco on 06/06/23.
//

import SwiftUI

struct Movie: Identifiable {
    let id: Int
    let title: String
    let imageName: String
    let genre: [String]
}
