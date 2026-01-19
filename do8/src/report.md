1. Создал с помощью Vagrant три машины: manager, node01, node02. Прокинул порты node01 на локальную машину для доступа к пока еще не развернутому микросервисному приложению.

![ ](screenshots/1.png)

![ ](screenshots/2.png)

![ ](screenshots/3.png)

2. Подготовить manager как рабочую станцию для удаленного конфигурирования (помощь по Ansible в материалах).
    
    - Зайти на manager.
    
    ![ ](screenshots/4.png)
    
	- На manager проверить подключение к node01 через ssh по приватной сети.
    
	![ ](screenshots/5.png)

    - Сгенерировать ssh-ключ для подключения к node01 из manager (без passphrase).
    
    ![ ](screenshots/6.png)
    
	![ ](screenshots/7.png)
	
	- Скопировать на manager docker-compose файл и исходный код микросервисов.
	
	![ ](screenshots/8.png)
	
    - Установить Ansible на менеджер и создать папку ansible, в которой создать inventory-файл.
    
    ![ ](screenshots/9.png)
    
    ![ ](screenshots/10.png)
    
    ![ ](screenshots/11.png)
    
    ![ ](screenshots/12.png)
    
    - Использовать модуль ping для проверки подключения через Ansible.
    
    ![ ](screenshots/13.png)

3. Написать первый плейбук для Ansible, который выполняет apt update, устанавливает docker, docker-compose, копирует compose-файл из manager'а и разворачивает микросервисное приложение. 
    
    ![ ](screenshots/14.png)
    
    ![ ](screenshots/15.png)
    
    ![ ](screenshots/16.png)
    
3. Прогнать заготовленные тесты через postman и удостовериться, что все они проходят успешно. В отчете отобразить результаты тестирования.
    
    ![ ](screenshots/17.png)
    
4. Сформировать три роли:
    
    - роль application выполняет развертывание микросервисного приложения при помощи docker-compose;
    - apache устанавливает и запускает стандартный apache сервер;
    - postgres устанавливает и запускает postgres, создает базу данных с произвольной таблицей и добавляет в нее три произвольные записи.
    - Назначить первую роль node01 и вторые две роли node02, проверить postman-тестами работоспособность микросервисного приложения, удостовериться в доступности postgres и apache-сервера. Для Apache веб-страница должна открыться в браузере. Что касается PostgreSQL, необходимо подключиться с локальной машины и отобразить содержимое ранее созданной таблицы с данными.
      
      ![ ](screenshots/18.png)
      
      ![ ](screenshots/19.png)
      
      ![ ](screenshots/20.png)
      
      ![ ](screenshots/21.png)
      
      ![ ](screenshots/22.png)
      
      ![ ](screenshots/23.png)
      
      ![ ](screenshots/24.png)
      
      ![ ](screenshots/25.png)
      
      ![ ](screenshots/26.png)
      
      ![ ](screenshots/27.png)
    
3. Созданные в этом разделе файлы разместить в папке `src\ansible01` в личном репозитории.



## Part 2. Service Discovery

1. Написать два конфигурационных файла для consul (информация по consul в материалах):
    
    - consul_server.hcl:
    
    ![ ](screenshots/28.png)
      
    - consul_client.hcl:
    
    ![ ](screenshots/29.png)
    
    ![ ](screenshots/30.png)
    
1. Создать с помощью Vagrant четыре машины: consul_server, api, manager и db.
    
    - Прокинуть порт 8082 с api на локальную машину для доступа к пока еще не развернутому api.
    - Прокинуть порт 8500 с consul_server для доступа к ui consul.
    
    ![ ](screenshots/31.png)
    
2. Написать плейбук для ansible и четыре роли:
    
    ![ ](screenshots/32.png)
    
    ![ ](screenshots/33.png)
    
    - install_consul_server, которая:
    
    ![ ](screenshots/34.png)
    
    ![ ](screenshots/35.png)
    
    - install_consul_client, которая:
    
    ![ ](screenshots/36.png)
    
    ![ ](screenshots/37.png)
    
    ![ ](screenshots/38.png)
    
    - install_db, которая:
    
    ![ ](screenshots/39.png)
    
    - install_hotels_service, которая:
    
    ![ ](screenshots/40.png)

![ ](screenshots/41.png)

![ ](screenshots/42.png)

![ ](screenshots/43.png)

3. Проверить работоспособность CRUD-операций над сервисом отелей. В отчете отобразить результаты тестирования.



4. Созданные в этом разделе файлы разместить в папках `src\ansible02` и `src\consul01` в личном репозитории.