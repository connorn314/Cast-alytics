//
//  ErrorHandling.swift
//  Podcast Analytics
//
//  Created by Connor Norton on 3/21/23.
//

import Foundation

extension Error {
    func myErrorMessage() -> String {
        if let clarifiedError = self as? FetchError {
            return clarifiedError.description
        } else {
            return self.localizedDescription
        }
    }
}
