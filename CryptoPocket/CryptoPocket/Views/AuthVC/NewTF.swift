//
//  NewTF.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 16.03.25.
//

import UIKit

class NewTF: UITextField {
    var textPadding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 15)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
