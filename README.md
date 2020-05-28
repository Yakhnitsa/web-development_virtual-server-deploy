# Деплой приложения на виртуальный сервер Linux

## Создание виртуальной машины на компьютере
1.1.    Установка Virtualbox и скачивание дистрибутива

   [подробный туториал](http://slusar.su/ubuntu-server-18-04-ustanovka-i-nastroyka-na-virtualbox/)
   
   Скачиваем и устанавливаем [virtualbox](https://www.virtualbox.org/wiki/Downloads)
   
   Скачиваем и устанавливаем дистрибутив [Ubuntu server](https://www.ubuntu.com/server)

1.2.Настройка системы
    
   В случаи, если virtualbox не видит х64 версии операционной системы, 
   следует произвести настройку аппаратной виртуализации, в bios находим пункт Virtualization и
   ставим на enable.
   
   Также проблема может крыться в установленном компоненте Windows:
   Включение и отключение компонентов Windows - отключить компонент Hyper-V
 
1.3. Далее просто устанавливаем новую виртуальную машину, логины, пароли, 
предустановленные приложения, тд и тп вводим логин + пароль и заходим на виртуальную машину в окне virtualbox.   
## Настройка доступа к виртуальной машине через консоль на удаленном компьютере

2.1. Доступ через ssh через ввод имя пользователя и пароля

2.1.1 Настройка сети в VirtualBox и на виртуальной машине.
    
   Настраиваем согласно [ответу на гитхаб](https://ru.stackoverflow.com/questions/983432/%D0%9A%D0%B0%D0%BA-%D0%BF%D0%BE-ssh-%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%81%D1%8F-%D0%BA-%D0%B2%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9-%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D0%B5)
   
   - Создаем и настраиваем сеть в самом VirtualBox, настраиваем проброс портов и т.д.
   - Меняем настройки сети в виртуальной машине на "Сетевой мост"
   - Запускаем сервер.
   
2.1.2. Настройка на сервере:
     
   - Устанавливаем и настраиваем ssh [manual](https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-18-04/)
       
    sudo apt update
    sudo apt install openssh-server
   - Проверяем статус ssh
   
    sudo systemctl status ssh
    
   - Настраиваем firewall на доступ по ssh
   
    sudo ufw allow ssh  
 
   
2.1.3 Проверяем настройки IP и подключаемся к серверу

   - Проверяем настройки IP на сервере:
    ip all: --> inet 192.168.0.102
    Или командой hostname -I
   
   - Подключаемся к удаленному серверу по ssh с другой машины
   
    ssh (username)@(ip.address) ---> ssh developer@192.168.0.105 [enter]
    
   PROFIT!!! 


## Установка всех необходимых приложений на сервере

3.1 Установка java
    
   -  Проверяем установленную версию, система сама предложит скрипты для запуска установки
   `java -verion`
    
  - Устанавливаем java 8    
     `sudo apt install openjdk-8-jre-headless`
     
3.2 Установка и настройка My Sql
[пошаговая инструкция](https://www.digitalocean.com/community/tutorials/mysql-ubuntu-18-04-ru)

   - Запускаем скрипт установки
    `$sudo apt install mysql-server`
   - Настраиваем параметры безопасности
    `$sudo mysql_secure_installation`
   - Запуск MySQL
   `$sudo mysql`
   - Меняем способ входа в MySQL на доступ по паролю
   `mysql>ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL_8852545';`
   
   - Выходим из MySQL, Дальнейший вход возможен по команде:
   `mysql -u root -p`
   - Создаем нового пользователя и прописываем ему все права:
   `mysql>CREATE USER 'developer'@'localhost' IDENTIFIED BY 'password';` 
   `mysql>GRANT ALL PRIVILEGES ON *.* TO 'developer'@'localhost' WITH GRANT OPTION;`
   - Проверяем mysql и запускаем, если она не запущена
    `systemctl status mysql.service` - В окне должна быть отметка про активность службы, 
    если служба не активна запускаем:
    `sudo systemctl start mysql`
    
   !Несколько позезных [команд](https://help.ubuntu.ru/wiki/mysql)
   

## Деплой приложения на сервер

## Плагины maven для автоматического деплоя на сервер

##

##

##