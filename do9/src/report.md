## Part 1. Получение метрик и логов

1. Я запустил три машины, которые использовал в 7 проекте, вместе с той конфигурацией. 
    
    ![ ](screenshots/1.jpg)
    
    ![ ](screenshots/2.jpg)
    
    ![ ](screenshots/3.jpg)
    
    Понял, что такая конфигурация не подходит, точнее образы, которые были собраны для 7 проекта, поэтому далее приступил к пересборке 
    
2. Написать при помощи библиотеки Micrometer сборщики следующих метрик приложения:
    
    Добавил новые функции в файл application.properties каждого сервиса
    
    ![ ](screenshots/32.jpg)

    ![ ](screenshots/33.jpg)

    ![ ](screenshots/34.jpg)

    ![ ](screenshots/35.jpg)

    ![ ](screenshots/36.jpg)

    ![ ](screenshots/37.jpg)    

    ![ ](screenshots/38.jpg)

    Добавил новые зависимости в файл pom.xml
    
    ![ ](screenshots/5.jpg)
    
    Пересобрал все образы, которые использовались в 7 проекте. Теперь новые образы имеют тег 2.0 
    
    ![ ](screenshots/6.jpg)
    
3. Создать новый стек для Docker Swarm из сервисов с Prometheus Server, Loki, node_exporter, blackbox_exporter, cAdvisor. Проверить получение метрик на порту 9090 через браузер.
    Для нового стека из сервисов для метрик и логов создал новые файлы:
    - monitoring.yml - файл конфигурации для деплоя стека мониторинга
    
    ![ ](screenshots/7.jpg)
    
    ![ ](screenshots/8.jpg)
    
    ![ ](screenshots/9.jpg)
    
    - prometheus.yml - файл конфигурации прометеуса
    
    ![ ](screenshots/10.jpg)
    
    ![ ](screenshots/11.jpg)
    
    - blackbox.yml - модули для blackbox'а
    
    ![ ](screenshots/12.jpg)
    
    - Запустил новый стек мониторинга
    
    ![ ](screenshots/13.jpg)
    
    - Проверяю как он работает в Portainer - все работает
    
    ![ ](screenshots/14.jpg)
    
    - Проверяю Prometheus - все работает 
     ![ ](screenshots/15.jpg)
    
    ![ ](screenshots/16.jpg)
    
    - Проверяю Loki - все работает 
      
    ![ ](screenshots/17.jpg)

## Part 2. Визуализация

1. Развернуть grafana как новый сервис в стеке мониторинга.
   
    - Добавил в monitoring.yml блок с графаной
      
    ![ ](screenshots/18.jpg)
    
    - Добавил конфигурацию Loki - loki-config.yaml
    
    ![ ](screenshots/19.jpg)
    
    - Добавил Промтейл для сбора логов из контейнеров, чтобы Локи нормально работал
      
    ![ ](screenshots/20.jpg)
    
    - Проверил доступ в браузере - все работает
    
    ![ ](screenshots/21.jpg)
    
    Добавил в Grafana дашборд со следующими метриками:
    - количество нод;
    - количество контейнеров;
    - количество стеков;
    - использование CPU по сервисам;
    - использование CPU по ядрам и узлам;
    - затраченная RAM;
    - доступная и занятая память;
    - количество CPU;
    - доступность google.com;
    - количество отправленных сообщений в rabbitmq;
    - количество обработанных сообщений в rabbitmq;
    - количество бронирований;
    - количество полученных запросов на gateway;
    - количество полученных запросов на авторизацию пользователей;
    - логи приложения.
      
      ![ ](screenshots/22.jpg)

      ![ ](screenshots/23.jpg)

      ![ ](screenshots/24.jpg)
      
## Part 3. Отслеживание критических событий

1. Развернуть Alert Manager как новый сервис в стеке монтиторинга.
   
   - Добавил блок alertmanager в monitoring.yml
    
     ![ ](screenshots/25.jpg)
     
     - Создал конфигурацию alertmanager.yml
       
    ![ ](screenshots/26.jpg)
    
2. Добавить следующие критические события:

- доступная память меньше 100 Мб;
- затраченная RAM больше 1 Гб;
- использование CPU по сервису превышает 10%.

    - Создал конфигурацию самих алертов alerts.yml
    
    ![ ](screenshots/27.jpg)

3. Настроить получение оповещений через личные email
   
    ![ ](screenshots/28.jpg)
    
    ![ ](screenshots/29.jpg)
    
    ![ ](screenshots/30.jpg)
    
    ![ ](screenshots/31.jpg)