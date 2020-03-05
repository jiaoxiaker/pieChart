//
//  ViewController.swift
//  sectorDiagram
//
//  Created by justforYOU on 2020/3/4.
//  Copyright © 2020 jiaoxiaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectorDiagramView = SectorDiagramView.init(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        self.view.addSubview(sectorDiagramView)
        
        // 饼状图 or 空心圆
        sectorDiagramView.style = .CLCircleStyleFill
        //设置为空心圆时线的宽度
        sectorDiagramView.lineWidth = 10
        //每一块对应的颜色
        sectorDiagramView.colorList = [.orange, .systemBlue, .systemPink, .systemGreen]
        //每一块饼开始点的坐标
        sectorDiagramView.StartPointList = [0, CGFloat(M_PI*1/3), CGFloat(M_PI*2/3), CGFloat(M_PI*3/2)]
    }


}

