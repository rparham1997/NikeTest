//
//  ErrorMessage.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import Foundation

struct ErrorMessage: Error {

    private let message: String

    var localizedDescription: String {
        return message
    }

    init(_ message: String) {
        self.message = message
    }

}
