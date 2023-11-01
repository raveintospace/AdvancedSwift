//
//  UnitTestingBootcampViewModel.swift
//  SwiftfulAdvance
//
//  Created by Uri on 1/11/23.
//

import Foundation
import SwiftUI

class UnitTestingBootcampViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
