1. Установил docker

![ ](screenshots/1.png)

2. Взял официальный докер-образ с nginx и выкачал его при помощи **docker pull**

![ ](screenshots/2.png)

3. Проверил наличие докер-образа с помощью **docker images**

![ ](screenshots/3.png)

4. Запустил докер-образ с помощью **docker run -d**

![ ](screenshots/4.png)

5. Проверь, что образ запустился через **docker ps**

![ ](screenshots/5.png)

6. Посмотрел информацию о контейнере через **docker inspect**

![ ](screenshots/6.png)

7. По выводу команды определил размер контейнера, список замапленных портов и ip контейнера

![ ](screenshots/7.png)

![ ](screenshots/8.png)

![ ](screenshots/9.png)

8. Остановил контейнер с помощью **docker stop**

![ ](screenshots/10.png)

9. Проверил, что контейнер остановился через **docker ps**

![ ](screenshots/11.png)

10. Запустил докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду **run**

![ ](screenshots/12.png)

11. Проверил, что в браузере по адресу **localhost:80** доступна стартовая страница **nginx**

![ ](screenshots/13.png)

12. Перезапустил и проверил. что докер контейнер запустился через **docker restart**

![ ](screenshots/14.png)