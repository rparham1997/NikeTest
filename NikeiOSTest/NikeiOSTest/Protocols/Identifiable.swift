//
//  Identifiable.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import Foundation


/// A type with a string identifier.
protocol Identifiable {

    /// The string identifier.
    static var identifier: String { get set }

}
