//
//  Filter.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

/// Filter for payments list
enum Filter: String, CaseIterable, Identifiable {
    case all = "filter_all"
    case plus = "filter_plus"
    
    var id: Self { self }
}
