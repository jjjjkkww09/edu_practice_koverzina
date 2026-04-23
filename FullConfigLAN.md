## .pkt файл с выполненной работой находится в /pkt_lan.

## Configure LAN

## Часть 1.

#### Шаг 1.

Согласно заданной схеме, строим топологию сети, по которой будет выполняться задание.

![](/kartinko/Image_0005.png)

*Топология сети*

#### Шаг 2.

На каждом роутере создаем сообщение дня (MOTD) с указанием своего ФИО, номером группы и порядковым номером в журнале.

![](/kartinko/Image_0002.png)

*Создание баннера MOTD на 1 роутере в Новосибирске*:

![](/kartinko/Image_0003.png)

*Создание баннера MOTD на 1 роутере в Москве*

![](/kartinko/Image_0004.png)

*Создание баннера MOTD на 2 роутере в Москве*

#### Шаг 3.

Переименовываем устройства по шаблону "сокращенное название страны-сокращенное название города-сокращенная роль устройства-порядковый номер устройства"
Сначала переименуем устройства, находящиеся в Новосибирске.

![](/kartinko/Image_0006.png)

*Переименование маршрутизатора*

![](/kartinko/Image_0007.png)

*Переименование первого коммутатора*

![](/kartinko/Image_0008.png)

*Переименование второго коммутатора*

![](/kartinko/Image_0009.png)

*Переименование первого ПК, подключенного к первому коммутатору*

![](/kartinko/Image_0010.png)

*Переименование второго ПК, подключенного к первому коммутатору*

![](/kartinko/Image_0011.png)

*Переименование третьего ПК, подключенного к первому коммутатору*

![](/kartinko/Image_0012.png)

*Переименование первого ПК, подключенного ко второму коммутатору*

![](/kartinko/Image_0013.png)

*Переименование второго ПК, подключенного ко второму коммутатору*

![](/kartinko/Image_0014.png)

*Переименование третьего ПК, подключенного ко второму коммутатору*

Переименуем устройства в Москве.

![](/kartinko/Image_0015.png)

*Переименование первого маршрутизатора*

![](/kartinko/Image_0016.png)

*Переименование второго маршрутизатора*

![](/kartinko/Image_0017.png)

*Переименование первого коммутатора*

![](/kartinko/Image_0018.png)

*Переименование первого коммутатора*

![](/kartinko/Image_0019.png)

*Переименование сервера*

![](/kartinko/Image_0020.png)

*Переименование первого ПК, подключенного к MLS*

![](/kartinko/Image_0021.png)

*Переименование второго ПК, подключенного к MLS*

Теперь топология сети с измененными названиями устройств выглядит так:

![](/kartinko/Image_0022.png)

*Измененная топология сети*

#### Шаг 4.

Раздаем доменные имена согласно местоположению.

Устройства в Новосибирске:

![](/kartinko/Image_0023.png)

*Доменное имя на роутере*

![](/kartinko/Image_0024.png)

*Доменное имя на первом свитче*

![](/kartinko/Image_0025.png)

*Доменное имя на втором свитче*

Устройства в Москве:

![](/kartinko/Image_0026.png)

*Доменное имя на первом роутере*

![](/kartinko/Image_0027.png)

*Доменное имя на втором роутере*

![](/kartinko/Image_0028.png)

*Доменное имя на первом свитче*

![](/kartinko/Image_0029.png)

*Доменное имя на втором свитче*

#### Шаг 5.

На коммутаторах в Новосибирске создадим VLAN 2, 3 и 4 без присвоения им имен.

![](/kartinko/Image_0031.png)

*Создаем VLAN'ы на первом свитче*

![](/kartinko/Image_0030.png)

*Создаем VLAN'ы на втором свитче*

#### Шаг 6.

На коммутаторах в Новосибирске назначаем интерфейс f0/2 VLAN 2, интерфейс f0/3 VLAN 3, интерфейс f0/4 VLAN 4.

![](/kartinko/Image_0033.png)

*Назначаем интерфейсы VLAN'ам на первом коммутаторе*

![](/kartinko/Image_0032.png)

*Назначаем интерфейсы VLAN'ам на втором коммутаторе*

#### Шаг 7.

Создаем канал EtherChannel 2-го уровня между коммутаторами в Новосибирске, используя интерфейсы G0/1 и G0/2. Обязательно выполняем требования:

1. Используем стандартный протокол для создания логической связи под номером 1.
2. Коммутатор rus-nsk-s1 является ответственным за инициирование согласования канала EtherChannel.
3. Изменим интерфейс агрегированного канала на транковый на обоих коммутаторах.

![](/kartinko/Image_0034.png)

*Настройка на rus-nsk-s1*

![](/kartinko/Image_0035.png)

*Настройка на rus-nsk-s2*

#### Шаг 8.

Создаем Management interface на коммутаторе rus-nsk-s1 для VLAN 1, используя IP-адрес 1.0.0.50/8 и шлюз по умолчанию 1.0.0.1.

![](/kartinko/Image_0036.png)

*Создание Management interface на rus-nsk-s1 для VLAN 1*

#### Шаг 9.

Создаем Management interface на коммутаторе rus-nsk-s2 для VLAN 2, используя IP-адрес 2.0.0.50/8 и шлюз по умолчанию 2.0.0.1.

![](/kartinko/Image_0037.png)

*Создание Management interface на rus-nsk-s2 для VLAN 2*

#### Шаг 10.

Включаем SSHv2 на коммутаторах в Новосибирске, используя имя пользователя "nsk" и пароль типа 5 "cisco".

![](/kartinko/Image_0039.png)

*Включение SSHv2 на rus-nsk-s1*

Сначала генерируем ключи RSA на 768 бит, т.к. это обязательное условие и минимальное количество бит для SSHv2.

![](/kartinko/Image_0038.png)

*Генерация ключей RSA*

![](/kartinko/Image_0039)

Настраиваем линии VTY для удаленного доступа.

![](/kartinko/Image_0040.png)

*Настройка линий VTY*

Настройка на коммутаторе rus-nsk-s2:

![](/kartinko/Image_0041.png)

*Настройка на rus-nsk-s2*

#### Шаг 11.

Настраиваем интерфейс f0/24 коммутатора rus-nsk-s1 как транк, так как он будет подключен к маршрутизатору R1 для межсетевой маршрутизации VLAN на транке.

![](/kartinko/Image_0042.png)

*Настройка интерфейса f0/24 на rus-nsk-s1 как транка*

#### Шаг 12.

Для коммутаторов rus-nsk-s1 и rus-nsk-s2 настраиваем сообщение дня (MOTD) об наименовании коммутатора.

![](/kartinko/Image_0043.png)

*Баннер MOTD на rus-nsk-s1*

![](/kartinko/Image_0044.png)

*Баннер MOTD на rus-nsk-s2*

#### Шаг 13.

Настраиваем интерфейсы f0/2, f0/3 и f0/4, соблюдая следующие требования:
1. Интерфейсы должны переходить в состояние пересылки (forwarding) сразу после подключения к ним кабеля;
2. Интерфейсы не должны принимать фреймы BPDU;
3. Нужно отключить проприетарный протокол обнаружения Cisco (CDP);
4. Нужно убедиться, что трафик поступает только с одного MAC-адреса, который должен быть сохранен в коммутаторах даже после перезагрузки. При нарушении интерфейсы должны переходить в состояние err-disable.

![](/kartinko/Image_0045.png)

*Настройка на rus-nsk-s1*

![](/kartinko/Image_0046.png)

*Настройка на rus-nsk-s1*

![](/kartinko/Image_0047.png)

*Настройка на rus-nsk-s2*

![](/kartinko/Image_0048.png)

*Настройка на rus-nsk-s2*

#### Шаг 14.

Защищаем консольное подключение тем же именем пользователя и паролем, что и указывали для линий VTY.

![](/kartinko/Image_0052.png)

*Защищаем консольное подключение на rus-nsk-s1*

![](/kartinko/Image_0053.png)

*Защищаем консольное подключение на rus-nsk-s2*

Теперь при входе запрашивается имя пользователя и пароль.

![](/kartinko/Image_0049.png)

*Запрос имени пользователя и пароля*

#### Шаг 15.

Отключаем exec-таймаут для консоли и SSH.

![](/kartinko/Image_0050.png)

*Отключение на rus-nsk-s1*

![](/kartinko/Image_00051.png)

*Отключение на rus-nsk-s2*

#### Шаг 16.

Предотвращаем прерывание консольной сессии перед каждым выводом журнала (логирования).

![](/kartinko/Image_0054.png)

*Предотвращение прерывания консольной сессии перед логированием на rus-nsk-s1*

![](/kartinko/Image_0055.png)

*Предотвращение прерывания консольной сессии перед логированием на rus-nsk-s2*

#### Шаг 17.

Изменим размер буфера истории для этой сессии до 256 строк.

![](/kartinko/Image_0056.png)

*Изменение размера буфера истории на rus-nsk-s1*

![](/kartinko/Image_00057.png)

*Изменение размера буфера истории на rus-nsk-s2*

## Часть 2.

#### Шаг 1.

Назначаем интерфейсу f0/1 маршрутизатора rus-nsk-r1 IP-адрес 40.40.40.1/24.

![](/kartinko/Image_0058.png)

*Назначение IP-адреса f0/1 на rus-nsk-r1*

#### Шаг 2.

Настраиваем маршрутизатор rus-nsk-r1 для поддержки маршрутизации между VLAN 1, 2, 3, 4 для SW1 и SW2, используя следующие требования:
 
1. VLAN 1 IP-адрес rus-nsk-r1 1.0.0.1.
  
2. VLAN 2 IP-адрес rus-nsk-r1 2.0.0.1.
  
3. VLAN 3 IP-адрес rus-nsk-r1 3.0.0.1.
  
4. VLAN 4 IP-адрес rus-nsk-r1 4.0.0.1.

<img width="635" height="487" alt="image" src="https://github.com/user-attachments/assets/9e4f985d-f7dc-4581-9a64-2b9bd13dc3b8" />

*Настраиваем маршрутизатор rus-nsk-r1 для поддержки маршрутизации между VLAN 1, 2, 3, 4*

#### Шаг 3.

Настраиваем rus-nsk-r1 в качестве DHCP-сервера для любой машины, подключенной к VLAN 1, 2, 3, 4 на коммутаторах rus-nsk-s1 и rus-nsk-s2, используя следующие требования:
  
1. Для VLAN 1 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 1.0.0.100 до 1.0.0.200 не включительно.
  
2. Для VLAN 2 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 2.0.0.100 до 2.0.0.200 не включительно.
  
3. Для VLAN 3 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 3.0.0.100 до 3.0.0.200 не включительно.
  
4. Для VLAN 4 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 4.0.0.100 до 4.0.0.200 не включительно.
  
Сначала настраиваем исключение: запретим выдачу адресов, которые находятся вне диапазона.

![](/kartinko/Image_0059.png)

*Настраиваем исключение на rus-nsk-r1*

Создаем сами пулы адресов для VLAN’ов, указывая сеть и шлюз по умолчанию, ранее настроенный на rus-nsk-r1.

![](/kartinko/Image_0060.png)

*Создаем сами пулы адресов для VLAN’ов на rus-nsk-r1*

#### Шаг 4.

Для проверки отправляем ping с rus-nsk-pc1 на 3.0.0.101.

![](/kartinko/Image_0062.png)

*ping с rus-nsk-pc1 на 3.0.0.101*

## Часть 3.

#### Шаг 1.

Настраиваем имя хоста многоуровнего коммутатора на MLS.

<img width="472" height="97" alt="image" src="https://github.com/user-attachments/assets/b668899c-7aaf-48ff-94a0-1baf84cd3827" />

*Настройка имени хоста MLS*

#### Шаг 2.

Включаем возможность маршрутизации на многоуровнем коммутаторе MLS.

<img width="185" height="23" alt="image" src="https://github.com/user-attachments/assets/dc3df69d-b3df-47ba-83cb-98ca29c307bb" />

*Включение маршрутизации на MLS*

#### Шаг 3.

Создаем VLAN 100 с именем Sales_dept и VLAN 200 с именем IT_dept.

<img width="296" height="81" alt="image" src="https://github.com/user-attachments/assets/5f13443b-ed7e-4f05-96b9-1f463b47edf3" />

*Создание VLAN 100, VLAN 200 на MLS*

#### Шаг 4.

Назначаем интерфейс f0/4 VLAN 100, а интерфейс f0/5 VLAN 200.

<img width="360" height="80" alt="image" src="https://github.com/user-attachments/assets/52481dea-ef5d-4535-bf98-f0a68d6798e6" />

*Назначение интерфейсов VLAN'ам на MLS*

#### Шаг 5.

Включаем маршрутизацию между VLAN 100 и VLAN 200, используя SVI (Switch Virtual Interface) на MLS со следующими требованиями:

1. IP-адрес VLAN 100: 100.0.0.50/8
   
2. IP-адрес VLAN 200: 200.0.0.50/24

<img width="480" height="143" alt="image" src="https://github.com/user-attachments/assets/c78d5667-625b-45f6-a323-7af094e05625" />

*Включаем маршрутизацию между VLAN'ами на MLS*

#### Шаг 6.

Изменяем интерфейсы f0/1, f0/2 и f0/3 на интерфейсы 3-го уровня со следующими требованиями:

1. IP-адрес f0/1: 11.0.0.50/8
2. IP-адрес f0/2: 12.0.0.50/8
3. IP-адрес f0/3: 40.40.40.50/24

<img width="621" height="235" alt="image" src="https://github.com/user-attachments/assets/85732133-6c33-4700-b17f-e016fdfc1d29" />

*Изменение f0/1, f0/2 и f0/3 на интерфейсы 3-го уровня*

#### Шаг 7.

Пингуем 200.0.0.100 с rus-msk-pc2

<img width="468" height="214" alt="image" src="https://github.com/user-attachments/assets/cf6572c7-a2b9-4350-b264-3d8ccf778920" />

*ping 200.0.0.100 с rus-msk-pc2*

## Часть 4.

#### Шаг 1.

Настраиваем IP-адрес интерфейса f0/0 маршрутизатора rus-nsk-r1 на 10.0.0.2/8, а интерфейса f0/1 на 11.0.0.2/8.

<img width="510" height="149" alt="image" src="https://github.com/user-attachments/assets/b211dfec-a1bf-4fac-ae3b-a57c0828a148" />

*Настройка IP-адрес f0/0 rus-nsk-r1 на 10.0.0.2/8 и f0/1 на 11.0.0.2/8*

#### Шаг 2.

Настраиваем IP-адрес интерфейса f0/0 маршрутизатора rus-nsk-r3 на 10.0.0.3/8, а интерфейса f0/1 на 12.0.0.3/8.

<img width="446" height="115" alt="image" src="https://github.com/user-attachments/assets/47aa09fb-992d-4599-bcc1-da938a3c8f23" />

#### Шаг 3.

Настраиваем протокол Cisco High availability, который обычно использует многоадресный адрес 224.0.0.102, для роутеров в Москве. Используя номер группы 1, настраиваем rus-msk-r1 основным маршрутизатором, а rus-msk-r2 резервным. rus-msk-r1 вытесняет (preempt) rus-msk-r2, когда он возвращается из нерабочего состояния. Виртуальным IP-адресом назначаем 10.0.0.1.. rus-msk-r1 отслеживает свой интерфейс, подключенный к внешним сетям.

<img width="352" height="91" alt="image" src="https://github.com/user-attachments/assets/b2f9a2df-071e-4e42-b5ce-2a13c476b6a9" />

*Настройка на rus-msk-r1*

<img width="339" height="48" alt="image" src="https://github.com/user-attachments/assets/74b8eaad-d1ac-4f28-9d00-e7c2c1ee7248" />

*Настройка на rus-msk-r2*

## Часть 5.

#### Шаг 1.

Настраиваем EIGRP с номером автономной системы (AS) 100 на rus-nsk-r1, rus-msk-r2, rus-msk-r2 и MLS.

<img width="431" height="124" alt="image" src="https://github.com/user-attachments/assets/f8225179-f5fc-428b-a452-ccd32f4ec042" />

*Настройка EIGRP с AS 100 на rus-nsk-r1*.

<img width="379" height="81" alt="image" src="https://github.com/user-attachments/assets/37d5260c-aef8-40a7-a6fb-7d7534f8d74f" />

*Настройка EIGRP с AS 100 на rus-msk-r1*

<img width="605" height="104" alt="image" src="https://github.com/user-attachments/assets/65fa34da-a22c-405b-989a-3218d1277e53" />

*Настройка EIGRP с AS 100 на rus-msk-r1*

<img width="397" height="134" alt="image" src="https://github.com/user-attachments/assets/50137b35-a6c4-4876-b9b4-ec7e1746d861" />

*Настройка EIGRP с AS 100 на MLS*

#### Шаг 2.

С сервера rus-msk-serv1, подключенного к подсети 10.0.0.0/8, подключаемся по SSH.

<img width="502" height="212" alt="image" src="https://github.com/user-attachments/assets/28b39b14-3456-4ce0-99f3-a729baa84800" />

*Подключение по SSH с rus-msk-serv1 к rus-nsk-s1*

<img width="485" height="195" alt="image" src="https://github.com/user-attachments/assets/b870cffd-9200-403f-98e0-dae530053ec7" />

*Подключение по SSH с rus-msk-serv1 к rus-nsk-s2*

#### Шаг 3.

Пингуем с сервера rus-msk-serv1 адрес 2.0.0.50.

<img width="470" height="288" alt="image" src="https://github.com/user-attachments/assets/c58def67-d98b-414e-9f07-0b4606992efd" />

*ping с rus-msk-serv1 на 2.0.0.50*

## Часть 6.

#### Шаг 1.

Настраиваем rus-nsk-s1 так, чтобы он принимал SSH-соединения только с сервера 10.0.0.100 и ПК 2.0.0.100.

<img width="466" height="133" alt="image" src="https://github.com/user-attachments/assets/3ecc42bc-bbd1-42cf-a752-6d7f5b2ec846" />

*Настройка rus-nsk-s1, чтобы он принимал SSH-соединения только с сервера 10.0.0.100 и ПК 2.0.0.100.*

#### Шаг 2.

Настраиваем на rus-nsk-r1 ПК 2.0.0.100 как единственную машину в VLAN 2, которой разрешен доступ к веб-серверу 10.0.0.100.

<img width="610" height="161" alt="image" src="https://github.com/user-attachments/assets/61d1f432-4bee-4338-9908-4d0da96b39c2" />

*Настройка на rus-nsk-r1 ПК 2.0.0.100 как единственной машины в VLAN 2, которой разрешен доступ к веб-серверу 10.0.0.100*
#### Шаг 3.

Настраиваем роутеры rus-nsk-r1 и rus-msk-r2 так, чтобы они могли пинговать любые машины, но никогда не отвечали на ping-запросы, поступающие от каких-либо машин.

<img width="426" height="147" alt="image" src="https://github.com/user-attachments/assets/f8d6fed0-13a0-42ae-a8db-08d10e120b16" />

*Настраиваем rus-nsk-r1, чтобы он мог пинговать любые машины, но никогда не отвечал на чужие ping-запросы*


<img width="504" height="235" alt="image" src="https://github.com/user-attachments/assets/6cacce5f-7e2a-4ca6-b6f3-d2e80d2e1bc4" />

*Настраиваем rus-msk-r2, чтобы он мог пинговать любые машины, но никогда не отвечал на чужие ping-запросы*

## Часть 7.

#### Шаг 1.

Создаем loopback-интерфейс 1 на маршрутизаторе rus-nsk-r1 с IP-адресом 192.168.101.1/24.

<img width="601" height="126" alt="image" src="https://github.com/user-attachments/assets/a175e8fd-de04-4237-936b-a9ba078dd788" />

*Создание loopback-интерфейса 1 на rus-nsk-r1*

#### Шаг 2.

Создаем loopback-интерфейс 3 на маршрутизаторе rus-msk-r2 с IP-адресом 192.168.103.3/24.

<img width="578" height="140" alt="image" src="https://github.com/user-attachments/assets/935fdb74-da9c-40a8-b643-eed26c534ce5" />

*Создание loopback-интерфейса 3 на rus-msk-r2*

#### Шаг 3.

Нужно, чтобы rus-nsk-r1 и rus-msk-r2 объявляли созданные loopback-интерфейсы друг другу, испольузя RIPv2.

<img width="422" height="74" alt="image" src="https://github.com/user-attachments/assets/dbf5bc08-bf3a-420d-b750-8b95bcace48b" />

*Настройка объявление loopback-интерфейса для rus-msk-r2 на rus-nsk-r1, используя RIPv2*

<img width="435" height="79" alt="image" src="https://github.com/user-attachments/assets/cb08e917-3639-40b1-943b-41ec67c0f80f" />

*Настройка объявление loopback-интерфейса для rus-nsk-r2 на rus-msk-r2, используя RIPv2*

#### Шаг 4.

Так как RIPv2 должен работать только на rus-nsk-r1 и rus-msk-r2, отключаем его на других устройствах.

<img width="483" height="86" alt="image" src="https://github.com/user-attachments/assets/89b826e2-ccc6-4f27-b75a-c4359d2f89ec" />

*Отключаем RIPv2 на rus-msk-r1*

<img width="468" height="81" alt="image" src="https://github.com/user-attachments/assets/ba3f7740-58b7-4517-9ff4-b3f2a82d4c03" />

*Отключаем RIPv2 на MLS*

#### Шаг 5.

IP-адреса при использовании туннелей должны быть 200.200.200.х/24, где х = ID маршуртизатора.

<img width="587" height="128" alt="image" src="https://github.com/user-attachments/assets/7b66aec1-0732-43ef-a842-14d613161117" />

*Настройка на rus-nsk-r1*

<img width="568" height="159" alt="image" src="https://github.com/user-attachments/assets/d20738ed-a7b6-42ed-9e63-d4412aa1bb77" />

*Настройка на rus-msk-r2*

#### Шаг 6.

Используя расширенный ping, проверяем, что loopback-интерфейс rus-nsk-r1 может пинговать loopback-интерфейс rus-msk-r2.

<img width="580" height="310" alt="image" src="https://github.com/user-attachments/assets/8a2a9c03-f8cd-4c10-946a-13e5e10ced0e" />

*Проверка с использованием расширенного ping*

## Часть 8.

#### Шаг 1.

Настраиваем MLS и роутеры в Москве и Новосибирске на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера, используя ключ 1 "cisco", а также в качестве Syslog-сервера.

<img width="641" height="131" alt="image" src="https://github.com/user-attachments/assets/51b7b75b-9f31-4b12-bfa9-bbb66bfac3b5" />

*Настраиваем rus-nsk-r1 на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера*

<img width="653" height="155" alt="image" src="https://github.com/user-attachments/assets/e13866a2-6c8b-4183-b8b5-cf52009adf00" />

*Настраиваем rus-msk-r1 на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера*

<img width="655" height="169" alt="image" src="https://github.com/user-attachments/assets/7fb3c0dc-6a4f-4d52-856d-e557026b345c" />

*Настраиваем rus-msk-r2 на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера*

<img width="649" height="151" alt="image" src="https://github.com/user-attachments/assets/93794b98-5c1e-4279-a7df-e2b474b58c2c" />

*Настраиваем MLS на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера*

#### Шаг 2.

Включаем SNMP на rus-msk-r1 и rus-msk-r2, используя пароль "cisco" для сообщений set и get.

<img width="591" height="67" alt="image" src="https://github.com/user-attachments/assets/195ff541-6397-4c1e-91d2-a64eab373287" />

*Включение и настройка на rus-msk-r1*

<img width="619" height="55" alt="image" src="https://github.com/user-attachments/assets/9c19d28e-5c82-42c0-87a1-1550b7a27b50" />

*Включение и настройка на rus-msk-r2*

#### Шаг 3.

Включаем telnet на rus-msk-r2, используя сервер 10.0.0.100 в качестве ААА-сервера в качестве первого метода аутентификации. В случае его недоступности rus-msk-r2 должен использовать локальное имя пользователя и пароль. 

<img width="520" height="99" alt="image" src="https://github.com/user-attachments/assets/046118fc-bbfe-4b1b-ae5d-e9b0e1918eed" />

*Включение и настройка telnet на rus-msk-r2*

#### Шаг 4.

Настраиваем rus-msk-r1 на использование сервера 10.0.0.100 в качестве FTP-сервера, используя имя пользователя "cisco" и пароль "cisco".

<img width="358" height="45" alt="image" src="https://github.com/user-attachments/assets/07c294e1-aad5-469e-965e-6fc0ab8da49b" />

*Настройка rus-msk-r1 на использование сервера 10.0.0.100 в качестве FTP-сервера*

#### Шаг 5.

Отправляем копию текущей конфигурации rus-msk-r1 на сервер 10.0.0.100, используя протокол FTP.

<img width="465" height="158" alt="image" src="https://github.com/user-attachments/assets/cf68b9b0-be54-4f79-864a-b215e075bf3b" />

*Отправление копии текущей конфигурации rus-msk-r1 на сервер 10.0.0.100, используя протокол FTP*

#### Шаг 6.

Отправляем копию текущей конфигурации rus-msk-r2 на сервер 10.0.0.100, используя протокол TFTP.

<img width="425" height="173" alt="image" src="https://github.com/user-attachments/assets/a428d7e5-6975-4e26-be38-8d946301010f" />

*Отправление копии текущей конфигурации rus-msk-r2 на сервер 10.0.0.100, используя протокол TFTP*

#### Шаг 7.

Проверяем параметры загрузки на rus-msk-r2, чтобы убедиться, что не используем никаких команд boot system.

<img width="350" height="37" alt="image" src="https://github.com/user-attachments/assets/f51acd7f-ff6e-4caa-812d-1e0bf08b08a1" />

*Проверка параметров загрузки на rus-msk-r2*

#### Шаг 8.

Проверяем, что rus-msk-r1 может пинговать или подключаться по telnet к rus-msk-r2, используя имя "standby".

<img width="572" height="171" alt="image" src="https://github.com/user-attachments/assets/33db2e9e-51fb-4b63-b4b4-2a7c80a99c1b" />

*Проверка, что rus-msk-r1 может пинговать или подключаться по telnet к rus-msk-r2, используя имя "standby"*

#### Шаг 9.

Изменяем локальное имя пользователя в rus-msk-r2, используя процедуру восстановления пароля.

Для этого перезагружаем устройство, а при входе в командную строку быстро прожимаем CTRL+C.

<img width="714" height="718" alt="image" src="https://github.com/user-attachments/assets/274ae05a-b216-4b09-9389-d4898be3be43" />

*Входим в режим восстановления и смена регистра с последующей перезагрузкой без конфигурации*

Перезагружаемся и входим без пароля на чистый роутер. Вовзращаем старую конфигурацию.

<img width="648" height="355" alt="image" src="https://github.com/user-attachments/assets/4b8823dd-e8bb-4ffe-8a15-fa5631ecdf37" />

*Вход и возвращение старой конфигурации*

Создаем нового локального пользователя с новым паролем.

<img width="663" height="264" alt="image" src="https://github.com/user-attachments/assets/7a6a5785-880b-4d48-ab66-bbd1467c4ac4" />

*Создание нового локального пользователя*

Возвращаем роутер в нормальный режим работы, чтобы при следующей загрузки он снова не стал "пустым".

<img width="527" height="146" alt="image" src="https://github.com/user-attachments/assets/a01c9637-44cb-49a6-a58e-2e0deba8c2e0" />

*Возвращение регистра*

Теперь выходим и входим под новым пользователем.

<img width="661" height="233" alt="image" src="https://github.com/user-attachments/assets/0d880589-892b-45ea-90b9-28330b9024b7" />

*Вход под новым пользователем*

## Полные конфигурации устройств

### Устройства в Москве

#### rus-msk-r1

```
Current configuration : 1259 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-r1
!
!
!
!
!
!
!
!
ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX1017KP7O-
!
!
!
!
!
!
!
!
!
ip ftp username cisco
ip ftp password cisco
ip domain-name msk.local
ip host standby 10.0.0.1 
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 10.0.0.2 255.255.255.0
 duplex auto
 speed auto
 standby 1 ip 10.0.0.1
 standby 1 priority 110
 standby 1 preempt
 standby 1 track FastEthernet0/1
!
interface FastEthernet0/1
 ip address 11.0.0.2 255.0.0.0
 ip access-group SILENT_ROUTER in
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 10.0.0.0
 network 11.0.0.0
!
ip classless
!
ip flow-export version 9
!
!
ip access-list extended SILENT_ROUTER
 deny icmp any any echo
 permit ip any any
!
banner motd ^C
Rabotu vipolnila Koverzina Anastasia Andreevna, studentka gruppi 9CA-321, v jurnale pod nomerom 13!
^C
!
!
!
snmp-server community cisco RW
!
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

#### rus-msk-r2

```
Current configuration : 1684 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-r2
!
!
!
!
!
!
!
aaa new-model
!
aaa authentication login default local 
!
!
!
!
!
!
!
ip cef
no ipv6 cef
!
!
!
username msk privilege 15 password 0 cisco
username new_admin password 0 newpass
!
!
license udi pid CISCO2811/K9 sn FTX10170UN2-
!
!
!
!
!
!
!
!
!
ip domain-name msk.local
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface Loopback3
 ip address 192.168.103.3 255.255.255.0
!
interface Tunnel0
 ip address 200.200.200.3 255.255.255.0
 mtu 1476
 tunnel source FastEthernet0/1
 tunnel destination 40.40.40.1
!
!
interface FastEthernet0/0
 ip address 10.0.0.3 255.0.0.0
 ip access-group SILENT_ROUTER in
 duplex auto
 speed auto
 standby 1 ip 10.0.0.1
!
interface FastEthernet0/1
 ip address 12.0.0.3 255.0.0.0
 ip access-group SILENT_ROUTER in
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 10.0.0.0
 network 12.0.0.0
!
router rip
 version 2
 network 192.168.103.0
 network 200.200.200.0
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
ip access-list extended SILENT_ROUTER
 deny icmp any any echo
 permit ip any any
!
banner motd ^C
Rabotu vipolnila Koverzina Anastasia Andreevna, studentka gruppi 9CA-321, v jurnale pod nomerom 13!
^C
!
tacacs-server host 10.0.0.100
tacacs-server key cisco
!
!
snmp-server community cisco RW
!
logging 10.0.0.100
line con 0
 login authentication default
!
line aux 0
!
line vty 0 4
 login authentication default
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

#### rus-msk-s1

```
Current configuration : 1623 bytes
!
version 12.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-s1
!
!
!
ip domain-name msk.local
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport mode access
!
interface FastEthernet0/2
 switchport mode access
!
interface FastEthernet0/3
 switchport mode access
!
interface FastEthernet0/4
 switchport mode access
!
interface FastEthernet0/5
 switchport mode access
!
interface FastEthernet0/6
 switchport mode access
!
interface FastEthernet0/7
 switchport mode access
!
interface FastEthernet0/8
 switchport mode access
!
interface FastEthernet0/9
 switchport mode access
!
interface FastEthernet0/10
 switchport mode access
!
interface FastEthernet0/11
 switchport mode access
!
interface FastEthernet0/12
 switchport mode access
!
interface FastEthernet0/13
 switchport mode access
!
interface FastEthernet0/14
 switchport mode access
!
interface FastEthernet0/15
 switchport mode access
!
interface FastEthernet0/16
 switchport mode access
!
interface FastEthernet0/17
 switchport mode access
!
interface FastEthernet0/18
 switchport mode access
!
interface FastEthernet0/19
 switchport mode access
!
interface FastEthernet0/20
 switchport mode access
!
interface FastEthernet0/21
 switchport mode access
!
interface FastEthernet0/22
 switchport mode access
!
interface FastEthernet0/23
 switchport mode access
!
interface FastEthernet0/24
 switchport mode access
!
interface Vlan1
 no ip address
 shutdown
!
!
!
!
line con 0
!
line vty 0 4
 login
line vty 5 15
 login
!
!
!
!
end
```

#### MLS

```
Current configuration : 1907 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname MLS
!
!
!
!
!
!
ip routing
!
!
!
!
!
!
!
!
!
!
!
!
!
ip domain-name msk.local
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/1
 no switchport
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/2
 no switchport
 ip address 12.0.0.50 255.0.0.0
 duplex auto
 speed auto
!
interface FastEthernet0/3
 no switchport
 ip address 40.40.40.50 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/4
 switchport access vlan 100
 switchport mode access
!
interface FastEthernet0/5
 switchport access vlan 200
 switchport mode access
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 no ip address
 shutdown
!
interface Vlan100
 mac-address 0090.2bd1.5701
 ip address 100.0.0.50 255.0.0.0
!
interface Vlan200
 mac-address 0090.2bd1.5702
 ip address 11.0.0.50 255.0.0.0
!
router eigrp 100
 network 11.0.0.0
 network 12.0.0.0
 network 40.40.40.0 0.0.0.255
 network 100.0.0.0
 network 200.0.0.0
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
!
!
!
!
!
!
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

### Устройства в  Новосибирске

#### rus-nsk-r1

```
Current configuration : 3099 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-r1
!
!
!
!
ip dhcp excluded-address 1.0.0.200 1.0.0.254
ip dhcp excluded-address 2.0.0.200 2.0.0.254
ip dhcp excluded-address 3.0.0.200 3.0.0.254
ip dhcp excluded-address 4.0.0.200 4.0.0.254
ip dhcp excluded-address 1.0.0.1 1.0.0.99
ip dhcp excluded-address 2.0.0.1 2.0.0.99
ip dhcp excluded-address 3.0.0.1 3.0.0.99
ip dhcp excluded-address 4.0.0.1 4.0.0.99
!
ip dhcp pool VLAN1_POOL
 network 1.0.0.0 255.0.0.0
 default-router 1.0.0.1
ip dhcp pool VLAN2_POOL
 network 2.0.0.0 255.0.0.0
 default-router 2.0.0.1
ip dhcp pool VLAN3_POOL
 network 3.0.0.0 255.0.0.0
 default-router 3.0.0.1
ip dhcp pool VLAN4_POOL
 network 4.0.0.0 255.0.0.0
 default-router 4.0.0.1
ip dhcp pool VLAN1
 network 1.0.0.0 255.0.0.0
 default-router 1.0.0.1
ip dhcp pool VLAN2
 network 2.0.0.0 255.0.0.0
 default-router 2.0.0.1
ip dhcp pool VLAN3
 network 3.0.0.0 255.0.0.0
 default-router 3.0.0.1
ip dhcp pool VLAN4
 network 4.0.0.0 255.0.0.0
 default-router 4.0.0.1
!
!
!
ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10177Q5R-
!
!
!
!
!
!
!
!
!
ip domain-name nsk.local
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface Loopback1
 ip address 192.168.101.1 255.255.255.0
!
interface Tunnel0
 ip address 200.200.200.1 255.255.255.0
 mtu 1476
 tunnel source FastEthernet0/1
 tunnel destination 12.0.0.3
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/0.1
 encapsulation dot1Q 1 native
 ip address 1.0.0.1 255.0.0.0
!
interface FastEthernet0/0.2
 encapsulation dot1Q 2
 ip address 2.0.0.1 255.0.0.0
 ip access-group WEB_ONLY in
!
interface FastEthernet0/0.3
 encapsulation dot1Q 3
 ip address 3.0.0.1 255.0.0.0
!
interface FastEthernet0/0.4
 encapsulation dot1Q 4
 ip address 4.0.0.1 255.0.0.0
!
interface FastEthernet0/1
 ip address 40.40.40.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1.2
 no ip address
 ip access-group WEB_ACCESS in
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 40.40.40.0 0.0.0.255
!
router rip
 version 2
 network 192.168.101.0
 network 200.200.200.0
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
ip access-list extended WEB_ACCESS
 permit tcp host 2.0.0.100 host 10.0.0.100 eq www
 permit tcp host 2.0.0.100 host 10.0.0.100 eq 443
 deny tcp any host 10.0.0.100 eq www
 deny tcp any host 10.0.0.100 eq 443
 permit ip any any
ip access-list extended WEB_ONLY
 permit tcp host 2.0.0.100 host 10.0.0.100 eq www
 permit tcp host 2.0.0.100 host 10.0.0.100 eq 443
 deny tcp any host 10.0.0.100 eq www
 deny tcp any host 10.0.0.100 eq 443
 permit ip any any
!
banner motd ^C
Rabotu vipolnila Koverzina Anastasia Andreevna, studentka gruppi 9CA-321, v jurnale pod nomerom 13!
^C
!
!
!
!
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

#### rus-nsk-s1

```
Current configuration : 2780 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-s1
!
!
!
ip ssh version 2
ip domain-name nsk.local
!
username nsk secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
username rus-nsk-s1 secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface Port-channel1
 switchport trunk allowed vlan 1-4
 switchport mode trunk
!
interface FastEthernet0/1
!
interface FastEthernet0/2
 switchport access vlan 2
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 0090.0C4B.86D1
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/3
 switchport access vlan 3
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00D0.BC0C.39D0
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/4
 switchport access vlan 4
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00D0.BCB0.4E6C
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
 switchport trunk allowed vlan 1-4
 switchport mode trunk
!
interface GigabitEthernet0/1
 switchport trunk allowed vlan 1-4
 switchport mode trunk
 channel-group 1 mode active
!
interface GigabitEthernet0/2
 switchport trunk allowed vlan 1-4
 switchport mode trunk
 channel-group 1 mode active
!
interface Vlan1
 ip address 1.0.0.50 255.0.0.0
!
interface Vlan2
 ip address 2.0.0.2 255.0.0.0
!
interface Vlan3
 ip address 3.0.0.2 255.0.0.0
!
interface Vlan4
 ip address 4.0.0.2 255.0.0.0
!
ip default-gateway 1.0.0.1
!
banner motd ^C
Eto rus-nsk-s1 !!!
^C
!
!
!
ip access-list standard SSH_ALLOW
 permit host 10.0.0.100
 permit host 2.0.0.100
line con 0
 logging synchronous
 login local
 history size 256
 exec-timeout 0 0
!
line vty 0 4
 access-class SSH_ALLOW in
 exec-timeout 0 0
 login local
 transport input ssh
line vty 5 15
 access-class SSH_ALLOW in
 login
!
!
!
!
end
```

#### rus-nsk-s2

```
Current configuration : 2570 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-s2
!
!
!
ip domain-name nsk.local
!
username nsk secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
username rus-nsk-s2 secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface Port-channel1
 switchport trunk allowed vlan 1-4
 switchport mode trunk
!
interface FastEthernet0/1
!
interface FastEthernet0/2
 switchport access vlan 2
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00D0.5817.D662
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/3
 switchport access vlan 3
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00E0.8F64.1279
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/4
 switchport access vlan 4
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00E0.F9D3.E920
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
 switchport trunk allowed vlan 1-4
 switchport mode trunk
 channel-group 1 mode active
!
interface GigabitEthernet0/2
 switchport trunk allowed vlan 1-4
 switchport mode trunk
 channel-group 1 mode active
!
interface Vlan1
 ip address 1.0.0.2 255.0.0.0
!
interface Vlan2
 ip address 2.0.0.50 255.0.0.0
!
interface Vlan3
 ip address 3.0.0.2 255.0.0.0
!
interface Vlan4
 ip address 4.0.0.2 255.0.0.0
!
ip default-gateway 2.0.0.1
!
banner motd ^C
Eto rus-nsk-s2 !!!
^C
!
!
!
line con 0
 logging synchronous
 login local
 history size 256
 exec-timeout 0 0
!
line vty 0 4
 exec-timeout 0 0
 login local
 transport input ssh
line vty 5 15
 login
!
!
!
!
end
```
