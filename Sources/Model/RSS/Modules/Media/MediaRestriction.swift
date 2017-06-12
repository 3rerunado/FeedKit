//
//  MediaRestriction.swift
//
//  Copyright (c) 2017 Nuno Manuel Dias
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

open class MediaRestriction {
    
    /**
     
     The element's attributes
     
     */
    open class Attributes {
        
        /**
         
         Indicates the type of relationship that the restriction represents 
         (allow | deny). In the example above, the media object should only be 
         syndicated in Australia and the United States. It is a required 
         attribute.
         
         Note: If the "allow" element is empty and the type of relationship is 
         "allow", it is assumed that the empty list means "allow nobody" and 
         the media should not be syndicated.
         
         */
        open var relationship: String?
        
        /**
         
         Specifies the type of restriction (country | uri | sharing ) that the 
         media can be syndicated. It is an optional attribute; however can only 
         be excluded when using one of the literal values "all" or "none".
         
         */
        open var type: String?
        
    }
    
    /**
     
     The element's attributes
     
     */
    open var attributes: Attributes?
    
    /**
     
     The element's value
     
     */
    open var value: String?
    
}

// MARK: - Initializers

extension MediaRestriction {
    
    convenience init(attributes attributeDict: [String : String]) {
        self.init()
        self.attributes = MediaRestriction.Attributes(attributes: attributeDict)
    }
    
}


extension MediaRestriction.Attributes {

    convenience init?(attributes attributeDict: [String : String]) {
        
        if attributeDict.isEmpty {
            return nil
        }
        
        self.init()
        
        self.relationship = attributeDict["relationship"]
        self.type = attributeDict["type"]
        
    }
    
}

// MARK: - Equatable

extension MediaRestriction: Equatable {
    
    public static func ==(lhs: MediaRestriction, rhs: MediaRestriction) -> Bool {
        return
            lhs.value == rhs.value &&
            lhs.attributes == rhs.attributes
    }
    
}

extension MediaRestriction.Attributes: Equatable {
    
    public static func ==(lhs: MediaRestriction.Attributes, rhs: MediaRestriction.Attributes) -> Bool {
        return
            lhs.relationship == rhs.relationship &&
            lhs.type == rhs.type
    }
    
}