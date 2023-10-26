//
//  WeatherDetailsCardView.swift
//  Weather-App
//
//  Created by Dhananjay Chhabra on 26/10/23.
//

import UIKit

class WeatherDetailsCardViewCell: UICollectionViewCell {
    
    static let identifier = "WeatherDetailsCardViewCell"
    
    let parameterLogo: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    let parameterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let parameterValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let parameterUnitsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = UIColor(hex: "#E7EBEE")
        contentView.addShadow(color: .black, opacity: 0.1, offset: CGSize(width: 0, height: 1), radius: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(data: WeatherDetailsCardDataModel){
        let colorsConfig = UIImage.SymbolConfiguration(paletteColors: data.palletColors)
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        
        parameterLogo.image = UIImage(systemName: data.logo, withConfiguration: colorsConfig.applying(sizeConfig))
        parameterLabel.text = data.parameter
        parameterValueLabel.text = data.value
        parameterUnitsLabel.text = data.units
        
        
        parameterValueLabel.widthAnchor.constraint(equalToConstant: parameterValueLabel.intrinsicContentSize.width).isActive = true
    }
    
    func setUpView(){
        contentView.addSubview(parameterLogo)
        NSLayoutConstraint.activate([
            parameterLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            parameterLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            parameterLogo.heightAnchor.constraint(equalToConstant: 50),
            parameterLogo.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(parameterLabel)
        NSLayoutConstraint.activate([
            parameterLabel.leadingAnchor.constraint(equalTo: parameterLogo.leadingAnchor),
            parameterLabel.topAnchor.constraint(equalTo: parameterLogo.bottomAnchor, constant: 10),
            parameterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.addSubview(parameterValueLabel)
        NSLayoutConstraint.activate([
            parameterValueLabel.leadingAnchor.constraint(equalTo: parameterLabel.leadingAnchor),
            parameterValueLabel.topAnchor.constraint(equalTo: parameterLabel.bottomAnchor),
            parameterValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        contentView.addSubview(parameterUnitsLabel)
        NSLayoutConstraint.activate([
            parameterUnitsLabel.leadingAnchor.constraint(equalTo: parameterValueLabel.trailingAnchor, constant: 5),
            parameterUnitsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            parameterUnitsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

}
