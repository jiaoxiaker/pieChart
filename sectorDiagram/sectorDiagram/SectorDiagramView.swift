//
//  SectorDiagramView.swift
//  sectorDiagram
//
//  Created by justforYOU on 2020/3/4.
//  Copyright © 2020 jiaoxiaker. All rights reserved.
//

import UIKit

enum CLCircleStyle {
    case CLCircleStyleDefault //默认是空心圆
    case CLCircleStyleFill // 饼状图
}

class SectorDiagramView: UIView {
    
    // MARK: - 定义属性
    /**
                    ^ 3*PI/2
                    ^
    *  开始点的坐标   |
                    |
                    |
       M_PI         |
       ---------------------------> 0 (M_PI*2)
                    |
                    |
                    |
                    |
                    |
                    |M_PI_2
    
    */
    var StartPointList = [CGFloat]()
    /** *  对应的颜色  */
    var colorList = [UIColor]()
    /** * 设置是饼状图还是空心圆  */
    var style : CLCircleStyle = .CLCircleStyleDefault
    /** *  当为空心形状的图形时  设置linewidth的宽度  linewidth默认是35；  */
    var lineWidth : CGFloat = 35
    
    // MARK: - 自定义构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        initConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 系统函数
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.frame.size.width / 2,y: self.frame.size.height / 2), radius: (self.frame.size.width - self.lineWidth) / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        self.addPath(path: path)
        path.stroke()
        
        if self.StartPointList.count != 0 {
            for i in 0...self.StartPointList.count - 2 {
                let bezierPath = UIBezierPath()
                bezierPath.addArc(withCenter: CGPoint(x: self.frame.size.width / 2,y: self.frame.size.height / 2), radius: (self.frame.size.width - self.lineWidth) / 2, startAngle: self.StartPointList[i], endAngle: self.StartPointList[i + 1], clockwise: true)
                let shapeLayer = CAShapeLayer()
                shapeLayer.frame = self.frame
                shapeLayer.position = CGPoint(x: self.frame.size.width / 2,y: self.frame.size.height / 2)
                shapeLayer.path = bezierPath.cgPath
                self.addShapeLayer(shapeLayer: shapeLayer, bezierpath: bezierPath, color: self.colorList[i])
                self.layer.addSublayer(shapeLayer)
            }
        }
    }
    
}

// MARK: - 初始化配置
extension SectorDiagramView {
    func initConfiguration() {
        backgroundColor = .yellow
    }
}

// MARK: - 其他
extension SectorDiagramView {
    func addShapeLayer(shapeLayer: CAShapeLayer, bezierpath: UIBezierPath, color: UIColor) {
        switch self.style {
        case .CLCircleStyleFill:
            bezierpath.addLine(to: CGPoint(x: self.frame.size.width / 2,y: self.frame.size.height / 2))
            bezierpath.close()
            color.setFill()
            bezierpath.fill()
            shapeLayer.fillColor = color.cgColor
        case .CLCircleStyleDefault:
            bezierpath.lineWidth = self.lineWidth
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = self.lineWidth
            shapeLayer.strokeColor = color.cgColor
        default:
            break
        }
    }
    
    func addPath(path: UIBezierPath) {
        let color = self.colorList[self.colorList.count - 1]
        switch self.style {
        case .CLCircleStyleFill:
            path.close()
            color.setFill()
            path.fill()
        case .CLCircleStyleDefault:
            path.lineWidth = self.lineWidth
            color.setStroke()
        default: break
        }
    }
}
