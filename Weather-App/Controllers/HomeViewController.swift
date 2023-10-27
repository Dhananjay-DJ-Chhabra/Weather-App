//
//  ViewController.swift
//  Weather-App
//
//  Created by Dhananjay Chhabra on 26/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var hourlyWeatherCollectionView: UICollectionView?
    
    let fifteenDaysView = UIView()
    
    var weatherCardDetailsCollectionView: UICollectionView?
    
    let sunsetSunriseView = UIImageView()
    
    let homeViewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tikri"
        view.backgroundColor = UIColor(hex: "#DFE3E6")
        
        setUpNavigationBar()
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        setUpHourlyCollectionview()
        setUpFifteenDaysView()
        setUpWeatherDetailsView()
        setUpSunriseSunsetView()
        
        scrollView.contentSize = containerView.bounds.size
    }
    
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        var hamburgerLogo = UIImage(named: "hamburger")?.resizeTo(size: CGSize(width: 25, height: 25))
        hamburgerLogo = hamburgerLogo?.withRenderingMode(.alwaysOriginal)
        
        var toolbarLogo = UIImage(named: "toolbar")?.resizeTo(size: CGSize(width: 25, height: 25))
        toolbarLogo = toolbarLogo?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: hamburgerLogo, style: .done, target: self, action: #selector(hamburgerMenuAction)),
            UIBarButtonItem(image: toolbarLogo, style: .done, target: self, action: #selector(toolbarButtonAction))
        ]
    }
    
    @objc func hamburgerMenuAction(){}
    
    @objc func toolbarButtonAction(){}


}


// MARK:  Collection View Delegate and Data Source Methods
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == hourlyWeatherCollectionView{
            return homeViewModel.hourlyWeatherData.count
        }else if collectionView == weatherCardDetailsCollectionView {
            return homeViewModel.weatherDetailsCards.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == hourlyWeatherCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.identifier, for: indexPath) as? HourlyWeatherCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCell(data: homeViewModel.hourlyWeatherData[indexPath.item])
            return cell
        }else if collectionView == weatherCardDetailsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailsCardViewCell.identifier, for: indexPath) as? WeatherDetailsCardViewCell else { return UICollectionViewCell()}
            cell.configureView(data: homeViewModel.weatherDetailsCards[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

// MARK: Sunrise - Sunset View
extension HomeViewController{
    
    func setUpSunriseSunsetView(){
        sunsetSunriseView.backgroundColor = UIColor(hex: "#E7EBEE")
        sunsetSunriseView.layer.cornerRadius = 20
        sunsetSunriseView.contentMode = .scaleAspectFit
        sunsetSunriseView.image = UIImage(named: "sunrise-sunset")
        sunsetSunriseView.addShadow(color: .black, opacity: 0.1, offset: CGSize(width: 0, height: 1), radius: 1)
        
        sunsetSunriseView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sunsetSunriseView)
        guard let weatherCardDetailsCollectionView = weatherCardDetailsCollectionView else { return }
        NSLayoutConstraint.activate([
            sunsetSunriseView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            sunsetSunriseView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            sunsetSunriseView.topAnchor.constraint(equalTo: weatherCardDetailsCollectionView.bottomAnchor),
            sunsetSunriseView.heightAnchor.constraint(equalToConstant: 180),
            sunsetSunriseView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        let sunriseImageView = UIImageView()
        sunriseImageView.image = UIImage(systemName: "sunrise")
        sunriseImageView.image = sunriseImageView.image?.withRenderingMode(.alwaysTemplate)
        sunriseImageView.tintColor = .black
        sunriseImageView.clipsToBounds = true
        sunriseImageView.contentMode = .scaleAspectFit
        let sunsetImageView = UIImageView()
        sunsetImageView.image = UIImage(systemName: "sunset")
        sunsetImageView.image = sunsetImageView.image?.withRenderingMode(.alwaysTemplate)
        sunsetImageView.tintColor = .black
        sunsetImageView.clipsToBounds = true
        sunsetImageView.contentMode = .scaleAspectFit
        
        sunriseImageView.translatesAutoresizingMaskIntoConstraints = false
        sunsetSunriseView.addSubview(sunriseImageView)
        NSLayoutConstraint.activate([
            sunriseImageView.leadingAnchor.constraint(equalTo: sunsetSunriseView.leadingAnchor, constant: 20),
            sunriseImageView.topAnchor.constraint(equalTo: sunsetSunriseView.topAnchor, constant: 20),
            sunriseImageView.heightAnchor.constraint(equalToConstant: 30),
            sunriseImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        sunsetImageView.translatesAutoresizingMaskIntoConstraints = false
        sunsetSunriseView.addSubview(sunsetImageView)
        NSLayoutConstraint.activate([
            sunsetImageView.trailingAnchor.constraint(equalTo: sunsetSunriseView.trailingAnchor, constant: -20),
            sunsetImageView.topAnchor.constraint(equalTo: sunsetSunriseView.topAnchor, constant: 20),
            sunsetImageView.heightAnchor.constraint(equalToConstant: 30),
            sunsetImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        let sunriseTimeLabel = UILabel()
        sunriseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        sunriseTimeLabel.text = "07:12"
        sunriseTimeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        let sunriseLabel = UILabel()
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        sunriseLabel.text = "Sunrise"
        sunriseLabel.textColor = .gray
        sunriseLabel.font = .systemFont(ofSize: 14)
        
        let sunsetTimeLabel = UILabel()
        sunsetTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        sunsetTimeLabel.text = "17:33"
        sunsetTimeLabel.textAlignment = .right
        sunsetTimeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        let sunsetLabel = UILabel()
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        sunsetLabel.text = "Sunset"
        sunsetLabel.textColor = .gray
        sunsetLabel.font = .systemFont(ofSize: 14)
        sunsetLabel.textAlignment = .right
        
        sunsetSunriseView.addSubview(sunriseTimeLabel)
        NSLayoutConstraint.activate([
            sunriseTimeLabel.leadingAnchor.constraint(equalTo: sunsetSunriseView.leadingAnchor, constant: 20),
            sunriseTimeLabel.bottomAnchor.constraint(equalTo: sunsetSunriseView.bottomAnchor, constant: -20)
        ])
        
        sunsetSunriseView.addSubview(sunriseLabel)
        NSLayoutConstraint.activate([
            sunriseLabel.leadingAnchor.constraint(equalTo: sunsetSunriseView.leadingAnchor, constant: 20),
            sunriseLabel.bottomAnchor.constraint(equalTo: sunriseTimeLabel.topAnchor, constant: -10)
        ])
        
        sunsetSunriseView.addSubview(sunsetTimeLabel)
        NSLayoutConstraint.activate([
            sunsetTimeLabel.trailingAnchor.constraint(equalTo: sunsetSunriseView.trailingAnchor, constant: -20),
            sunsetTimeLabel.bottomAnchor.constraint(equalTo: sunsetSunriseView.bottomAnchor, constant: -20)
        ])
        
        sunsetSunriseView.addSubview(sunsetLabel)
        NSLayoutConstraint.activate([
            sunsetLabel.trailingAnchor.constraint(equalTo: sunsetSunriseView.trailingAnchor, constant: -20),
            sunsetLabel.bottomAnchor.constraint(equalTo: sunriseTimeLabel.topAnchor, constant: -10)
        ])
    }
    
}

// MARK: Weather Details Card View
extension HomeViewController{
    
    func setUpWeatherDetailsView(){
        let weatherDetailasTitleLabel = UILabel()
        weatherDetailasTitleLabel.text = "Weather details"
        weatherDetailasTitleLabel.textColor = .gray
        weatherDetailasTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(weatherDetailasTitleLabel)
        NSLayoutConstraint.activate([
            weatherDetailasTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            weatherDetailasTitleLabel.topAnchor.constraint(equalTo: fifteenDaysView.bottomAnchor, constant: 30),
            weatherDetailasTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(
            width: UIDevice.current.userInterfaceIdiom == .pad ? (view.bounds.width - 60) / 3 : (view.bounds.width - 50) / 2,
            height: 160)
        layout.minimumInteritemSpacing = UIDevice.current.userInterfaceIdiom == .pad ? 8 : 10
        weatherCardDetailsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let weatherCardDetailsCollectionView = weatherCardDetailsCollectionView else { return }
        
        weatherCardDetailsCollectionView.register(WeatherDetailsCardViewCell.self, forCellWithReuseIdentifier: WeatherDetailsCardViewCell.identifier)
        weatherCardDetailsCollectionView.dataSource = self
        weatherCardDetailsCollectionView.delegate = self
        weatherCardDetailsCollectionView.backgroundColor = .clear
        
        weatherCardDetailsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(weatherCardDetailsCollectionView)
        
        let iPadHeight: CGFloat = (160 + 10) * (6 / 3) // (card height + card vertical padding) * (cell count / cells per row)
        let iPhoneHeight: CGFloat = (160 + 10) * (6 / 2)
        let collectionViewHeight: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? iPadHeight : iPhoneHeight
        
        NSLayoutConstraint.activate([
            weatherCardDetailsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            weatherCardDetailsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            weatherCardDetailsCollectionView.topAnchor.constraint(equalTo: weatherDetailasTitleLabel.bottomAnchor, constant: 10),
            weatherCardDetailsCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
        ])
    }
    
}

// MARK: Fifteen Days Weather Details View
extension HomeViewController{
    
    func setUpFifteenDaysView(){
        fifteenDaysView.layer.cornerRadius = 20
        fifteenDaysView.backgroundColor = UIColor(hex: "#EFF3F6")
        fifteenDaysView.addShadow(color: .black, opacity: 0.1, offset: CGSize(width: 0, height: 1), radius: 1)
        
        guard let hourlyWeatherCollectionView = hourlyWeatherCollectionView else { return }
        
        fifteenDaysView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(fifteenDaysView)
        NSLayoutConstraint.activate([
            fifteenDaysView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            fifteenDaysView.topAnchor.constraint(equalTo: hourlyWeatherCollectionView.bottomAnchor, constant: 30),
            fifteenDaysView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        let weatherCellsConatiner = UIView()
        weatherCellsConatiner.translatesAutoresizingMaskIntoConstraints = false
        fifteenDaysView.addSubview(weatherCellsConatiner)
        NSLayoutConstraint.activate([
            weatherCellsConatiner.leadingAnchor.constraint(equalTo: fifteenDaysView.leadingAnchor, constant: 10),
            weatherCellsConatiner.topAnchor.constraint(equalTo: fifteenDaysView.topAnchor, constant: 10),
            weatherCellsConatiner.trailingAnchor.constraint(equalTo: fifteenDaysView.trailingAnchor, constant: -10),
        ])
        
        var topConstant: CGFloat = 0
        for i in 0..<7{
            let weatherCell = FifteenDaysWeatherViewCell(frame: .zero)
            weatherCell.confureView(data: homeViewModel.fifteenDaysWeatherForecast[i])
            weatherCell.translatesAutoresizingMaskIntoConstraints = false
            weatherCellsConatiner.addSubview(weatherCell)
            NSLayoutConstraint.activate([
                weatherCell.topAnchor.constraint(equalTo: weatherCellsConatiner.topAnchor, constant: topConstant),
                weatherCell.leadingAnchor.constraint(equalTo: weatherCellsConatiner.leadingAnchor, constant: 10),
                weatherCell.trailingAnchor.constraint(equalTo: weatherCellsConatiner.trailingAnchor, constant: -10),
                weatherCell.heightAnchor.constraint(equalToConstant: 30)
            ])
            if i == 6 {
                weatherCell.bottomAnchor.constraint(equalTo: weatherCellsConatiner.bottomAnchor, constant: -10).isActive = true
            }
            topConstant += 40
        }
        
        let lineSeperator = UIView()
        lineSeperator.backgroundColor = .systemGray4
        lineSeperator.translatesAutoresizingMaskIntoConstraints = false
        fifteenDaysView.addSubview(lineSeperator)
        NSLayoutConstraint.activate([
            lineSeperator.leadingAnchor.constraint(equalTo: fifteenDaysView.leadingAnchor, constant: 30),
            lineSeperator.trailingAnchor.constraint(equalTo: fifteenDaysView.trailingAnchor, constant: -30),
            lineSeperator.topAnchor.constraint(equalTo: weatherCellsConatiner.bottomAnchor, constant: 10),
            lineSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        let fifteenDaysButton = UIButton()
        fifteenDaysButton.setTitle("15-day weather forecast", for: .normal)
        fifteenDaysButton.setTitleColor(.black, for: .normal)
        fifteenDaysButton.translatesAutoresizingMaskIntoConstraints = false
        fifteenDaysView.addSubview(fifteenDaysButton)
        NSLayoutConstraint.activate([
            fifteenDaysButton.topAnchor.constraint(equalTo: lineSeperator.bottomAnchor, constant: 15),
            fifteenDaysButton.centerXAnchor.constraint(equalTo: lineSeperator.centerXAnchor),
            fifteenDaysButton.bottomAnchor.constraint(equalTo: fifteenDaysView.bottomAnchor, constant: -15)
        ])
        
    }
    
}

// MARK: Hourly Weather Details Collection View
extension HomeViewController{
    
    func setUpHourlyCollectionview(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.bounds.width/6, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        hourlyWeatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let hourlyWeatherCollectionView = hourlyWeatherCollectionView else { return }
        
        hourlyWeatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        hourlyWeatherCollectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.identifier)
        hourlyWeatherCollectionView.backgroundColor = UIColor(hex: "#DFE3E6")
        
        
        hourlyWeatherCollectionView.dataSource = self
        hourlyWeatherCollectionView.delegate = self
        
        containerView.addSubview(hourlyWeatherCollectionView)
        NSLayoutConstraint.activate([
            hourlyWeatherCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hourlyWeatherCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            hourlyWeatherCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            hourlyWeatherCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
