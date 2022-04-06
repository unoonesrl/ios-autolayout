//
//  Anchors.swift
//  
//
//  Created by Tiziano Cialfi on 06/04/22.
//

import UIKit

public class Anchors {
    var top: NSLayoutConstraint?
    var bottom: NSLayoutConstraint?
    var leading: NSLayoutConstraint?
    var trailing: NSLayoutConstraint?
    var width: NSLayoutConstraint?
    var height: NSLayoutConstraint?
    var centerX: NSLayoutConstraint?
    var centerY: NSLayoutConstraint?
    
    func activateConstraints() {
        top?.isActive = true
        bottom?.isActive = true
        leading?.isActive = true
        trailing?.isActive = true
        width?.isActive = true
        height?.isActive = true
        centerX?.isActive = true
        centerY?.isActive = true
    }
    
    func deactivateConstraints() {
        top?.isActive = false
        bottom?.isActive = false
        leading?.isActive = false
        trailing?.isActive = false
        width?.isActive = false
        height?.isActive = false
        centerX?.isActive = false
        centerY?.isActive = false
    }
}
