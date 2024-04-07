# VKWeather

Simple app with OpenWeatherAPI

![111](https://github.com/GoodDamn/VKWeather/assets/76108467/39d6fb31-6073-4d8c-b86a-cbe824bf396b) ![222](https://github.com/GoodDamn/VKWeather/assets/76108467/757ccde9-348a-48b3-b19b-8a9701750d91) ![333](https://github.com/GoodDamn/VKWeather/assets/76108467/d477ee0e-effa-44bb-85bf-71f62e39269e) ![444](https://github.com/GoodDamn/VKWeather/assets/76108467/dc298b53-d6e9-4f27-83b1-7239e2b1a777)

Всё реализовано в рамках бесплатного тарифного плана OpenWeatherAPI

Особенности:
* Информация о погоде в данный момент
* Прогноз погоды на 5 дней с 3-часовым интервалом в сутки
* Информация о погоде в определённом городе

Реализация доп. фичей:
1) Прогноз на 5 дней:
* * Реализовано с помощью кастомного UITableView, где вложены UICollectionView в UITableViewCell
  * Для каждого UITableViewCell и UICollectionViewCell есть своя модель представления (ViewModel), а также свой реализованный класс UITableViewCellDay и UICollectionViewCellWeather соответственно
2) Информация о погоде в определённом городе
* * Реализовано через MKLocalSearch из MapKit
  * Отображает информацию о погоде в выбранном городе из предложенных результатов в UITableView
 
3) Кэширование
* * При первом запуске кэширует в json файл, а при повторном запуске загружает информацию из кэша и отображает её.
  * Всё это происходит до запроса к API

