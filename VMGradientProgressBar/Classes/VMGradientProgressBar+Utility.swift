//
//  VMGradientProgressBar+Utility.swift
//  VMGradientProgressBar
//
//  Created by Vaneet Modgill on 13/12/19.
//  Copyright © 2019 vaneetmodgill@gmail.com. All rights reserved.
//

import Foundation

extension Double {
    //Mark: Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
