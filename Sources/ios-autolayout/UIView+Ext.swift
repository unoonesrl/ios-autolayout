//
//  UIView+Ext.swift
//  
//
//  Created by Tiziano Cialfi on 06/04/22.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets? = nil,
        size: CGSize? = nil
    ) -> Anchors {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchors = Anchors()
        
        if let top = top {
            anchors.top = topAnchor.constraint(equalTo: top, constant: padding?.top ?? 0)
        }
        if let bottom = bottom {
            anchors.bottom = bottomAnchor.constraint(equalTo: bottom, constant: padding?.bottom ?? 0)
        }
        if let leading = leading {
            anchors.leading = leadingAnchor.constraint(equalTo: leading, constant: padding?.left ?? 0)
        }
        if let trailing = trailing {
            anchors.trailing = trailingAnchor.constraint(equalTo: trailing, constant: padding?.right ?? 0)
        }
        if let size = size {
            if size.width > 0 {
                anchors.width = widthAnchor.constraint(equalToConstant: size.width)
            }
            if size.height > 0 {
                anchors.height = heightAnchor.constraint(equalToConstant: size.height)
            }
        }
        
        anchors.activateConstraints()
        return anchors
    }
    
    @discardableResult
    func center(
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        paddingX: CGFloat? = nil,
        paddingY: CGFloat? = nil
    ) -> Anchors {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchors = Anchors()
        
        if let centerX = centerX {
            anchors.centerX = centerXAnchor.constraint(equalTo: centerX, constant: paddingX ?? 0)
        }
        if let centerY = centerY {
            anchors.centerY = centerYAnchor.constraint(equalTo: centerY, constant: paddingY ?? 0)
        }
        
        anchors.activateConstraints()
        return anchors
    }
    
    @discardableResult
    func size(
        _ size: CGSize
    ) -> Anchors {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchors = Anchors()
        
        anchors.width = widthAnchor.constraint(equalToConstant: size.width)
        anchors.height = heightAnchor.constraint(equalToConstant: size.height)
        
        anchors.activateConstraints()
        return anchors
    }
    
}
