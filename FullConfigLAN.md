## Часть 1.

#### Шаг 1.

Согласно заданной схеме, строим топологию сети, по которой будет выполняться задание.

![](/kartinko/Image_0005.png)

#### Шаг 2.

На каждом роутере создаем сообщение дня (MOTD) с указанием своего ФИО, номером группы и порядковым номером в журнале.

Первый роутер (в Новосибирске):

![](/kartinko/Image_0002.png)

Второй роутер (первый в Москве): 

![](/kartinko/Image_0003.png)

Третий роутер (второй в Москве):

![](/kartinko/Image_0004.png)

#### Шаг 3.

Переименовываем устройства по шаблону "сокращенное название страны-сокращенное название города-сокращенная роль устройства-порядковый номер устройства"
Сначала переименуем устройства, находящиеся в Новосибирске.

Маршрутизатор:

![](/kartinko/Image_0006.png)

Коммутаторы:

![](/kartinko/Image_0007.png)

![](/kartinko/Image_0008.png)

Компьютеры, подключенные к первому коммутатору:

![](/kartinko/Image_0009.png)

![](/kartinko/Image_0010.png)

![](/kartinko/Image_0011.png)

Компьютеры, подключенные ко второму коммутатору:

![](/kartinko/Image_0012.png)

![](/kartinko/Image_0013.png)

![](/kartinko/Image_0014.png)

Переименуем устройства в Москве.

Маршрутизаторы:

![](/kartinko/Image_0015.png)

![](/kartinko/Image_0016.png)

Коммутаторы:

![](/kartinko/Image_0017.png)

![](/kartinko/Image_0018.png)

Сервер:

![](/kartinko/Image_0019.png)

Компьютеры, подключенные к rus-msk-s2 (MLS):

![](/kartinko/Image_0020.png)

![](/kartinko/Image_0021.png)

Теперь топология сети с измененными названиями устройств выглядит так:

![](/kartinko/Image_0022.png)

#### Шаг 4.

Раздаем доменные имена согласно местоположению.

Устройства в Новосибирске:

![](/kartinko/Image_0023.png)

![](/kartinko/Image_0024.png)

![](/kartinko/Image_0025.png)

Устройства в Москве:

![](/kartinko/Image_0026.png)

![](/kartinko/Image_0027.png)

![](/kartinko/Image_0028.png)

![](/kartinko/Image_0029.png)

#### Шаг 5.

На коммутаторах в Новосибирске создадим VLAN 2, 3 и 4 без присвоения им имен.

![](/kartinko/Image_0030.png)

![](/kartinko/Image_0031.png)

#### Шаг 6.

На коммутаторах в Новосибирске назначаем интерфейс f0/2 VLAN 2, интерфейс f0/3 VLAN 3, интерфейс f0/4 VLAN 4.

![](/kartinko/Image_0032.png)

![](/kartinko/Image_0033.png)

#### Шаг 7.

Создаем канал EtherChannel 2-го уровня между коммутаторами в Новосибирске, используя интерфейсы G0/1 и G0/2. Обязательно выполняем требования:

1. Используем стандартный протокол для создания логической связи под номером 1.
2. Коммутатор rus-nsk-s1 является ответственным за инициирование согласования канала EtherChannel.
3. Изменим интерфейс агрегированного канала на транковый на обоих коммутаторах.
Настраиваем коммутатор rus-nsk-s1:

![](/kartinko/Image_0034.png)

Настраиваем коммутатор rus-nsk-s2:

![](/kartinko/Image_0035.png)

#### Шаг 8.

Создаем Management interface на коммутаторе rus-nsk-s1 для VLAN 1, используя IP-адрес 1.0.0.50/8 и шлюз по умолчанию 1.0.0.1.

![](/kartinko/Image_0036.png)

#### Шаг 9.

Создаем Management interface на коммутаторе rus-nsk-s2 для VLAN 2, используя IP-адрес 2.0.0.50/8 и шлюз по умолчанию 2.0.0.1.

![](/kartinko/Image_0037.png)

#### Шаг 10.

Включаем SSHv2 на коммутаторах в Новосибирске, используя имя пользователя "nsk" и пароль типа 5 "cisco".

Настройка на коммутаторе rus-nsk-s1:

![](/kartinko/Image_0039.png)

Сначала генерируем ключи RSA на 768 бит, т.к. это обязательное условие и минимальное количество бит для SSHv2.

![](/kartinko/Image_0038.png)

![](/kartinko/Image_0039)

Настраиваем линии VTY для удаленного доступа.

![](/kartinko/Image_0040.png)

Настройка на коммутаторе rus-nsk-s2:

![](/kartinko/Image_0041.png)

#### Шаг 11.

Настраиваем интерфейс f0/24 коммутатора rus-nsk-s1 как транк, так как он будет подключен к маршрутизатору R1 для межсетевой маршрутизации VLAN на транке.



#### Шаг 12.

Для коммутаторов rus-nsk-s1 и rus-nsk-s2 настраиваем сообщение дня (MOTD) об наименовании коммутатора.

![](/kartinko/Image_0043.png)

![](/kartinko/Image_0044.png)

#### Шаг 13.

Настраиваем интерфейсы f0/2, f0/3 и f0/4, соблюдая следующие требования:
1. Интерфейсы должны переходить в состояние пересылки (forwarding) сразу после подключения к ним кабеля;
2. Интерфейсы не должны принимать фреймы BPDU;
3. Нужно отключить проприетарный протокол обнаружения Cisco (CDP);
4. Нужно убедиться, что трафик поступает только с одного MAC-адреса, который должен быть сохранен в коммутаторах даже после перезагрузки. При нарушении интерфейсы должны переходить в состояние err-disable.
5. Настраиваем коммутатор rus-nsk-s1.

![](/kartinko/Image_0045.png)

![](/kartinko/Image_0046.png)

Настраиваем коммутатор rus-nsk-s2.

![](/kartinko/Image_0047.png)

![](/kartinko/Image_0048.png)

#### Шаг 14.

Защищаем консольное подключение тем же именем пользователя и паролем, что и указывали для линий VTY.

На коммутаторе rus-nsk-s1:

![](/kartinko/Image_0052.png)

На коммутаторе rus-nsk-s2

![](/kartinko/Image_0053.png)

Теперь при входе запрашивается имя пользователя и пароль.

![](/kartinko/Image_0049.png)

#### Шаг 15.

Отключаем exec-таймаут для консоли и SSH.

![](/kartinko/Image_0050.png)

![](/kartinko/Image_00051.png)

#### Шаг 16.

Предотвращаем прерывание консольной сессии перед каждым выводом журнала (логирования).

![](/kartinko/Image_0054.png)

![](/kartinko/Image_0055.png)

#### Шаг 17.

Изменим размер буфера истории для этой сессии до 256 строк.

![](/kartinko/Image_0056.png)

![](/kartinko/Image_00057.png)

## Часть 2.

#### Шаг 1.

Назначаем интерфейсу f0/1 маршрутизатора rus-nsk-r1 IP-адрес 40.40.40.1/24.

![](/kartinko/Image_0058.png)

#### Шаг 2.

Настраиваем маршрутизатор rus-nsk-r1 для поддержки маршрутизации между VLAN 1, 2, 3, 4 для SW1 и SW2, используя следующие требования:
 
1. VLAN 1 IP-адрес rus-nsk-r1 1.0.0.1.
  
2. VLAN 2 IP-адрес rus-nsk-r1 2.0.0.1.
  
3. VLAN 3 IP-адрес rus-nsk-r1 3.0.0.1.
  
4. VLAN 4 IP-адрес rus-nsk-r1 4.0.0.1.

<img width="635" height="487" alt="image" src="https://github.com/user-attachments/assets/9e4f985d-f7dc-4581-9a64-2b9bd13dc3b8" />

#### Шаг 3.

Настраиваем rus-nsk-r1 в качестве DHCP-сервера для любой машины, подключенной к VLAN 1, 2, 3, 4 на коммутаторах rus-nsk-s1 и rus-nsk-s2, используя следующие требования:
  
1. Для VLAN 1 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 1.0.0.100 до 1.0.0.200 не включительно.
  
2. Для VLAN 2 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 2.0.0.100 до 2.0.0.200 не включительно.
  
3. Для VLAN 3 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 3.0.0.100 до 3.0.0.200 не включительно.
  
4. Для VLAN 4 диапазон IP-адресов DHCP на rus-nsk-r1 будет от 4.0.0.100 до 4.0.0.200 не включительно.
  
Сначала настраиваем исключение: запретим выдачу адресов, которые находятся вне диапазона.

![](/kartinko/Image_0059.png)

Создаем сами пулы адресов для VLAN’ов, указывая сеть и шлюз по умолчанию, ранее настроенный на rus-nsk-r1.

![](/kartinko/Image_0060.png)

#### Шаг 4.

Для проверки отправляем ICMP-запрос с rus-nsk-pc1 на 3.0.0.101.

![](/kartinko/Image_0062.png)

## Часть 3.

#### Шаг 1.

Настраиваем имя хоста многоуровнего коммутатора на MLS.

<img width="472" height="97" alt="image" src="https://github.com/user-attachments/assets/b668899c-7aaf-48ff-94a0-1baf84cd3827" />

#### Шаг 2.

Включаем возможность маршрутизации на многоуровнем коммутаторе MLS.

<img width="185" height="23" alt="image" src="https://github.com/user-attachments/assets/dc3df69d-b3df-47ba-83cb-98ca29c307bb" />

#### Шаг 3.

Создаем VLAN 100 с именем Sales_dept и VLAN 200 с именем IT_dept.

<img width="296" height="81" alt="image" src="https://github.com/user-attachments/assets/5f13443b-ed7e-4f05-96b9-1f463b47edf3" />

#### Шаг 4.

Назначаем интерфейс f0/4 VLAN 100, а интерфейс f0/5 VLAN 200.

<img width="360" height="80" alt="image" src="https://github.com/user-attachments/assets/52481dea-ef5d-4535-bf98-f0a68d6798e6" />

#### Шаг 5.

Включаем маршрутизацию между VLAN 100 и VLAN 200, используя SVI (Switch Virtual Interface) на MLS со следующими требованиями:

1. IP-адрес VLAN 100: 100.0.0.50/8
   
2. IP-адрес VLAN 200: 200.0.0.50/24

<img width="480" height="143" alt="image" src="https://github.com/user-attachments/assets/c78d5667-625b-45f6-a323-7af094e05625" />

#### Шаг 6.

Изменяем интерфейсы f0/1, f0/2 и f0/3 на интерфейсы 3-го уовня со следующими требованиями:

1. IP-адрес f0/1: 11.0.0.50/8
2. IP-адрес f0/2: 12.0.0.50/8
3. IP-адрес f0/3: 40.40.40.50/24

<img width="621" height="235" alt="image" src="https://github.com/user-attachments/assets/85732133-6c33-4700-b17f-e016fdfc1d29" />

#### Шаг 7.

Пингуем 200.0.0.100 с rus-msk-pc2

<img width="468" height="214" alt="image" src="https://github.com/user-attachments/assets/cf6572c7-a2b9-4350-b264-3d8ccf778920" />

## Часть 4.

#### Шаг 1.

Настраиваем IP-адрес интерфейса f0/0 маршрутизатора rus-nsk-r1 на 10.0.0.2/8, а интерфейса f0/1 на 11.0.0.2/8.

<img width="510" height="149" alt="image" src="https://github.com/user-attachments/assets/b211dfec-a1bf-4fac-ae3b-a57c0828a148" />

#### Шаг 2.

Настраиваем IP-адрес интерфейса f0/0 маршрутизатора rus-nsk-r3 на 10.0.0.3/8, а интерфейса f0/1 на 12.0.0.3/8.

<img width="446" height="115" alt="image" src="https://github.com/user-attachments/assets/47aa09fb-992d-4599-bcc1-da938a3c8f23" />

#### Шаг 3.

Настраиваем протокол Cisco High availability, который обычно использует многоадресный адрес 224.0.0.102, для роутеров в Москве. Используя номер группы 1, настраиваем rus-msk-r1 основным маршрутизатором, а rus-msk-r2 резервным. rus-msk-r1 вытесняет (preempt) rus-msk-r2, когда он возвращается из нерабочего состояния. Виртуальным IP-адресом назначаем 10.0.0.1.. rus-msk-r1 отслеживает свой интерфейс, подключенный к внешним сетям.

Проводим настройку на маршрутизаторе rus-msk-r1:

<img width="352" height="91" alt="image" src="https://github.com/user-attachments/assets/b2f9a2df-071e-4e42-b5ce-2a13c476b6a9" />

Проводим настройку на маршрутизаторе rus-msk-r2:

<img width="339" height="48" alt="image" src="https://github.com/user-attachments/assets/74b8eaad-d1ac-4f28-9d00-e7c2c1ee7248" />

## Часть 5.

#### Шаг 1.

Настраиваем EIGRP с номером автономной системы (AS) 100 на rus-nsk-r1, rus-msk-r2, rus-msk-r2 и MLS.

Сначала проводим настройку на маршрутизаторе в Новосибирске rus-nsk-r1:

<img width="431" height="124" alt="image" src="https://github.com/user-attachments/assets/f8225179-f5fc-428b-a452-ccd32f4ec042" />

Проведем настройку на маршрутизаторах в Москве.

На rus-msk-r1:

<img width="379" height="81" alt="image" src="https://github.com/user-attachments/assets/37d5260c-aef8-40a7-a6fb-7d7534f8d74f" />

На rus-msk-r2:

<img width="605" height="104" alt="image" src="https://github.com/user-attachments/assets/65fa34da-a22c-405b-989a-3218d1277e53" />

MLS:

<img width="397" height="134" alt="image" src="https://github.com/user-attachments/assets/50137b35-a6c4-4876-b9b4-ec7e1746d861" />

#### Шаг 2.

С сервера rus-msk-serv1, подключенного к подсети 10.0.0.0/8, подключаемся по SSH к rus-nsk-s1.

<img width="502" height="212" alt="image" src="https://github.com/user-attachments/assets/28b39b14-3456-4ce0-99f3-a729baa84800" />

Теперь подключимся по SSH к rus-nsk-s2.

<img width="485" height="195" alt="image" src="https://github.com/user-attachments/assets/b870cffd-9200-403f-98e0-dae530053ec7" />

#### Шаг 3.

Пингуем с сервера rus-msk-serv1 адрес 2.0.0.50.

<img width="470" height="288" alt="image" src="https://github.com/user-attachments/assets/c58def67-d98b-414e-9f07-0b4606992efd" />

## Часть 6.

#### Шаг 1.

Настраиваем rus-nsk-s1 так, чтобы он принимал SSH-соединения только с сервера 10.0.0.100 и ПК 2.0.0.100.

<img width="466" height="133" alt="image" src="https://github.com/user-attachments/assets/3ecc42bc-bbd1-42cf-a752-6d7f5b2ec846" />

#### Шаг 2.

Настраиваем на rus-nsk-r1 ПК 2.0.0.100 как единственную машину в VLAN 2, которой разрешен доступ к веб-серверу 10.0.0.100.

<img width="610" height="161" alt="image" src="https://github.com/user-attachments/assets/61d1f432-4bee-4338-9908-4d0da96b39c2" />

#### Шаг 3.

Настраиваем роутеры rus-nsk-r1 и rus-msk-r2 так, чтобы они могли пинговать любые машины, но никогда не отвечали на ping-запросы, поступающие от каких-либо машин.

Сначала на роутере в Новосибирске rus-nsk-r1.

<img width="426" height="147" alt="image" src="https://github.com/user-attachments/assets/f8d6fed0-13a0-42ae-a8db-08d10e120b16" />

Теперь настраиваем на роутере в Москве rus-msk-r2.

<img width="504" height="235" alt="image" src="https://github.com/user-attachments/assets/6cacce5f-7e2a-4ca6-b6f3-d2e80d2e1bc4" />

## Часть 7.

#### Шаг 1.

Создаем loopback-интерфейс 1 на маршрутизаторе rus-nsk-r1 с IP-адресом 192.168.101.1/24.

<img width="601" height="126" alt="image" src="https://github.com/user-attachments/assets/a175e8fd-de04-4237-936b-a9ba078dd788" />

#### Шаг 2.

Создаем loopback-интерфейс 3 на маршрутизаторе rus-msk-r2 с IP-адресом 192.168.103.3/24.

<img width="578" height="140" alt="image" src="https://github.com/user-attachments/assets/935fdb74-da9c-40a8-b643-eed26c534ce5" />

#### Шаг 3.

Нужно, чтобы rus-nsk-r1 и rus-msk-r2 объявляли созданные loopback-интерфейсы друг другу, испольузя RIPv2.

rus-nsk-r1:

<img width="422" height="74" alt="image" src="https://github.com/user-attachments/assets/dbf5bc08-bf3a-420d-b750-8b95bcace48b" />

rus-msk-r2:

<img width="435" height="79" alt="image" src="https://github.com/user-attachments/assets/cb08e917-3639-40b1-943b-41ec67c0f80f" />

#### Шаг 4.

Так как RIPv2 должен работать только на rus-nsk-r1 и rus-msk-r2, отключаем его на других устройствах.

rus-msk-r1:

<img width="483" height="86" alt="image" src="https://github.com/user-attachments/assets/89b826e2-ccc6-4f27-b75a-c4359d2f89ec" />

MLS:

<img width="468" height="81" alt="image" src="https://github.com/user-attachments/assets/ba3f7740-58b7-4517-9ff4-b3f2a82d4c03" />

#### Шаг 5.

IP-адреса при использовании туннелей должны быть 200.200.200.х/24, где х = ID маршуртизатора.

rus-nsk-r1:

<img width="587" height="128" alt="image" src="https://github.com/user-attachments/assets/7b66aec1-0732-43ef-a842-14d613161117" />

rus-msk-r2:

<img width="568" height="159" alt="image" src="https://github.com/user-attachments/assets/d20738ed-a7b6-42ed-9e63-d4412aa1bb77" />

#### Шаг 6.

Используя расширенный ping, проверяем, что loopback-интерфейс rus-nsk-r1 может пинговать loopback-интерфейс rus-msk-r2.

<img width="580" height="310" alt="image" src="https://github.com/user-attachments/assets/8a2a9c03-f8cd-4c10-946a-13e5e10ced0e" />

## Часть 8.

#### Шаг 1.

Настраиваем MLS и роутеры в Москве и Новосибирске на использование сервера 10.0.0.100 в качестве защищенного NTP-сервера, используя ключ 1 "cisco", а также в качестве Syslog-сервера.

Сначала настраиваем rus-nsk-r1.

<img width="641" height="131" alt="image" src="https://github.com/user-attachments/assets/51b7b75b-9f31-4b12-bfa9-bbb66bfac3b5" />

Настраиваем rus-msk-r1.

<img width="653" height="155" alt="image" src="https://github.com/user-attachments/assets/e13866a2-6c8b-4183-b8b5-cf52009adf00" />

Настраиваем rus-msk-r2.

<img width="655" height="169" alt="image" src="https://github.com/user-attachments/assets/7fb3c0dc-6a4f-4d52-856d-e557026b345c" />

Настраиваем MLS.

<img width="649" height="151" alt="image" src="https://github.com/user-attachments/assets/93794b98-5c1e-4279-a7df-e2b474b58c2c" />

#### Шаг 2.

Включаем SNMP на rus-msk-r1 и rus-msk-r2, используя пароль "cisco" для сообщений set и get.

Производим настройу на rus-msk-r1.

<img width="591" height="67" alt="image" src="https://github.com/user-attachments/assets/195ff541-6397-4c1e-91d2-a64eab373287" />

Настраиваем на rus-msk-r2.

<img width="619" height="55" alt="image" src="https://github.com/user-attachments/assets/9c19d28e-5c82-42c0-87a1-1550b7a27b50" />

#### Шаг 3.

Включаем telnet на rus-msk-r2, используя сервер 10.0.0.100 в качестве ААА-сервера в качестве первого методо аутентификации. В случае его недоступности rus-msk-r2 должен использовать локальное имя пользователя и пароль. 

<img width="520" height="99" alt="image" src="https://github.com/user-attachments/assets/046118fc-bbfe-4b1b-ae5d-e9b0e1918eed" />

#### Шаг 4.

Настраиваем rus-msk-r1 на использование сервера 10.0.0.100 в качестве FTP-сервера, используя имя пользователя "cisco" и пароль "cisco".

<img width="358" height="45" alt="image" src="https://github.com/user-attachments/assets/07c294e1-aad5-469e-965e-6fc0ab8da49b" />

#### Шаг 5.

Отправляем копию текущей конфигурации rus-msk-r1 на сервер 10.0.0.100, используя протокол FTP.

<img width="465" height="158" alt="image" src="https://github.com/user-attachments/assets/cf68b9b0-be54-4f79-864a-b215e075bf3b" />

#### Шаг 6.

Отправляем копию текущей конфигурации rus-msk-r2 на сервер 10.0.0.100, используя протокол TFTP.

<img width="425" height="173" alt="image" src="https://github.com/user-attachments/assets/a428d7e5-6975-4e26-be38-8d946301010f" />

#### Шаг 7.

Проверяем параметры загрузки на rus-msk-r2, чтобы убедиться, что не используем никаких команд boot system.

<img width="350" height="37" alt="image" src="https://github.com/user-attachments/assets/f51acd7f-ff6e-4caa-812d-1e0bf08b08a1" />

#### Шаг 8.

Проверяем, что rus-msk-r1 может пинговать или подключаться по telnet к rus-msk-r2, используя имя "standby".

<img width="572" height="171" alt="image" src="https://github.com/user-attachments/assets/33db2e9e-51fb-4b63-b4b4-2a7c80a99c1b" />

#### Шаг 9.

Изменяем локальное имя пользователя в rus-msk-r2, используя процедуру восстановления пароля.

Для этого перезагружаем устройство, а при входе в командную строку быстро прожимаем CTRL+C.

<img width="714" height="718" alt="image" src="https://github.com/user-attachments/assets/274ae05a-b216-4b09-9389-d4898be3be43" />

Перезагружаемся и входим без пароля на чистый роутер. Вовзращаем старую конфигурацию.

<img width="648" height="355" alt="image" src="https://github.com/user-attachments/assets/4b8823dd-e8bb-4ffe-8a15-fa5631ecdf37" />

Создаем нового локального пользователя с новым паролем.

<img width="663" height="264" alt="image" src="https://github.com/user-attachments/assets/7a6a5785-880b-4d48-ab66-bbd1467c4ac4" />

Возвращаем роутер в нормальный режим работы, чтобы при следующей загрузки он снова не стал "пустым".

<img width="527" height="146" alt="image" src="https://github.com/user-attachments/assets/a01c9637-44cb-49a6-a58e-2e0deba8c2e0" />

Теперь выходим и входим под новым пользователем.

<img width="661" height="233" alt="image" src="https://github.com/user-attachments/assets/0d880589-892b-45ea-90b9-28330b9024b7" />

## Полные конфигурации устройств (ДОПИСАТЬ)

### Устройства в Москве

#### rus-msk-r1

```
```

#### rus-msk-r2
```
```
#### rus-msk-s1
```
```

#### MLS
```
```

### Устройства в  Новосибирске

#### rus-msk-r1
```
```

#### rus-msk-s1
```
```

#### rus-msk-s2
