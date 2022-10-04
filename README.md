# Afternoon film
Console app for films recommendation.

## About
The app parses the [IMDb Top 250 wikipedia page](https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb 'IMDb Top 250') and show 10 random directors to choose. After choose one, the app will offer a film by that director. Enjoy watching.

## Before run
To start the app, make sure you have installed [ruby](https://www.ruby-lang.org/en/documentation/installation/ 'ruby install guide') и [git](https://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Git 'git install guide').

Also you should have installed bundler:
```
gem install bundler
```

## Run instruction
1. Clone the repository to your local computer by typing in the terminal:
```
git clone https://github.com/dasmodal/afternoon_film.git
```
2. Open directory with the app:
```
cd afternoon_film
```
3. Run bundler for install gems dependencies:
```
bundle
```
4. Finally, you can run the app:
```
bundle exec ruby main.rb
```
### App work process

[![afternoon_film_app_process.gif](https://s4.gifyu.com/images/afternoon_film_app_process.gif)](https://gifyu.com/image/S3yzX)

## Tests
This app has rspec tests and if you want to test the app:
```
bundle exec rspec -fd
```