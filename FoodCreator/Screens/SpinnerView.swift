//
//  SpinnerView.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//
import UIKit

final class SpinnerView: UIView {
    private lazy var messageLabel = UILabel(
        font: .bodyOne,
        color: .darkBlue,
        alignment: .center)
    
    private lazy var shapeLayer: CAShapeLayer = CAShapeLayer(
        strokeColor: .darkBlue,
        fillColor: .clear,
        lineWidth: 5
    )
    
    private lazy var strokeAnimation = CABasicAnimation(
        keypath: "strokeEnd",
        toValue: 0.8,
        duration: 1,
        fillMode: .forwards,
        removedOnCompletion: false,
        timingFunction: CAMediaTimingFunction(name: .easeInEaseOut))
    
    private lazy var rotationAnimation = CABasicAnimation(
        keypath: "transform.rotation",
        toValue: .pi * 2,
        duration: 2,
        repeatCount: .infinity)
    
    private func setupUI() {
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        //position layer
        shapeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY - 40)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
    }
    
    private var circularPath: UIBezierPath = UIBezierPath(
        arcCenter: .zero,
        radius: 40,
        startAngle: .zero,
        endAngle: .pi * 2,
        clockwise: true)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    public func startSpinningAnimation(_ message: String) {
        shapeLayer.add(strokeAnimation, forKey: "strokeAnimation")
        shapeLayer.add(rotationAnimation, forKey: "rotationAnimation")
        guard !message.isEmpty else { 
            messageLabel.isHidden = true
            return }
        messageLabel.isHidden = false
        messageLabel.text = message
    }
    
    public func removeSpinningAnimation() {
        shapeLayer.removeAnimation(forKey: "strokeAnimation")
        shapeLayer.removeAnimation(forKey: "rotationAnimation")
        shapeLayer.removeAllAnimations()
    }
    
}
