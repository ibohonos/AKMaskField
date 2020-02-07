//
//  AKMaskFieldPatternCharacter.swift
//  AKMaskField
//  GitHub: https://github.com/artemkrachulov/AKMaskField
//
//  Created by Artem Krachulov
//  Copyright (c) 2016 Artem Krachulov. All rights reserved.
//  Website: http://www.artemkrachulov.com/
//

/// Single block character pattern constant.

public enum AKMaskFieldPatternCharacter: String {
    
    //  MARK: - Constants
    
    case NumberDecimal = "d"
    case NonDecimal    = "D"
    case NonWord       = "W"
    case Alphabet      = "a"
    case AnyChar       = "."
    case NumberAndWord = "n"
    case MAC           = "m"
    
    /// Returns regular expression pattern.
    
    public func pattern() -> String {
        switch self {
        case .NumberDecimal   : return "\\d"
        case .NonDecimal      : return "\\D"
        case .NonWord         : return "\\W"
        case .Alphabet        : return "[a-zA-Z]"
        case .NumberAndWord   : return "[0-9a-zA-Z]"
        case .MAC             : return "[0-9a-fA-F]"
        default               : return "."
        }
    }
}
