1. Прочитал конфигурационный файл **nginx.conf** внутри докер контейнера через команду *docker exec -ti nginx1 sh*

![ ](screenshots/16.png)

![ ](screenshots/15.png)

2. Создал на локальной машине файл **nginx.conf**

![ ](screenshots/17.png)

3. Настроил в нем по пути _/status_ отдачу страницы статуса сервера **nginx**

![ ](screenshots/20.png)

4. Скопировал созданный файл **nginx.conf** в докер контейнер через команду **docker cp**

![ ](screenshots/18.png)

5. Перезапустил **nginx** внутри докер-образа через команду **exec**

![ ](screenshots/21.png)

6. Проверил, что по адресу _localhost:80/status_ отдается страничка со статусом сервера **nginx**.

![ ](screenshots/22.png)

7. Экспортировал контейнер в файл _container.tar_ через команду **export**

![ ](screenshots/23.png)

8. Остановил контейнер

![ ](screenshots/24.png)

9. Удалил остановленный контейнер

![ ](screenshots/25.png)

10. Удали образ через *docker rmi [image_id|repository]*, не удаляя перед этим контейнеры

![ ](screenshots/26.png)

11. Импортируй контейнер обратно через команду **import**

![ ](screenshots/27.png)

![ ](screenshots/28.png)

12. Запустил импортированный контейнер

![ ](screenshots/29.png)

13. Проверил , что по адресу _localhost:80/status_ отдается страничка со статусом сервера **nginx**

![ ](screenshots/30.png)

