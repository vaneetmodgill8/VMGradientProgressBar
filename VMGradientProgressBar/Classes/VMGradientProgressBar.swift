//
//  VMGradientProgressBar.swift
//  VMGradientProgressBar
//
//  Created by Vaneet Modgill on 13/12/19.
//  Copyright © 2019 vaneetmodgill@gmail.com. All rights reserved.
//

import UIKit

@IBDesignable open class VMGradientProgressBar: UIView {
    
    private weak var progressView : UIView!
    private var gradientLayer : CAGradientLayer?
    private var percentageLabel : UILabel!
    private var progressConstraints = [NSLayoutConstraint]()

    
    //MARK: - INSPECTABLE VARIABLES
    @IBInspectable open var roundedCorners : Bool = true {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable open var isShowPercentageLabel : Bool = false {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable open var isGradientProgress : Bool = false {
         didSet {
             self.updateUI()
         }
     }
    
    @IBInspectable open var spacing : CGFloat = 0 {
        didSet {
            self.spacing = max(0, spacing)
            self.updateUI()
        }
    }
    
    @IBInspectable open var outlineWidth : CGFloat = 0 {
        didSet {
            self.outlineWidth = max(0, outlineWidth)
            self.updateUI()
        }
    }
    
    @IBInspectable open var outlineColor : UIColor = .white {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable open var percentageLabelColor : UIColor = .black {
         didSet {
             self.updateUI()
         }
     }
    
    
    public var gradientColors: [CGColor] = [UIColor.green.cgColor,UIColor.blue.cgColor]{
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable open var progressColor : UIColor = .white {
        didSet {
            self.updateUI()
        }
    }
    
    /**
     Sets the value of the progress bar in a range of 0.0 to 1.0.
     */
    @IBInspectable open var value : CGFloat = 0 {
        didSet {
            self.value = max(0, min(value, 1))
            self.updateUI()
        }
    }
    
    //MARK: - INITIALIZERS
    init() {
        fatalError("Should call init(frame:) or init(coder:)")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    //
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.updateUI()
    }
    
    internal func commonInit() {
        self.addProgress()
        self.updateUI()
    }
    
    private func addProgress() {
        let progress = UIView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = self.progressColor
        self.addSubview(progress)
        self.progressView = progress
    }
    
    private func addPercentageLabel() {
        if percentageLabel != nil {
            percentageLabel.removeFromSuperview()
        }
        if !isShowPercentageLabel { return }
        let percentage:Double = Double(value * 100).rounded(toPlaces: 2)
        let progressWidth = self.progressView.frame.width
        let percentageLabel = UILabel(frame: CGRect(x: (percentage<90.0 ?  (progressWidth + 8) : (progressWidth - 70)) , y: self.progressView.frame.origin.y, width: 60, height: self.progressView.frame.height))
        percentageLabel.textAlignment = percentage<90.0 ? .left : .right
        percentageLabel.textColor = percentage<90.0 ? percentageLabelColor : .white
        percentageLabel.font = UIDevice.current.userInterfaceIdiom == .pad ?  UIFont.systemFont(ofSize: 18, weight: .semibold) : UIFont.systemFont(ofSize: 12, weight: .semibold)
        percentageLabel.text = "\(percentage)%"
        self.addSubview(percentageLabel)
        self.percentageLabel = percentageLabel
    }
    

    private func updateUI() {
        setupProgressBarView()
        if isGradientProgress {
            self.createGradientLayer()
        } else {
          self.progressView.backgroundColor = self.progressColor
        }
        self.addPercentageLabel()
    }
    
    private func setupProgressBarView(){
        self.setupProgressViewConstraints()
        self.layer.cornerRadius = self.roundedCorners ? self.frame.height / 2 : 0
        self.progressView.layer.cornerRadius = self.roundedCorners ? self.progressView.frame.height / 2 : 0
        self.layer.borderWidth = self.outlineWidth
        self.layer.borderColor = self.outlineColor.cgColor
    }
    
    private func setupProgressViewConstraints(){
        self.removeConstraints(self.progressConstraints)
        self.progressConstraints = [
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.outlineWidth + self.spacing),
            self.progressView.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: self.value, constant: -(self.outlineWidth * 2 + self.spacing * 2)),
            self.progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.outlineWidth + self.spacing),
            self.progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(self.outlineWidth + self.spacing))
        ]
        NSLayoutConstraint.activate(progressConstraints)
    }
    
    private func createGradientLayer() {
          gradientLayer = nil
          gradientLayer = CAGradientLayer()
          gradientLayer?.frame = self.progressView.bounds
          gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.5)
          gradientLayer?.endPoint = CGPoint(x: 1.0, y: 0.5)
          gradientLayer?.colors = gradientColors
          gradientLayer?.cornerRadius = self.roundedCorners ? self.progressView.frame.height / 2 : 0
          self.progressView.layer.addSublayer(gradientLayer!)
      }
    

    
}

