1. Вход
  login: логин
  password: пароль

2. Зарегистрироваться
  username: ФИО
  phone: Номер телефона
  email: Почтовый
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
  city:string
  file:attachment

  # nickname:string
  provider:string
  url:string

  credentials:string
  blocked_date:datetime


rails g devise:install
rails g devise:views
rails g devise User
rake db:migrate

rails g controller Users::OmniauthCallbacks vkontakte
rails g migration AddColumnsToUsers provider uid

# rails g active_admin:devise
# rails g active_admin:install



git branch atest
git checkout atest

gem 'rspec-rails', '~> 3.5'
bundle
rails generate rspec:install

git add -A
git commit -m 'add gem rspec and install'
git branch atest
git push --set-upstream origin atest
git marge atest

rails generate rspec:model User













{
  id:                     2,
  username:               nil,
  email:                  "vasya_pupkin@pupkin.com",
  phone:                  nil,
  city:                   nil,
  file:                   nil,
  credentials:            nil,

  provider:               nil,
  url:                    nil,
  sign_in_count:          3,

  created_at:             'Thu, 06 Apr 2017 19:16:22 UTC +00:00',
  updated_at:             'Sat, 08 Apr 2017 08:37:43 UTC +00:00',
  encrypted_password:     "2a$11$Ah5mNuLdZQW9vjv.XS49Bug5ddN78l5r37RfaTAGqXR4cvE9fuNX.",
  reset_password_token:   nil,
  reset_password_sent_at: nil,
  remember_created_at:    nil,
  current_sign_in_at:     'Sat, 08 Apr 2017 08:37:43 UTC +00:00',
  last_sign_in_at:        'Fri, 07 Apr 2017 17:02:14 UTC +00:00',
  current_sign_in_ip:     "127.0.0.1",
  last_sign_in_ip:        "127.0.0.1"

  address:                nil,
}

{
  email:     "mail16@gmail.com",
  password:  "[FILTERED]",
  password_confirmation: "[FILTERED]",
  username:    "mail16",
  phone:       "23243",
  city:        "asdfs",
  credentials: "hand"
}



data:
{
  credentials: {
    expires: true
    expires_at: 1492344292
    token: "99ea133facb796234b98dce8b2c46b837d25d024a7b77d5912cbaa63caa7c1a7769748cf88502f11ce655"},
  extra: {
    raw_info: {
      bdate: "3.3"
      city: {id: 56, title: "Ижевск"},
      country: {id: 1 title: "Россия"},
      first_name: "Атур",
      id: 324697677
      last_name: "Авчян"
      nickname: ""
      online: 0
      photo_100: "https://pp.userapi.com/c604419/v604419677/2c7a1/VR12LtDL8zM.jpg"
      photo_200: "https://pp.userapi.com/c604419/v604419677/2c7a0/IPr_HtnxWdA.jpg"
      photo_200_orig: "https://pp.userapi.com/c604419/v604419677/2c79e/hMX3SaMlDNk.jpg"
      photo_400_orig: "https://pp.userapi.com/c604419/v604419677/2c79f/tEh7XCzKp3w.jpg"
      photo_50: "https://pp.userapi.com/c604419/v604419677/2c7a2/_FREl98h7Xs.jpg"
      screen_name: "id324697677"
      sex: 2 } },
  info: {::InfoHash
    email: nil
    name: "Атур Авчян"
    first_name: "Атур"
    last_name: "Авчян"
    location: "Россия, Ижевск"
    image: "https://pp.userapi.com/c604419/v604419677/2c7a2/_FREl98h7Xs.jpg"
    nickname: ""
    urls: {Vkontakte: "http://vk.com/id324697677"} },
  provider: "vkontakte"
  uid: "324697677"
}


{ extra: {raw_info: {city: {title: "Ижевск"}}},
  info: {
    email: 'user@mail.com',
    name: "User Name",
    urls: {Vkontakte: "vk.com"} },
}

