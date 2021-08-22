//
//  FormValidator.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 22/08/21.
//

import Foundation

struct ValidationRules {
    let logic : (_ input : String?)->FormError?
 
    static let required = ValidationRules { input in
        guard let inp = input else { return nil }
        guard inp.isEmpty == true else { return nil }
        return .shouldNotEmpty
    }
    
    
    /*
     Explanation for anyone new to regex:

     In this description, "OC" means ordinary character - a letter or a digit.

     __firstpart ... has to start and end with an OC. For the characters in the middle you can have certain characters such as underscore, but the start and end have to be an OC. (However, it's ok to have only one OC and that's it, for example: j@blah.com)

     __serverpart ... You have sections like "blah." which repeat. (Example, mail.city.fcu.edu.) The sections have to start and end with an OC, but in the middle you can also have a dash "-". It's OK to have a section which is just one OC. (Example, w.campus.edu) You can have up to five sections, you have to have one. Finally the TLD (such as .com) is strictly 2 to 8 in size . (Obviously, just change the "8" as preferred by your support department.)

     */
    
    static let validEmail = ValidationRules { input in
        guard input != nil else { return nil }
        
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
        let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        let result = __emailPredicate.evaluate(with: input)
        return result == true ? nil : .invalidInput("email")
    }
}


enum FormError : LocalizedError {
    case invalidInput(String)
    case shouldNotEmpty
    
    var errorDescription : String? {
        switch self {
        case .invalidInput(let form):
            return "The \(form) is invalid. Please input a valid form."
        case .shouldNotEmpty:
            return "This form should not be empty"
        }
    }
}

class FormValidator {
    
    func validate(str : String?, rules : [ValidationRules])->FormError? {
        return rules.compactMap{ $0.logic(str) }.first
    }
    
}
