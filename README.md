# pieChart
饼状图 pie chart  

<img src="https://github.com/jiaoxiaker/pieChart/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-05%20at%2016.54.08.png" width="100" alt="饼状图"> 

1.实例化  

let sectorDiagramView = SectorDiagramView.init(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        self.view.addSubview(sectorDiagramView)

2.设置类型： 饼状图 or 空心圆，默认是空心圆CLCircleStyleDefault

sectorDiagramView.style = .CLCircleStyleFill

3.空心圆时，设置线的宽度（默认35）

sectorDiagramView.lineWidth = 10

4.设置每一块对应的颜色

sectorDiagramView.colorList = [.orange, .systemBlue, .systemPink, .systemGreen]

5.设置每一块饼开始点的坐标

sectorDiagramView.StartPointList = [0, CGFloat(M_PI*1/3), CGFloat(M_PI*2/3), CGFloat(M_PI*3/2)]
