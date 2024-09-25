//
//  Copyright © 2017 Bowtie. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    import SwiftUI
#elseif os(macOS)
    import AppKit
#endif

@objc(FKFlag)
public class Flag: NSObject {
    /**
     Country code of the flag
     */
    @objc public let countryCode: String

#if os(iOS) || os(tvOS)
    /**
     Original unstyled flag image
     */
    public let originalImage: Image
    
    /**
     Returns a flag if the country code is supported, otherwise it returns nil
     */
    @objc public init?(countryCode: String) {
        self.countryCode = countryCode
        self.originalImage = Image(countryCode, bundle: FlagKit.assetBundle)
    }
#elseif os(macOS)
    /**
     Original unstyled flag image
     */
    @objc public let originalImage: NSImage
    
    /**
     Returns a flag if the country code is supported, otherwise it returns nil
     */
    @objc public init?(countryCode: String) {
        guard let image = FlagKit.assetBundle.image(forResource: countryCode) else {
            return nil
        }
        
        self.countryCode = countryCode
        self.originalImage = image
    }
#endif
}
