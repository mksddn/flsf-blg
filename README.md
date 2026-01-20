# Блог по философии (на Jekyll)

![preview](https://user-images.githubusercontent.com/22976310/219026967-24e3cc0c-88fb-4022-8e89-b36d342d756a.gif)

### [LIVE DEMO](https://flsf.maxdudin.ru/)

- Генератор статических сайтов `Jekyll`.
- CI/CD FTP Deploy.

> Inspired by [agragregra](https://webdesign-master.ru/blog/html-css/create-parallax-mouse-website.html)


## Установка и запуск

1. Установите Ruby 3.3 через rbenv:
   ```bash
   brew install rbenv ruby-build
   echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
   source ~/.zshrc
   rbenv install 3.3.6
   rbenv local 3.3.6
   ```

2. Установите зависимости:
   ```bash
   gem install bundler
   bundle install
   ```

3. Запустите локальный сервер:
   ```bash
   bundle exec jekyll serve
   ```

4. Откройте в браузере: http://localhost:4000

5. Для сборки сайта:
   ```bash
   bundle exec jekyll build
   ```