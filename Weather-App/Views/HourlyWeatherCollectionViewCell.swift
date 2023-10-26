//
//  HourlyWeatherCollectionViewCell.swift
//  Weather-App
//
//  Created by Dhananjay Chhabra on 26/10/23.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "HourlyWeatherCollectionViewCell"
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var logo: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: HourlyWeatherDataModel){
        let colorsConfig = UIImage.SymbolConfiguration(paletteColors: data.palletColors)
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        
        timeLabel.text = data.time
        logo.image = UIImage(systemName: data.logo, withConfiguration: colorsConfig.applying(sizeConfig))
        temperatureLabel.text = data.temperature
    }
    
    func setUpView(){
        contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        contentView.addSubview(logo)
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 30),
            logo.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        contentView.addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 5),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
