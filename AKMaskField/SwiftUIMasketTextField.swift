//
//  SwiftUIMasketTextField.swift
//  AKMaskField
//
//  Created by Іван Богоносюк on 23.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif

#if AKMaskFieldDEBUG
@available(iOS 13.0, *)
public struct SwiftUIMaskedTextField: UIViewRepresentable {
    @Binding var text: String
        
    let placeholder: String
    var mask: String? = nil
    var maskType: String = "_"
    var keyboardType: UIKeyboardType = .default
    var isClear: Bool = false

    @State var firstUpdate = true
    
    public init(_ placeholder: String,
         text: Binding<String>,
         isClear: Bool = false,
         mask: String? = nil,
         maskType: String = "_",
         keyboardType: UIKeyboardType = .default
    ) {
        self.placeholder = placeholder
        self._text = text
        self.mask = mask
        self.maskType = maskType
        self.keyboardType = keyboardType
        self.isClear = isClear
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIView(context: Context) -> AKMaskField {
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

    public func updateUIView(_ maskField: AKMaskField, context: Context) {
        if firstUpdate {
            DispatchQueue.main.async {
                self.firstUpdate = false
            }

            maskField.text = text
        }
    }
    
    public class Coordinator : NSObject, AKMaskFieldDelegate {
        var parent: SwiftUIMaskedTextField

        init(_ uiTextView: SwiftUIMaskedTextField) {
            self.parent = uiTextView
        }

        public func maskField(_ maskField: AKMaskField, shouldChangeBlock block: AKMaskFieldBlock, inRange range: inout NSRange, replacementString string: inout String) -> Bool {

            return true
        }
        
        public func maskFieldDidChangeSelection(_ maskField: AKMaskField) {
            DispatchQueue.main.async {
                if self.parent.isClear {
                    self.parent.text = maskField.clearText
                } else {
                    self.parent.text = maskField.text ?? ""
                }
            }
        }
    }
}
#endif
