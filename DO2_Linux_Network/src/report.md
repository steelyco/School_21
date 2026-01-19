## Part 1. Инструмент ipcalc

- Поднял виртуальную машину ws1:

![ ](screenshots/Pasted%20image%2020250428094716.png)

### 1.1. Сети и маски

1. Адрес сети *192.167.38.54/13*: 

![ ](screenshots/Pasted%20image%2020250428094922.png)

2. Перевод маски: 

- *255.255.255.0* в префиксную и двоичную запись: 

![ ](screenshots/Pasted%20image%2020250428095316.png)

- */15* в обычную и двоичную: 

![ ](screenshots/Pasted%20image%2020250428095546.png)

- *11111111.11111111.11111111.11110000* в обычную и префиксную:  
Для того чтобы перевести двоичную запись в обычную нужно подсчитать кол-во *1*, в данном случае их 28 значит префиксная запись будет */28*, значит обычная запись *255.255.255.240*

![ ](screenshots/Pasted%20image%2020250428100440.png)

3. Минимальный и максимальный хост сети *12.167.38.4* при масках: 

	- */8* 
	
	![ ](screenshots/Pasted%20image%2020250428100946.png)
	
	- *11111111.11111111.00000000.00000000* 
	
	![ ](screenshots/Pasted%20image%2020250428101014.png)
	
	- *255.255.254.0* 
	
	![ ](screenshots/Pasted%20image%2020250428101154.png)
	
	- */4* 
	
	![ ](screenshots/Pasted%20image%2020250428101208.png)
	
### 1.2. localhost 

**localhost** (локальный хост) — в компьютерных сетях стандартное, официально зарезервированное доменное имя для частных IP-адресов (в диапазоне **127.0.0.1 — 127.255.255.254**), таким образом: 

- Можно обратиться: 
	- 127.1.0.1
	- 127.0.0.2

- Нельзя обратиться: 
	- 194.34.23.100
	- 128.0.0.1
### 1.3. Диапазоны и сегменты сетей

1. **IP-адреса**, начинающиеся с *10, 172.16–172.31 и 192.168*, зарезервированы для частного использования и не маршрутизируются в Интернете, в то время как все остальные IP-адреса являются общедоступными, таким образом: 

	- В качестве публичных можно использовать адреса:
		- 134.43.0.2
		- 172.0.2.1
		- 192.172.0.1
		- 172.68.0.2
		- 192.169.168.1

	- В качестве частного можно использовать адреса:
		- 10.0.0.45
		- 192.168.4.2
		- 172.20.250.4
		- 172.16.255.255
		- 10.10.10.10

2. IP-адреса шлюза у сети *10.10.0.0/18* возможны:
	- 10.10.0.2
	- 10.10.10.10
	- 10.10.1.255

![ ](screenshots/Pasted%20image%2020250428103235.png)

## Part 2. Статическая маршрутизация между двумя машинами

- Поднял виртуальную машину **ws1** и **ws2**: 

![ ](screenshots/Pasted%20image%2020250428144556.png)

![ ](screenshots/Pasted%20image%2020250428144621.png)

- Сетевые интерфейсы машин:

`ws1: `

![ ](screenshots/Pasted%20image%2020250428144654.png)

`ws2:`

![ ](screenshots/Pasted%20image%2020250428144638.png)

- Файл **etc/netplan/00-installer-config.yaml**:

`ws1:`

![ ](screenshots/Pasted%20image%2020250428152234.png)

`ws2:`

![ ](screenshots/Pasted%20image%2020250428152249.png)

- **netplan apply** для двух машин: 

`ws1:`

![ ](screenshots/Pasted%20image%2020250428152205.png)

`ws2:`

![ ](screenshots/Pasted%20image%2020250428152139.png)

### 2.1. Добавление статического маршрута вручную

- `ip r add 172.24.116.8 dev enp0s8`
- `ping 172.24.116.8`

![ ](screenshots/Pasted%20image%2020250428152047.png)

- `ip r add 192.168.100.10 dev enp0s8`
- `ping 192.168.100.10`

![ ](screenshots/Pasted%20image%2020250428152113.png)

### 2.2. Добавление статического маршрута с сохранением

- **reboot**

- Файл **etc/netplan/00-installer-config.yaml**:

`ws1:`

![ ](screenshots/Pasted%20image%2020250428154254.png) 

`ws2:`

![ ](screenshots/Pasted%20image%2020250428154448.png) 

- **Проверка соединения**: 

`ping 172.24.116.8`

![ ](screenshots/Pasted%20image%2020250428154737.png) 

`ping 192.168.100.10`

![ ](screenshots/Pasted%20image%2020250428154659.png) 

## Part 3. Утилита iperf3

### 3.1. Скорость соединения

- 8 Mbps в MB/s = **1 MB/s**
- 100 MB/s в Kbps = **100 000 Kbps**
- 1 Gbps в Mbps = **1000 Mbps**

### 3.2. Утилита iperf3
 
 - Запускаем первую машину в режиме сервера - **iperf3 -s**
 - Запускаем тест на второй машине, указав IP-адрес сервера - **iperf3 -c <IP_ВМ1> -t 20 -i 5**

ws1 - `iperf3 -s`

![ ](screenshots/Pasted%20image%2020250428155854.png) 

ws2 - `iperf3 -c 192.168.100.10 -t 20 -i 5`

![ ](screenshots/Pasted%20image%2020250428155833.png)

- Скорость соединения - **3.55 Gbps/sec**

## Part 4. Сетевой экран

### 4.1. Утилита iptables

- Создал файл на двух машинах: **sudo touch firewall.sh**
- iptables -A INPUT -p tcp --dport 22 -j ACCEPT - Разрешаем порт 22 
- iptables -A INPUT -p tcp --dport 80 -j ACCEPT - Разрешаем порт 80

`ws1:`

![ ](screenshots/Pasted%20image%2020250429105442.png)

- Запустил файл **firewall.sh**

![ ](screenshots/Pasted%20image%2020250429105727.png)

- Проверка правил файла **firewall.sh**

![ ](screenshots/Pasted%20image%2020250429105635.png) 

`ws2:`

![ ](screenshots/Pasted%20image%2020250429105516.png)

- Запустил файл **firewall.sh**:

![ ](screenshots/Pasted%20image%2020250429105752.png)

- Проверка правил файла **firewall.sh**:

![ ](screenshots/Pasted%20image%2020250429105608.png) 

### 4.2. Утилита nmap

- Проверка соединения между машинами командой **ping** и **nmap**:

`ping 172.24.116.8`
`nmap 172.24.116.8`

![ ](screenshots/Pasted%20image%2020250429110557.png)

`ping 192.168.100.10`
`nmap 192.168.100.10`

![ ](screenshots/Pasted%20image%2020250429110532.png) 

## Part 5. Статическая маршрутизация сети 

- Поднял 5 виртуальных маши: *3 рабочие станции (ws11, ws21, ws22) и 2 роутера (r1, r2)*

- ВМ **r1**

![ ](screenshots/Pasted%20image%2020250429143733.png)

- ВМ **r2**

![ ](screenshots/Pasted%20image%2020250429143650.png)

- ВМ **ws11**

![ ](screenshots/Pasted%20image%2020250429143557.png)

- ВМ **ws21**

![ ](screenshots/Pasted%20image%2020250429143520.png)

- ВМ **ws22**

![ ](screenshots/Pasted%20image%2020250429143418.png)

### 5.1. Настройка адресов машин

![ ](screenshots/Pasted%20image%2020250503092622.png)

- Настроил конфигурации машин согласно рисунку:

- `YAML-файл` - **r1**

![ ](screenshots/Pasted%20image%2020250429143014.png)

- `YAML-файл` - **r2**

![ ](screenshots/Pasted%20image%2020250429143154.png)

- `YAML-файл` - **ws11**

![ ](screenshots/Pasted%20image%2020250430123922.png)

- `YAML-файл` - **ws21**

![ ](screenshots/Pasted%20image%2020250430124023.png)

- `YAML-файл` - **ws22**

![ ](screenshots/Pasted%20image%2020250430123957.png)

- Проверил, что все адреса заданы верно

- `ip -4 a` - **r1**

![ ](screenshots/Pasted%20image%2020250429144036.png)

- `ip -4 a` - **r2**

![ ](screenshots/Pasted%20image%2020250429144059.png)

- `ip -4 a` - **ws11**

![ ](screenshots/Pasted%20image%2020250429144207.png)

- `ip -4 a` - **ws21**

![ ](screenshots/Pasted%20image%2020250429144225.png)

- `ip -4 a` - **ws22**

![ ](screenshots/Pasted%20image%2020250429144249.png)

- Проверка соединения между машинами:

- `ping` - **ping ws22 to ws21**

![ ](screenshots/Pasted%20image%2020250429144454.png)

- `ping` -  **ping r1 to ws11**

![ ](screenshots/Pasted%20image%2020250429144606.png)

### 5.2. Включение переадресации IP-адресов

- Выполнил команды на роутерах *для включения переадресации IP*:

- `r1` - **sysctl -w net.ipv4.ip_forward=1**

![ ](screenshots/Pasted%20image%2020250429144844.png)

- `r2` - **sysctl -w net.ipv4.ip_forward=1**

![ ](screenshots/Pasted%20image%2020250429144951.png)
`При таком подходе переадресация не будет работать после перезагрузки системы.`

- Изменил файл **/etc/sysctl.conf**

- `r1` - **sudo vim /etc/sysctl.conf**

![ ](screenshots/Pasted%20image%2020250429145514.png)

- `r2` - **sudo vim /etc/sysctl.conf**

![ ](screenshots/Pasted%20image%2020250429145411.png)

`При использовании этого подхода, IP-переадресация включена на постоянной основе.`
### 5.3. Установка маршрута по умолчанию

- Добавил маршрут по умолчанию для рабочих станций:

- `YAML-файл` - **ws11**

![ ](screenshots/Pasted%20image%2020250430124154.png)

- `YAML-файл` - **ws21**

![ ](screenshots/Pasted%20image%2020250430124102.png)

- `YAML-файл` - **ws22**

![ ](screenshots/Pasted%20image%2020250430124137.png)

- Проверка добавления маршрута по умолчанию:

- `ip r` - **ws11** 

![ ](screenshots/Pasted%20image%2020250429155038.png)

- `ip r` - **ws21** 

![ ](screenshots/Pasted%20image%2020250429155116.png)

- `ip r` - **ws22** 

![ ](screenshots/Pasted%20image%2020250429155153.png)

- Пинг с машины **ws11 до r2** для проверки, что он доходит:

- `ping` - **ws11 to r2** 

![ ](screenshots/Pasted%20image%2020250430114900.png)

- `tcpdump -tn -i eth0 на машина r2` - **tcpdump -tn -i enp0s3**

![ ](screenshots/Pasted%20image%2020250430115104.png)

### 5.4. Добавление статических маршрутов

- Добавил в файл *etc/netplan/00-installer-config.yaml* роутеров статические маршруты:

- `YAML-файл` - **r1**

![ ](screenshots/Pasted%20image%2020250430115833.png)

- `YAML-файл` - **r2**

![ ](screenshots/Pasted%20image%2020250430115804.png)

- Проверка маршрутов на роутерах:

- `ip r` - **r2**

![ ](screenshots/Pasted%20image%2020250430120046.png)

- `ip r` - **r2**

![ ](screenshots/Pasted%20image%2020250430120141.png)

- `ip r list 10.10.0.0/18` и `ip r list 0.0.0.0/0`

![ ](screenshots/Pasted%20image%2020250430121455.png)

Маршрутизатор всегда выбирает **наиболее точный маршрут** из доступных. В данном случае `10.10.0.0/18` имеет более высокий приоритет, чем маршрут по умолчанию, так как его маска длиннее.

### 5.5. Построение списка маршрутизаторов

- Список маршрутов на пути ws11 до ws21:

- `traceroute` - **traceroute 10.20.0.10**

![ ](screenshots/Pasted%20image%2020250430131913.png)

- `tcpdump -tnv -i eth0` - **tcpdump -tnv -i enp0s3** 

![ ](screenshots/Pasted%20image%2020250430132303.png)

- Для доставки пакета от исходного узла ws11 с ip-адресом 10.10.0.2 к конечному узлу ws21 с ip-адресом 10.20.0.10 необходимо пройти несколько этапов. Пакет направляется к шлюзу с ip-адресом 10.10.0.1., пересылается на шлюз 10.100.0.12, который, в свою очередь, направляет его в целевую подсеть 10.20.0.0/26.

### 5.6. Использование протокола ICMP при маршрутизации

- Пинг с **ws11** несуществующий IP:

- `ping` - **ping 10.30.0.111**

![ ](screenshots/Pasted%20image%2020250430132826.png)

- Запусти на **r1** перехват сетевого трафика:

- `tcpdump -n -i eth0 icmp` - **tcpdump -n -i enp0s3 icmp** 

![ ](screenshots/Pasted%20image%2020250430132805.png)

- **Сохранил дампы всех машин** 

## Part 6. Динамическая настройка IP с помощью DHCP

- Установил **isc-dhcp-server**

- Отредактировал файл */etc/dhcp/dhcpd.conf* конфигурацию службы **DHCP**:

- `Файл dhcpd.conf` - **r1*

![ ](screenshots/Pasted%20image%2020250430143433.png)

- В файле _resolv.conf_ пропиcал `nameserver 8.8.8.8`.

- `Файл resolv.conf` - **r1**

![ ](screenshots/Pasted%20image%2020250430150753.png)

- Перезагрузил службу **DHCP** командой `systemctl restart isc-dhcp-server`

![ ](screenshots/Pasted%20image%2020250430143205.png)

- Перезагрузил машину **ws21** и показал, что она получила адрес:

- `ip a` - **ws21**

![ ](screenshots/Pasted%20image%2020250430150203.png)

- Пинг с машины **ws21 до ws22**:

- `ping 10.20.0.20`

![ ](screenshots/Pasted%20image%2020250430150448.png)

- Отредактировал файл */etc/dhcp/dhcpd.conf* конфигурацию службы **DHCP**:

- `Файл dhcpd.conf` - **r2** с жесткой привязкой к **MAC-адресу ws11**

![ ](screenshots/Pasted%20image%2020250430184632.png)

- Перезагрузил службу **DHCP** командой `systemctl restart isc-dhcp-server`

![ ](screenshots/Pasted%20image%2020250430184724.png)

- В файле _resolv.conf_ пропиcал `nameserver 8.8.8.8`.

- `Файл resolv.conf` - **r2**

![ ](screenshots/Pasted%20image%2020250430184811.png)

- Указал MAC-адрес у **ws11** в *etc/netplan/00-installer-config.yaml*:

- `YALM-файл` - **ws11**

![ ](screenshots/Pasted%20image%2020250430184950.png)

- Проверка `ip a` у машины **ws21** до обновления IP-адреса

![ ](screenshots/Pasted%20image%2020250430185357.png)

- **sudo dhclient -r enp0s3** - Освобождение IP-адреса

- **sudo dhclient enp0s3** - Обновление IP-адреса

![ ](screenshots/Pasted%20image%2020250430144542.png)

- Проверка `ip a` у машины **ws21** после обновления IP-адреса

![ ](screenshots/Pasted%20image%2020250430185614.png)

- **Сделал дампы машин**

## Part 7. NAT

- Установил *Apache* - **sudo apt install apache2**

- В файле _/etc/apache2/ports.conf_ на ws22 и r1 изменил строку `Listen 80` на `Listen 0.0.0.0:80`:

- `ws22` - **cat /etc/apache2/ports.conf**

![ ](screenshots/Pasted%20image%2020250430200657.png)

- `r1` - **cat /etc/apache2/ports.conf**

![ ](screenshots/Pasted%20image%2020250430200606.png)

- Запусти веб-сервер *Apache* на **r1 и ws22**:

- `r1` - **service apache2 start**

![ ](screenshots/Pasted%20image%2020250430200424.png)

- `ws22` - **service apache2 start**

![ ](screenshots/Pasted%20image%2020250430200516.png)

- Добавил в *firewall.sh* следующие правила:
	- `iptables -F`
	- `iptables -F -t nat`
	- `iptables --policy FORWARD DROP`

- Запустил *firewall.sh* по аналогии с предыдущим заданием:

- `chmod +x /etc/firewall.sh` и `/etc/firewall.sh`

![ ](screenshots/Pasted%20image%2020250430201042.png)

- Проверил соединение между **ws22** и **r1** командой `ping`:

- Пинг с **r1** до **ws22** - (не проходит)

![ ](screenshots/Pasted%20image%2020250501092359.png)

- Добавил маршрутизацию всех пакетов протокола *ICMP* в файл **firewall.sh**:

- `iptables -A FORWARD -p icmp -j ACCEPT`

![ ](screenshots/Pasted%20image%2020250430202005.png)

- Проверил соединение между **ws22** и **r1** командой `ping`:

- Пинг с **r1** до **ws22** - (проходит)

![ ](screenshots/Pasted%20image%2020250501092633.png)

- Добавь в файл **firewall.sh** ещё два правила

- Включил **SNAT**:
	- `iptables -A FORWARD -p tcp --dport 80 -j ACCEPT`
	- `iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT`
	- `iptables -t nat -A POSTROUTING -o enp0s3 -s 10.20.0.0/26 -p tcp -j SNAT --to-sourse 10.100.0.12`

![ ](screenshots/Pasted%20image%2020250501124031.png)

- - Включил **DNAT**:
	- `iptabels -t nat -A PREROUTING -i enp0s3 -p tcp --dport 8080 -j DNAT --to-destination 10.20.0.20:80`

![ ](screenshots/Pasted%20image%2020250501124042.png)

- Проверил соединение по TCP для **SNAT**: для этого с **ws22** подключиться к серверу *Apache* на **r1** командой:
	- `telnet [адрес] [порт]`

- `telnet 10.10.0.1 80`

![ ](screenshots/Pasted%20image%2020250501123502.png)

- Проверил соединение по TCP для **DNAT**: для этого с **r1** подключиться к серверу *Apache* на **ws22** командой: 
	- `telnet` (обращаться по адресу r2 и порту 8080).

- `telnet 10.20.0.1 8080`

![ ](screenshots/Pasted%20image%2020250501123759.png)

- **Сохранил дампы машин**