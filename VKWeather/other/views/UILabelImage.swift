//
//  UILabelImage.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final class UILabelImage
    : UILabel {
    
    private final let mImageAttachment:
        NSTextAttachment
    
    public var leftImage: UIImage? {
        didSet {
            mImageAttachment.image = leftImage
        }
    }
    
    override init(
        frame: CGRect
    ) {
        mImageAttachment = NSTextAttachment()
        super.init(
            frame: frame
        )
    }
    
    required init?(
        coder: NSCoder
    ) {
        mImageAttachment = NSTextAttachment()
        super.init(
            coder: coder
        )
    }
    
    public final func renderImageText() {
        
        guard let text = text else {
            return
        }
        
        let attrMain = NSMutableAttributedString(
            string: " \(text)"
        )
        
        let attrImage = NSMutableAttributedString(
            attachment: mImageAttachment
        )
        
        let textRange = NSRange(
            location: 0,
            length: attrMain.length
        )
        
        attrMain.addAttribute(
            .foregroundColor,
            value: textColor,
            range: textRange
        )
        
        attrMain.addAttribute(
            .font,
            value: font,
            range: textRange
        )
        
        attrImage.append(
            attrMain
        )
        
        attributedText = attrImage
    }
    
}
