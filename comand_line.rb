1. Вход
  login: логин
  password: пароль

2. Зарегистрироваться
  name: И
  lastname: Ф
  fadername: О
  phone: Номер телефона
  email: Почтовый
  address: Адрес
  city: Город
  password: Пароль (уникальным логином) (hash)
  file: запрашивается скан документа ((pdf \ image)
  credentials: Регистрационный статус

3. Авторизацию через VK
  name: lastname: fadername: phone: email: address: city: password:

4. Админ панель (:credentials)
  real_time: Пользователи добавляется в реальном времени.


Pages:
  index регистрация и авторизация
  page_1: “Ваша заявка на регистрацию находится на рассмотрении у модератора”
  page_2: “Спасибо, %username%,, Ваша заявка на регистрацию успешно подтверждена модератором, добро пожаловать!”
  page_3: “К сожалению, %username%,, Ваша заявка на регистрацию отклонена из-за несоответствия переданных данных”
  page_4: “Добро пожаловать, %имя пользователя%,, вы успешно авторизовались через соц сеть”


Deploy: деплой на любой тестовый публичный демо сервер.


rails new Journey -d mysql

bundle install --without production
rails g bootstrap:layout application fixed

rails g scaffold User
  username:string
  # email:string
  # password:string
  phone:string
  address:string
  city:string
  file:has_attached_file
  credentials:string

  nickname:string
  provider:string
  url:string

rails g devise:install
rails g devise User
rake db:migrate

rails g controller Users::OmniauthCallbacks facebook vkontakte

# rails g active_admin:devise
# rails g active_admin:install















