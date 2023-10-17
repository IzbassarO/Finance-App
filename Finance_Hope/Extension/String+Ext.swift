//
//  String+Ext.swift
//  Finance_Hope
//
//  Created by Izbassar on 03.10.2023.
//

import Foundation

extension String {
    /// Get localized string
    public var localized: String {
        return NSLocalizedString(self, bundle: Bundle(for: BundleClass.self), comment: "")
    }
}

private class BundleClass { }
