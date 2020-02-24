//
//  MaskedTextField.swift
//  AKMaskField
//
//  Created by Іван Богоносюк on 24.02.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(iOSApplicationExtension 13.0, *)
struct MaskedTextField: UIViewRepresentable {
    @Binding var text: String
        
    let placeholder: String
    var mask: String? = nil
    var maskType: String = "_"
    var keyboardType: UIKeyboardType = .default
    var isClear: Bool = false
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool) {
        self.placeholder = placeholder
        self._text = text
        self.isClear = isClear
    }
    
    init(_ placeholder: String, text: Binding<String>, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.keyboardType = keyboardType
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.keyboardType = keyboardType
        self.isClear = isClear
    }
    
    init(_ placeholder: String, text: Binding<String>, mask: String) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool, mask: String) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.isClear = isClear
    }
    
    init(_ placeholder: String, text: Binding<String>, mask: String, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.keyboardType = keyboardType
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool, mask: String, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.keyboardType = keyboardType
        self.isClear = isClear
    }
    
    init(_ placeholder: String, text: Binding<String>, mask: String, maskType: String) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.maskType = maskType
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool, mask: String, maskType: String) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.maskType = maskType
        self.isClear = isClear
    }
    
    init(_ placeholder: String, text: Binding<String>, mask: String, maskType: String, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.maskType = maskType
        self.keyboardType = keyboardType
    }
    
    init(_ placeholder: String, text: Binding<String>, isClear: Bool, mask: String, maskType: String, keyboardType: UIKeyboardType) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.maskType = maskType
        self.keyboardType = keyboardType
        self.isClear = isClear
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> AKMaskField {
        let field = AKMaskField()
        
        field.maskDelegate = context.coordinator
        field.keyboardType = keyboardType

        if placeholder != "" {
            field.placeholder = placeholder
        }
        
        if let mask = mask {
            field.setMask(mask, withMaskTemplate: maskType)
        }
        
        return field
    }

    func updateUIView(_ uiView: AKMaskField, context: Context) {
//        uiView.text = text
    }
    
    class Coordinator : NSObject, AKMaskFieldDelegate {
        var parent: MaskedTextField

        init(_ uiTextView: MaskedTextField) {
            self.parent = uiTextView
        }

        func maskField(_ maskField: AKMaskField, shouldChangeBlock block: AKMaskFieldBlock, inRange range: inout NSRange, replacementString string: inout String) -> Bool {

            return true
        }
        
        func maskFieldDidChangeSelection(_ maskField: AKMaskField) {
            if parent.isClear {
                parent.text = maskField.clearText
            } else {
                parent.text = maskField.text ?? ""
            }
        }
    }
}
