//
//  FifteenDaysWeatherView.swift
//  Weather-App
//
//  Created by Dhananjay Chhabra on 26/10/23.
//

import UIKit

class FifteenDaysWeatherViewCell: UIView {
    
    var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var weatherView = WeatherView()
    
    var temperatureUpDownLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confureView(data: FifteenDaysWeatherDataModel){
        dayLabel.text = data.day
        temperatureUpDownLabel.text = data.temperatureRange
        weatherView.configureView(data: data)
        
    }
    
    func setUpView(){
        addSubview(stackView)
        stackView.bounds = self.frame
        
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(weatherView)
        stackView.addArrangedSubview(temperatureUpDownLabel)
    }

}

class WeatherView: UIView{
    var logo: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var weatherLabel: UILabel = {
        let label = UILabel()
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
    
    func configureView(data: FifteenDaysWeatherDataModel){
        let colorsConfig = UIImage.SymbolConfiguration(paletteColors: data.palletColors)
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        
        weatherLabel.text = data.weather
        logo.image = UIImage(systemName: data.logo, withConfiguration: colorsConfig.applying(sizeConfig))
    }
    
    func setUpView(){
        addSubview(logo)
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: leadingAnchor),
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.heightAnchor.constraint(equalToConstant: 30),
            logo.widthAnchor.constraint(equalToConstant: 30),
            logo.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(weatherLabel)
        NSLayoutConstraint.activate([
            weatherLabel.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 5),
            weatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherLabel.centerYAnchor.constraint(equalTo: logo.centerYAnchor)
        ])
    }
}
