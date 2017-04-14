# User journey

## Stack
Ruby 2.3.1
Rails 5.0.2
pg 0.18
Redis 3.0

## Install
```
git clone https://github.com/aturay/Journey.git
cd Journey/
bundle
rails db:create
rails db:migrate
rails db:seed
rails s
```
+ *Login:* admin
+ *Pass:*  password


## Task
=======
### Тестовое задание на вакансию “Web Back-end Developer”
В рамках тестового задания необходимо  разработать демонстрационный веб-портал, выполняющий следующий user journey: 
 
1. Пользовать заходит на  сайт, где ему предлагается ввести  логин\пароль или зарегистрироваться  
2. При  регистрации пользователь должен указать ФИО, номер телефона, почтовый адрес,  город и назначить желаемый пароль. Почтовый адрес является уникальным логином. Пароль  должен  сохраняться в БД  (hash). 
3. Дополнительная возможность – пользователь может выбрать авторизацию через социальные  сети (в  рамках  тестового задания достаточно  сделать авторизацию через VK). В этом случае, вся необходимая информация  должна заполняться из профиля пользователя в соц сети. 
4. В случае  с ручной  регистрацией (п.2) у пользователя обязательно запрашивается скан документа, подтверждающего личность. Пользователь может выбрать для загрузки файл (pdf\image файл) локально с компьютера, файл загружается на сервер. 
 
К сайту должна  быть разработана администраторская страница, попасть в которую можно только  по  отдельным credentials. В панели администратора  должен  быть виден список всех пользователей (логин, ФИО и остальные данные) и их  регистрационных статусов. Пользователи должны  добавляться в   список  в   реальном времени (без ручного обновления  страницы).  
 
Статусы пользователей   (отображаются   в   графе   статус  регистрации):   
 
А.  Зарегистрирован, подтвержден (ссылка и   возможность просмотра   загруженного файла)  
B.  Зарегистрирован, социальная  сеть (ссылка на  профиль) 
С.  Подана  заявка  на  регистрацию (требует модерации,  ссылка  и   возможность просмотра загруженного файла)  
D.  Заявка  на  регистрацию отклонена   (ссылка и   возможность просмотра   загруженного файла)  
E.  Пользователь заблокирован (дата и время блокировки, ссылка  и   возможность просмотра   загруженного файла) У администратора  должна  быть возможность произвести  следующие   действия с пользователями:
 
1. Подтвердить  регистрацию (пройти модерацию). Администратор   имеет возможность посмотреть  загруженный документ,   сравнить его с   данными, которые ввел пользователь (сравнение  производит  администратор   вручную) и   нажать кнопку  “Подтвердить регистрацию”
2. Отклонить регистрацию. Администратор   определяет, что данные  не  совпадают   и нажимает на  кнопку  “Отклонить  регистрацию” 
3. Заблокировать любого пользователя (Ban), нажав кнопку  «Заблокировать  
пользователя». В этом случае данный пользователь не может  более   с   указанными credentials получить доступ  к   сайту.
 
Также,  в   зависимости от  статуса подтвержденной  регистрации, пользователь должен видеть  разный  набор   страниц на  основном сайте,  а   именно:
 
1. До   регистрации –   только  страницу регистрации и авторизации 
 
2. После регистрации (ручной), но  до  прохождения модерации – страницу регистрации и после ввода корректных  credentials дополнительную  страницу-1, на которой видит сообщение,  что “Ваша заявка  на  регистрацию находится на рассмотрении у модератора”
 
3. После регистрации (ручной), но  после успешного прохождения модерации – страницу регистрации и после ввода корректных  credentials дополнительную страницу-2, на  которой видит сообщение,  что “Спасибо, %username%, Ваша заявка на  регистрацию успешно подтверждена модератором, добро пожаловать!”
 
4. После регистрации (ручной), но  после неудачного  прохождения модерации – страницу регистрации и после ввода корректных  credentials дополнительную страницу-3, на  которой видит сообщение,  что “К  сожалению,  %username%, Ваша заявка  на  регистрацию отклонена из-за несоответствия  переданных  данных”
 
5. После регистрации (через  соц.сеть) – страницу регистрации и дополнительную страницу-4  после ввода корректных  credentials, на  которой видит тестовое сообщение “Добро  пожаловать, %имя пользователя%,  вы  успешно авторизовались через соц сеть”
 
 
Задание должно  быть реализовано на  Ruby\Rails, и   осуществлен деплой  на  любой тестовый публичный демо сервер.