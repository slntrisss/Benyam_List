//
//  ProgressCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 27.10.2022.
//

import UIKit
import Charts

class ProgressCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var progressType: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    
    var statistics: Statictics?
    
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: CGFloat(54) / 255.0, green: CGFloat(61) / 255.0, blue: CGFloat(232) / 255.0, alpha: CGFloat(1.0)).cgColor,
            UIColor(red: CGFloat(98) / 255.0, green: CGFloat(127) / 255.0, blue: CGFloat(240) / 255.0, alpha: CGFloat(1.0)).cgColor,
            UIColor(red: CGFloat(223) / 255.0, green: CGFloat(31) / 255.0, blue: CGFloat(251) / 255.0, alpha: CGFloat(1.0)).cgColor,
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        return gradientLayer
    }()
    
    static let identifier = "ProgressCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.insertSublayer(self.gradient, at: 0)
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ProgressCell",
                     bundle: nil)
    }
    
    func configure(statictics: Statictics){
        title.text = "Keep it up!"
        subtitle.text = "Your current progress"
        progressType.text = statictics.type.rawValue
        self.statistics = statictics
        setupPieChartView()
    }
    
    
    //MARK: - Pie Chart
    private func setupPieChartView(){
        guard let statistics = statistics else {
            return
        }
        let leftTasks = statistics.totalNumberOfTasks - statistics.completedNumberOfTasks
        chartView.chartDescription.enabled = false
        chartView.rotationAngle = -135
        chartView.rotationEnabled = false
        chartView.isUserInteractionEnabled = false
        chartView.legend.enabled = false
        chartView.transparentCircleRadiusPercent = 0
        chartView.holeRadiusPercent = 0.9
        var entries: [PieChartDataEntry] = []
        entries.append(PieChartDataEntry(value: Double(leftTasks)))
        entries.append(PieChartDataEntry(value: Double(statistics.completedNumberOfTasks)))
        chartView.centerAttributedText = createCenteredPieChartText()
        
        let dataset = PieChartDataSet(entries: entries)
        dataset.drawValuesEnabled = false
        dataset.colors = [
            NSUIColor(red: CGFloat(214) / 255.0, green: CGFloat(214) / 255.0, blue: CGFloat(214) / 255.0, alpha: CGFloat(1.0)),
            NSUIColor(red: CGFloat(48) / 255.0, green: CGFloat(229) / 255.0, blue: CGFloat(98) / 255.0, alpha: CGFloat(1))
        ]
        
        chartView.data = PieChartData(dataSet: dataset)
    }
    
    private func createCenteredPieChartText() -> NSMutableAttributedString {
        let percentage = getPercentage(val1: Double(statistics!.totalNumberOfTasks), val2: Double(statistics!.completedNumberOfTasks))
        let percentageStr = String(format: "%.f", percentage)
        
        //percentage
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes1: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor(red: CGFloat(38) / 255.0, green: CGFloat(196.0) / 255.0, blue: CGFloat(75.0) / 255.0, alpha: CGFloat(1.0)),
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold)
            ]
        let progressLabel = NSMutableAttributedString(string: percentageStr, attributes: attributes1)
        
        let percentLabel = "%"
        let attributes2: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor(red: CGFloat(38) / 255.0, green: CGFloat(196.0) / 255.0, blue: CGFloat(75.0) / 255.0, alpha: CGFloat(1.0)),
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
            ]
        let percentIcon = NSMutableAttributedString(string: percentLabel, attributes: attributes2)
        progressLabel.append(percentIcon)
        
        
        return progressLabel
    }
    
    private func getPercentage(val1:Double, val2:Double) -> Double{
        return (val2 * 100) / val1;
    }
}
