## Part 1. Запуск нескольких Docker-контейнеров с использованием Docker Compose

- Для начала решил запустить контейнеры с *postgreSQL, rabbitmq, session-service* для того, чтобы понять особенности написания Dockerfile для каждого микросервиса.

![ ](screenshots/1.png)

![ ](screenshots/2.png)

![ ](screenshots/3.png)

![ ](screenshots/4.png)

- Собирал *session-service* с помощью команды `mvn package -DskipTests`

1. Написал Dockerfile для каждого отдельного микросервиса и запускал их примерно такой командой `docker run --name session_service --network dbnet -p 8081:8081 -e POSTGRES_HOST=psgr -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=users_db -e POSTGRES_PORT=5432 session:service`

Dockerfile, написанный 1 способом из материалов:

![ ](screenshots/5.png)

Размер собранных сервисов 1 способом из материалов:

![ ](screenshots/6.png)

Dockerfile, написанный 2 способом из материалов:

![ ](screenshots/7.png)

Размер собранного сервиса 2 способом из материалов:

![ ](screenshots/8.png)
*П.С. Понял, что не буду использовать этот способ*

Dockerfile, написанный 3 способом (screenshots/multi-stage build):

![ ](screenshots/9.png)

![ ](screenshots/10.png)
*П.С.С. Остановился на данном варианте из-за веса, но в следующих этапах выполения задания все равно размер образов увеличился, тк перешел на Windows.*

2. Написал Docker Compose файл, который осуществляет корректное взаимодействие сервисов. Пробросил порты для доступа к gateway service и session service из локальной машины. 

![ ](screenshots/11.png)

![ ](screenshots/12.png)

![ ](screenshots/13.png)

![ ](screenshots/14.png)

![ ](screenshots/15.png)

![ ](screenshots/16.png)

3. Собрал и развернул веб-сервис с помощью написанного Docker Compose файла на локальной машине.

![ ](screenshots/17.png)

![ ](screenshots/18.png)

4. Прогонал заготовленные тесты через postman и удостоверился, что все они проходят успешно. 

![ ](screenshots/19.png)

## Part 2. Создание виртуальных машин

- Перед выполением этой части проекта пришлось перейти на Windows, тк Vagrant не мог устанавливать боксы для Мака на арме. 

1. Установил и инициализировал Vagrant в корне проекта. Написал Vagrantfile для одной виртуальной машины. Перенес исходный код веб-сервиса в рабочую директорию виртуальной машины. 

![ ](screenshots/20.jpg)

![ ](screenshots/21.jpg)

2. Зашел через консоль внутрь виртуальной машины и удостоверился, что исходный код встал, куда нужно. Остановил и уничтожь виртуальную машину.

![ ](screenshots/22.jpg)

![ ](screenshots/23.jpg)

![ ](screenshots/24.jpg)

## Part 3. Создание простейшего Docker Swarm

1. Модифицировал Vagrantfile для создания трех машин: manager01, worker01, worker02. Написал shell-скрипты для установки Docker внутрь машин, инициализации и подключения к Docker Swarm в отдельный файл. Добавил переменную для того, чтобы была возможность устанавливать пустой бокс с Убунтой, тк официальный сервер в РФ недоступен. 

![ ](screenshots/25.png)

![ ](screenshots/26.png)

2. Загрузил собранные образы на Docker Hub и модифицировал Docker Compose файл для подгрузки расположенных на Docker Hub образов.

![ ](screenshots/27.jpg)

![ ](screenshots/28.png)

![ ](screenshots/29.png)

![ ](screenshots/30.png)

![ ](screenshots/31.png)

![ ](screenshots/32.png)

![ ](screenshots/33.png)

![ ](screenshots/40.png)

3. Поднял виртуальные машины и перенес на менеджер Docker Compose файл. Запустил стек сервисов, используя написанный Docker Compose файл.

![ ](screenshots/44.jpg)

![ ](screenshots/45.jpg)

![ ](screenshots/41.jpg)

![ ](screenshots/42.jpg)

![ ](screenshots/43.jpg)

4. Настрой прокси на базе nginx для доступа к gateway service и session service по оверлейной сети. Сами gateway service и session service сделай недоступными напрямую.

![ ](screenshots/34.jpg)

![ ](screenshots/35.jpg)

5. Прогонал заготовленные тесты через Postman и удостоверился, что все они проходят успешно.

![ ](screenshots/36.jpg)

6. Используя команды Docker, отобразил в отчете распределение контейнеров по узлам.

![ ](screenshots/37.jpg)

![ ](screenshots/38.jpg)

7. Установил отдельным стеком Portainer внутри кластера. Portainer установил с помощью данной команды - `curl -L https://downloads.portainer.io/ce-lts/portainer-agent-stack.yml -o portainer-agent-stack.yml` из документации. Запусил с помощью этой команды - `docker stack deploy -c portainer-agent-stack.yml portainer`

![ ](screenshots/39.jpg)