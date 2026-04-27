### .pkt файлы с выполненными лабораторными работами находятся в /pkt_voip.

## Лабораторная работа №2. Базовая настройка IP-телефонов в среде Cisco Packet Tracer

Цель работы: изучить построение сети IP-телефонии с помощью маршрутизатора, коммутатора и IP телефонов Cisco 7960 в среде Packet Tracer.

Собираем топологию сети.

<img width="539" height="286" alt="image" src="https://github.com/user-attachments/assets/75527a0f-e08c-4301-ac4e-897a5214d4e1" />

*Топология сети*

Изменяем имя маршрутизатора на CMERouter.

<img width="470" height="75" alt="image" src="https://github.com/user-attachments/assets/f35d225f-b00f-43cc-b991-3c42f3445395" />

*Смена имени маршрутизатора*

Настраиваем интерфейс fa0/0 на маршрутизаторе Cisco 2811 (CMERouter).

<img width="387" height="47" alt="image" src="https://github.com/user-attachments/assets/87d57c9e-b8b1-49b8-8ea6-76296b063d13" />

*Настройка интерфейса f0/0 на CMERouter*

Настраиваем DHCP-сервер для передачи голоса и данных на маршрутизаторе. Для этого создаем пул DHCP-адресов с названием VOICE. Указываем ip адрес нужного VLAN, в данном случае для передач данных и задаем сеть, в которой будет работать DHCP-сервер.

При настройке DHCP для передачи голоса необходимо включить опцию 150, чтобы IP-телефоны использовали настройки CallManager Express с TFTP сервера.

<img width="496" height="60" alt="image" src="https://github.com/user-attachments/assets/237b6a4c-a478-4974-8cc9-2b3c24069ce2" />

*Настройка DHCP-сервера на CMERouter*

Теперь нужно настроить CallManager Express, то есть телефонного сервиса в автоматическом режиме. В данном режиме ведется диалоговый обмен сообщениями, маршрутизатор только запрашивает необходимые параметры.

Задаем максимальное количество номеров, присваиваемых IP-телефонам.

Задаем максимальное количество IP-телефонов, которое зависит от модели маршрутизатора, для маршрутизатора 2811 – составляет 96 штук. В нашем случае – 5.

<img width="369" height="49" alt="image" src="https://github.com/user-attachments/assets/d4662379-1563-4180-80ef-832dde09b695" />

*Настройка CallManager Express*

Вводим IP-адрес голосового шлюза.

<img width="484" height="20" alt="image" src="https://github.com/user-attachments/assets/3fc8af27-0c78-4165-a153-8e984b356029" />

*Назначение IP-адреса голосового шлюза*

Настраиваем автоматическое назначение внешних номеров.

<img width="338" height="35" alt="image" src="https://github.com/user-attachments/assets/0cc954b0-0250-4f3d-8ad3-ce9bae80a077" />

Для настройки интерфейса управления коммутатором в сети VLAN нужно назначить диапазоны портов.

<img width="411" height="65" alt="image" src="https://github.com/user-attachments/assets/59a01173-8798-4f96-8cef-0cf02900dd89" />

*Назначение диапазонов портов на коммутаторе*

Для возможности дальнейшего общения необходимо дополнительная конфигурация. Для этого создаем первую логическую «телефонную» линию. Каждому телефону можно определить несколько таких логический линий со своими номерами.

<img width="634" height="200" alt="image" src="https://github.com/user-attachments/assets/e90dacd7-f41c-498c-80f7-9af3bd91da3e" />

*Телефонная линия*

Настраиваем коммутатор.

Теперь проверяем работу конфигурации.

Первый IP-телефон получил IP-адрес и номер телефона от маршрутизатора.

<img width="687" height="698" alt="image" src="https://github.com/user-attachments/assets/0e82c7f0-b8e5-4dd6-81ff-727b035912d7" />

*Первый IP-телефон*

Второй IP-телефон также получил IP-адрес и номер телефона от маршрутизатора.

<img width="688" height="697" alt="image" src="https://github.com/user-attachments/assets/cdb4c5cb-7c87-4de9-8694-823c045e4b39" />

*Второй IP-телефон*

Позвоним с первого телефона на второй. Нажимаем на трубку - она поднимается и запрашивает ввести номер телефона. Вводим - на второй телефон поступает звонок. Чтобы принять звонок, нужно также поднять трубку.

<img width="1410" height="705" alt="image" src="https://github.com/user-attachments/assets/8c208762-f5aa-411c-bea0-a317778540c5" />

*Вызов*

<img width="1399" height="703" alt="image" src="https://github.com/user-attachments/assets/d8a25756-d644-4196-902b-44e78fcbc309" />

*Принятый вызов*

#### Полные конфигурации устройств

#### CMERouter

```
Current configuration : 1092 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname CMERouter
!
!
!
!
!
ip dhcp pool VOICE
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.1
 option 150 ip 192.168.10.1
!
!
!
ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10175N11-
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
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 192.168.10.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Vlan1
 no ip address
 shutdown
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
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 192.168.10.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 54001
!
ephone-dn 2
 number 54002
!
ephone 1
 device-security-mode none
 mac-address 0030.F27A.8C22
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 000D.BDD0.5631
 type 7960
 button 1:2
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end


CMERouter#
%IPPHONE-6-REGISTER: ephone-2 IP:192.168.10.3 Socket:2 DeviceType:Phone has registered.

%IPPHONE-6-REGISTER: ephone-1 IP:192.168.10.2 Socket:2 DeviceType:Phone has registered.

```

#### Switch

```
Current configuration : 1164 bytes
!
version 12.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
!
interface FastEthernet0/2
 switchport mode access
 switchport voice vlan 1
 spanning-tree portfast
!
interface FastEthernet0/3
 switchport mode access
 switchport voice vlan 1
 spanning-tree portfast
!
interface FastEthernet0/4
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

#### Контрольные вопросы

1. SIP (Session Initiation Protocol) - протокол для установки связи? используется для настройки IP-телефонов через сервер Generic Server.

2. Для Voice VLAN на коммутаторе создается отдельный номер VLAN. Порт настраивается так, чтобы принимать нетегированные данные от ПК и тегированный голос от телефона. Пример настройки в Cisco PT:

- vlan 10

- int fa0/1
  
- switchport mode access.
  
- switchport voice vlan 10

3. Cisco Call Manager - это сервис на отдельном сервере для быстрой настройки телефонов через меню.

4. Cisco Call Manager Express - это функция внутри роутера для управления звонками через командную строку.

5. Cisco Call Manager - это сервис на отдельном сервере для простой настройки через меню, а Cisco Call Manager Express — это функция внутри роутера, которая настраивается через консоль.

6. Spanning-tree portfast переводит порт коммутатора в состояние немедленной пересылки трафика, минуя этапы прослушивания и обучения протокола STP, чтобы компьютер или IP-телефон получали сеть сразу, а не ждали 30–50 секунд.

7. Для качественной передачи голоса в сети должны соблюдаться следующие параметры: низкая задержка, минимальное дрожание, потеря пакетов, приоритет (QoS).

8. Команды конфигурирования DHCP-сервера на маршрутизаторе:

- ip dhcp excluded-address 192.168.1.1 192.168.1.10
  
- ip dhcp pool VOICE_POOL
  
- network 192.168.1.0 255.255.255.0
  
- default-router 192.168.1.1
  
- option 150 ip 192.168.1.1

## Лабораторная работа №3. Настройка конфигурации Cisco CallManager Express на маршрутизаторе Cisco 2811

Согласно указанному рисунку, собираем топологию сети.

<img width="734" height="330" alt="image" src="https://github.com/user-attachments/assets/25fc7325-ef8e-4b70-8d3c-b5855e47de33" />

*Топология сети*

Изменяем имя маршрутизатора на CMERouter. Отключаем синтаксис ввода слов от DNS-серверов.

<img width="479" height="91" alt="image" src="https://github.com/user-attachments/assets/cd0b4f36-8896-436d-8f84-e7e4da07e606" />

*Смена имени устройства и отключение синтаксиса ввода слов от DNS-серверов*

Задаем пароли для защиты маршрутизатора как в удаленном режиме, так и в режиме консоли.

<img width="322" height="140" alt="image" src="https://github.com/user-attachments/assets/a8efba1b-07ea-4c23-a13d-6830c8f0bf60" />

*Задача паролей для удаленного и консольного режимов*

Настраиваем интерфейс fa0/0 маршрутизатора CMERouter: настраиваем IP-адрес интерфейса и поднимаем его.

<img width="610" height="143" alt="image" src="https://github.com/user-attachments/assets/e2f788c8-2f26-4828-9082-b8dc5dc115cd" />

*Настройка интерфейса fa0/0*

Для автоматической настройки компьютера и IP-телефонов в сети надо настроить DHCP сервер на маршрутизаторе Cisco 2811. В конфигурационном режиме создаем пул DHCP адреса с названием VOICE. Задаем сеть, в которой будет работать DHCP-сервер и указываем IP-адрес VLAN для передачи данных.

<img width="284" height="20" alt="image" src="https://github.com/user-attachments/assets/24617d38-c42b-4123-89b0-85fb81ba9043" />

*Создание пула DHCP*

<img width="450" height="17" alt="image" src="https://github.com/user-attachments/assets/fe5b234a-d31f-4df0-b0d8-ad882545a413" />

*Задача сети, в которой будет работать DHCP-сервер*

<img width="378" height="22" alt="image" src="https://github.com/user-attachments/assets/f0dd777b-9a26-412a-b31e-5bb406b3247c" />

*Указание IP-адреса VLAN для передачи данных*

При настройке DHCP для передачи голоса необходимо включить опцию 150. Эта опция нужна для того чтобы IP-телефоны использовали настройки CallManager Express с TFTP сервера.

<img width="368" height="25" alt="image" src="https://github.com/user-attachments/assets/8660da30-ae47-4741-ab0b-164ce639b538" />

*Включение опции 150*

После проделанных настроек необходимо заняться настройкой CallManager Express, то есть телефонного сервиса в автоматическом режиме. В данном режиме ведётся диалоговый обмен сообщениями, маршрутизатор только запрашивает необходимые параметры. Включаем данный сервис.

<img width="295" height="21" alt="image" src="https://github.com/user-attachments/assets/0794033a-da09-4d40-bc95-07a4a2bc2c91" />

*Включение телефонного сервиса*

Задаем максимальное количество IP-телефонов.

<img width="321" height="18" alt="image" src="https://github.com/user-attachments/assets/673eba5b-92d2-4dc6-a598-47e804880656" />

*Задача максимального количества IP-телефонов*

Задаем IP-адрес голосового шлюза. 

<img width="502" height="22" alt="image" src="https://github.com/user-attachments/assets/01f64fd2-c149-4c6b-a491-537b7c764d29" />

*Задача IP-адреса голосового шлюза*

Настраиваем автоматическое назначение внешних номеров.

<img width="353" height="34" alt="image" src="https://github.com/user-attachments/assets/2a67fa40-eb91-4b3b-aa71-b1ff08c5bc9a" />

*Настройка автоматического назначения внешних номеров*

Настраиваем интерфейс управления коммутатором в сети VLAN через назначение диапазона портов.

<img width="382" height="49" alt="image" src="https://github.com/user-attachments/assets/5b42e9ad-acc4-4716-93b6-659846a5bcb2" />

*Настройка интерфейса управления коммутатором*

Для возможности дальнейшего общения необходима дополнительная конфигурация. Для этого создаём первую логическую «телефонную» линию (directory number).

<img width="326" height="139" alt="image" src="https://github.com/user-attachments/assets/0d7af8ff-b433-4360-b6a0-f8ba6c4c7924" />

*Телефонная линия*

Проверяем: звонок с первого IP-телефона на второй.

<img width="1429" height="693" alt="image" src="https://github.com/user-attachments/assets/40f8f678-e388-476c-bd08-cd9f7bf08616" />

*Входящий вызов с первого IP-телефона на второй*

<img width="1415" height="702" alt="image" src="https://github.com/user-attachments/assets/033d4d11-d593-419c-aa0f-409180cf5bba" />

*Принятый вызов с первого IP-телефона на второй*

Теперь сделаем звонок с третьего IP-телефона на первый.

<img width="1460" height="687" alt="image" src="https://github.com/user-attachments/assets/07948f7e-243a-4df7-8b8d-5989808c3e08" />

*Входящий вызов с третьего IP-телефона на первый*

<img width="1440" height="683" alt="image" src="https://github.com/user-attachments/assets/a9266256-aa62-40e6-880e-e96594e633fc" />

*Принятый вызов с третьего IP-телефона на первый*

#### Полные конфигурации устройств

#### CMERouter

```
Current configuration : 1310 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname CMERouter
!
!
!
!
!
ip dhcp pool VOICE
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.1
 option 150 ip 192.168.10.1
!
!
!
ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10174C1E-
!
!
!
!
!
!
!
!
!
no ip domain-lookup
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
 ip address 192.168.10.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Vlan1
 no ip address
 shutdown
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
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 192.168.10.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 54001
!
ephone-dn 2
 number 54002
!
ephone-dn 3
 number 54003
!
ephone 1
 device-security-mode none
 mac-address 00E0.8FE8.B530
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 0002.16C6.72A8
 type 7960
 button 1:3
!
ephone 3
 device-security-mode none
 mac-address 000D.BD29.C269
 type 7960
 button 1:2
!
line con 0
 password cisco
 logging synchronous
 login
!
line aux 0
!
line vty 0 4
 password cisco
 logging synchronous
 login
!
!
!
end
```
#### SwitchA

```
Current configuration : 1391 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
!
!
!
mls qos
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
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/2
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/3
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/4
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/5
 switchport mode access
 switchport voice vlan 1
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
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
!
end
```
#### Контрольные вопросы

1. SIP (Session Initiation Protocol) - протокол для установки связи? используется для настройки IP-телефонов через сервер Generic Server.

2. Для Voice VLAN на коммутаторе создается отдельный номер VLAN. Порт настраивается так, чтобы принимать нетегированные данные от ПК и тегированный голос от телефона. Пример настройки в Cisco PT:

- vlan 10

- int fa0/1
  
- switchport mode access.
  
- switchport voice vlan 10

3. Cisco Call Manager - это сервис на отдельном сервере для быстрой настройки телефонов через меню.

4. Cisco Call Manager Express - это функция внутри роутера для управления звонками через командную строку.

5. Cisco Call Manager - это сервис на отдельном сервере для простой настройки через меню, а Cisco Call Manager Express — это функция внутри роутера, которая настраивается через консоль.

6. Spanning-tree portfast переводит порт коммутатора в состояние немедленной пересылки трафика, минуя этапы прослушивания и обучения протокола STP, чтобы компьютер или IP-телефон получали сеть сразу, а не ждали 30–50 секунд.

7. Для качественной передачи голоса в сети должны соблюдаться следующие параметры: низкая задержка, минимальное дрожание, потеря пакетов, приоритет (QoS).

8. Команды конфигурирования DHCP-сервера на маршрутизаторе:

- ip dhcp excluded-address 192.168.1.1 192.168.1.10
  
- ip dhcp pool VOICE_POOL
  
- network 192.168.1.0 255.255.255.0
  
- default-router 192.168.1.1
  
- option 150 ip 192.168.1.1

## Лабораторная работа №4. Конфигурация VOIP в среде Cisco Packet Tracer

Согласно указанному рисунку, собираем топологию сети.

<img width="1031" height="551" alt="image" src="https://github.com/user-attachments/assets/83de18b0-2925-46f2-a2c3-7c222b9c9688" />

*Топология сети*

На свитче создаем VLAN и присваиваем им имена.

<img width="402" height="133" alt="image" src="https://github.com/user-attachments/assets/2455c820-10b5-41f5-98d9-bb628dc77ba9" />

*Создание VLAN на коммутаторе и присвоение им имен*

Настраиваем VLAN 99.

<img width="583" height="138" alt="image" src="https://github.com/user-attachments/assets/7e6f1c3f-e937-4211-a0c3-6749f38f55e4" />

*Настройка VLAN 99*

Задаем маршрут по умолчанию.

<img width="392" height="61" alt="image" src="https://github.com/user-attachments/assets/f3bc0886-815e-4921-be6c-7a67fc1a317d" />

*Настройка маршрута по умолчанию*

Настраиваем интерфейс управления коммутатором в сети VLAN через назначение диапазона портов.

<img width="391" height="58" alt="image" src="https://github.com/user-attachments/assets/92438c91-60b3-4297-aa19-2cf85ba52b13" />

*Настройка интерфейса управления коммутатором в сети VLAN*

Переходим к настройкам на маршрутизаторе.

Включаем интерфейс fa0/0.

<img width="625" height="129" alt="image" src="https://github.com/user-attachments/assets/58182dbd-b62c-4f2e-a49a-828fbd1d559b" />

*Включение интерфейса fa0/0 на роутере*

Создаем логические подынтерфейсы для VLAN 10, VLAN 20 и VLAN 99.

<img width="653" height="361" alt="image" src="https://github.com/user-attachments/assets/61f1ad4a-7dd0-4315-8d7b-1119afa0c2ef" />

*Создание и настройка логических подынтерфейсов для VLAN 10, VLAN 20, VLAN 99*

Исключаем из пула адрес интерфейса маршрутизатора и DNS-сервера.

<img width="498" height="34" alt="image" src="https://github.com/user-attachments/assets/c8791c5f-1a1c-4a93-9451-9ef34b380d15" />

*Исключение адресов из пула*

Настраиваем DHCP-сервера для передачи голоса и данных на маршрутизаторе.

<img width="505" height="116" alt="image" src="https://github.com/user-attachments/assets/98cbc738-060f-499f-8cf4-bdf0bc7fbdc5" />

*Настройка DHCP-серверов*

Настраиваем телефонный сервис в автоматическом режиме.

<img width="490" height="71" alt="image" src="https://github.com/user-attachments/assets/0b426b12-0f1d-4de6-b0c6-18ba5cebdd81" />

*Настройка телефонного сервиса*

Присваиваем номера для всех IP-телефонов в сети.

<img width="638" height="234" alt="image" src="https://github.com/user-attachments/assets/d98bd393-e205-4f8a-acfc-d1e7cac885d2" />

*Присвоение номеров для IP-телефонов*

<img width="358" height="204" alt="image" src="https://github.com/user-attachments/assets/2c8014db-8fbb-4f9f-a168-abdf55b2b562" />

*Настройка IP-телефонов*

#### Полная конфигурация устройств.

#### Router

```
Current configuration : 1610 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Router
!
!
!
!
ip dhcp excluded-address 192.168.10.1 192.168.10.9
ip dhcp excluded-address 192.168.20.1 192.168.20.9
!
ip dhcp pool Data
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.1
ip dhcp pool Voice
 network 192.168.20.0 255.255.255.0
 default-router 192.168.20.1
 option 150 ip 192.168.20.1
!
!
!
ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10171931-
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
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.1 255.255.255.0
!
interface FastEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.1 255.255.255.0
!
interface FastEthernet0/0.99
 encapsulation dot1Q 99 native
 ip address 192.168.99.1 255.255.255.0
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Vlan1
 no ip address
 shutdown
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
telephony-service
 max-ephones 3
 max-dn 3
 ip source-address 192.168.20.1 port 2000
!
ephone-dn 1
 number 101
!
ephone-dn 2
 number 102
!
ephone-dn 3
 number 103
!
ephone 1
 device-security-mode none
 mac-address 00D0.D389.5DE5
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 00E0.F737.1C36
 type 7960
 button 1:2
!
ephone 3
 device-security-mode none
 mac-address 0005.5E34.7BE9
 type 7960
 button 1:3
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

### Switch

```
Current configuration : 1398 bytes
!
version 12.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport trunk native vlan 99
 switchport mode trunk
!
interface FastEthernet0/2
 switchport access vlan 10
 switchport mode access
 switchport voice vlan 20
!
interface FastEthernet0/3
 switchport access vlan 10
 switchport mode access
 switchport voice vlan 20
!
interface FastEthernet0/4
 switchport access vlan 10
 switchport mode access
 switchport voice vlan 20
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
interface Vlan1
 no ip address
 shutdown
!
interface Vlan99
 ip address 192.168.99.10 255.255.255.0
!
ip default-gateway 192.168.99.1
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

#### Контрольные вопросы.

1. SIP-телефоны - это конечные устройства связи, которые используют протокол SIP для установления связи. Они используют интернет-соединение вместо традиционных телефонных линий для передачи голоса.

2. Voice over IP - это технология, позволяющая реализовать передачу голосового трафика поверх сетевого протокола IP. Это означает инкапсуляцию звуковых данных в IP-пакеты, что позволяет использовать одну и ту же сетевую инфраструктуру как для данных, так и для голоса.

3. VoIP - это методология и группа технологий, обеспечивающих передачу голосовых сообщений, видеосессий и других мультимедийных данных через IP-сети.

4. Cisco Networking Academy (NetAcad), документация Cisco по настройке функций телефонии (CME — Call Manager Express).

5. Это физические или виртуальные устройства, которые подключаются к коммутатору. Они преобразуют аналоговый голос в цифровой вид и обратно, а также поддерживают такие функции, как питание через Ethernet (PoE) и визуальную индикацию вызовов.

6. IP-телефония включает в себя передачу звука (голосового трафика) и инфраструктуру: маршрутизаторы с поддержкой телефонии, коммутаторы с поддержкой Voice VLAN и конечные IP-аппараты, объединенные в единую управляемую сеть.

7. VoIP-телефон - это устройство, которое реализует функции IP-телефона.

8. Маршрут по умолчанию настраивается на маршрутизаторе (Router) для пересылки трафика, если в таблице маршрутизации нет совпадений для сети назначения. Это делается в режиме глобальной конфигурации командой:

- Router(config)# ip route 0.0.0.0 0.0.0.0 [адрес_следующего_узла или выходной_интерфейс]

Это позволяет устройствам из локальной сети выходить за её пределы.

## Лабораторная работа №7. Построение сети IP-телефонии между удаленными маршрутизаторами в среде Cisco Packet Tracer

Собираем топологию сети.

<img width="1440" height="555" alt="image" src="https://github.com/user-attachments/assets/74b82b1c-1287-4a37-b061-b394b749688e" />

*Топология сети*

Меняем названия маршрутизаторов на RouterA и RouterB.

<img width="479" height="58" alt="image" src="https://github.com/user-attachments/assets/0a1a626f-e0b8-4113-83d1-c131a44ab5dd" />

*Смена имени первого маршрутизатора на RouterA*

<img width="488" height="44" alt="image" src="https://github.com/user-attachments/assets/e85cf841-2060-46d4-acd2-387a6b11095d" />

*Смена имени второго маршрутизатора на RouterB

Настраиваем интерфейс f0/0 на маршрутизаторе RouterA.

<img width="607" height="142" alt="image" src="https://github.com/user-attachments/assets/f2a9a275-39b0-480b-a360-e1d8cb0b81e1" />

*Конфигурация f0/0 на RouterA*

Настраиваем интерфейс f0/0 на маршрутизаторе RouterB.

<img width="622" height="139" alt="image" src="https://github.com/user-attachments/assets/b68ce1b9-5da2-4ccc-8e79-f630d71c4cca" />

*Конфигурация f0/0 на RouterB*

Настраиваем интерфейс s0/3/0 на маршрутизаторах Cisco 2811.

<img width="426" height="61" alt="image" src="https://github.com/user-attachments/assets/87aebcd6-c398-4ac8-b346-079ceab10efa" />

*Конфигурация s0/3/0 на RouterA*

<img width="431" height="129" alt="image" src="https://github.com/user-attachments/assets/ecb213ab-6648-48b2-adb0-b2e70485389f" />

*Конфигурация s0/3/0 на RouterB*

Для автоматической настройки компьютеров и IP-телефонов нужно настроить DHCP-сервер на маршрутизаторе.

В конфигурационном режиме создаем пул DHCP-адреса с названием T1. Задаем сеть, в которой будет работать DHCP-сервер. Указываем IP-адрес нужного VLAN для передачи данных. Включаем опцию 150.

<img width="460" height="74" alt="image" src="https://github.com/user-attachments/assets/19161903-3ea1-4603-a3ee-4c936f554012" />

*Настройка на RouterA*

<img width="404" height="71" alt="image" src="https://github.com/user-attachments/assets/39fe5069-ae8b-45c3-8f80-5fd5c518799a" />

*Настройка на RouterB*

Настроим динамическую маршрутизацию на основе протокола RIPv2 для передачи информации между маршрутизаторами в сети.

<img width="343" height="66" alt="image" src="https://github.com/user-attachments/assets/1687f4f3-afc8-47f1-b97b-478db0c9f66f" />

*Настройка на RouterA*

<img width="314" height="64" alt="image" src="https://github.com/user-attachments/assets/4047d9a7-64cf-4df7-b46e-8e5d0b39f068" />

*Настройка на RouterB*

Переходим к настройке телефонного сервиса в автоматическом режиме. Здесь мы задаем максимальное количество присваиваемых номеров, максимальное количество IP-телефонов, IP-адрес голосового шлюза и настраиваем автоматическое назначение внешних номеров.

<img width="485" height="86" alt="image" src="https://github.com/user-attachments/assets/53a2574b-2a10-4f13-b51d-ed0a3ce2f0ea" />

*Настройка на RouterA*

<img width="481" height="87" alt="image" src="https://github.com/user-attachments/assets/dd71156e-0d6b-487c-883e-60d0d06514ec" />

*Настройка на RouterB*

На коммутаторах меняем имя устройства и назначаем диапазоны портов.

<img width="367" height="67" alt="image" src="https://github.com/user-attachments/assets/aaa779f0-5e3d-4a0f-94d6-dc9fe5d45b99" />

*Настройка на SwitchA*

<img width="382" height="68" alt="image" src="https://github.com/user-attachments/assets/d75e13d9-de8f-46c4-bd8c-b204ed5625bc" />

*Настройка на SwitchB*

Переходим к настройке телефонных линий на маршрутизаторах.

<img width="628" height="257" alt="image" src="https://github.com/user-attachments/assets/ce0f4cb2-c82c-4a0b-9381-ceb578e8225b" />

*Настройка на RouterA*

<img width="641" height="270" alt="image" src="https://github.com/user-attachments/assets/39159e62-b806-436a-a3b2-09184093b1d3" />

*Настройка на RouterB*

Надо настроить

<img width="414" height="45" alt="image" src="https://github.com/user-attachments/assets/08261ac2-f717-48f5-b68c-3025310a8e02" />

*Настройка на RouterA*

<img width="438" height="49" alt="image" src="https://github.com/user-attachments/assets/4c9f986f-2c3f-4be6-aed9-9c6f65ffb7a6" />

*Настройка на RouterB*

Проверяем правильность настройки: позвоним с IP-телефона с номером 1101 на IP-телефон с номером 1201.

<img width="1411" height="715" alt="image" src="https://github.com/user-attachments/assets/cfd358ed-2072-483a-907d-4612126cf378" />

*Входящий вызов*

<img width="1421" height="710" alt="image" src="https://github.com/user-attachments/assets/446c99d5-4939-4683-a096-099d5f047eae" />

*Принятый вызов*

Проведем ICMP-запрос с ПК, подключенного к SwitchA к ПК, подключенному к SwitchB и наоборот.

<img width="480" height="228" alt="image" src="https://github.com/user-attachments/assets/ac289781-4b8f-4b3f-ac75-217f15ebe318" />

*ping с PC-A к PC-B*

<img width="478" height="227" alt="image" src="https://github.com/user-attachments/assets/1c6fdbd2-5225-4c55-920a-7d144ef9469e" />

*ping с PC-B к PC-A*

#### Полные конфигурации устройств

#### RouterA

```
Current configuration : 1495 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname RouterA
!
!
!
!
!
ip dhcp pool T1
 network 192.168.1.0 255.255.255.224
 default-router 192.168.1.1
 option 150 ip 192.168.1.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX1017AY91-
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
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 192.168.1.1 255.255.255.224
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 10.0.1.1 255.255.255.252
 clock rate 64000
!
interface Serial0/3/1
 no ip address
 clock rate 2000000
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router rip
 version 2
 network 10.0.0.0
 network 192.168.1.0
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
dial-peer voice 1 voip
 destination-pattern 12..
 session target ipv4:10.0.1.2
!
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 192.168.1.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 1101
!
ephone-dn 2
 number 1102
!
ephone-dn 3
 number 1103
!
ephone 1
 device-security-mode none
 mac-address 0040.0B98.2E5E
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 000C.85C6.0E74
 type 7960
 button 1:2
!
ephone 3
 device-security-mode none
 mac-address 00D0.FF27.86C3
 type 7960
 button 1:3
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```
#### RouterB

```
Current configuration : 1471 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname RouterB
!
!
!
!
!
ip dhcp pool T1
 network 172.16.1.0 255.255.255.224
 default-router 172.16.1.1
 option 150 ip 172.16.1.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10176GZL-
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
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 172.16.1.1 255.255.255.224
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 10.0.1.2 255.255.255.252
!
interface Serial0/3/1
 no ip address
 clock rate 2000000
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router rip
 version 2
 network 10.0.0.0
 network 172.16.0.0
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
dial-peer voice 1 voip
 destination-pattern 11..
 session target ipv4:10.0.1.1
!
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 172.16.1.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 1201
!
ephone-dn 2
 number 1202
!
ephone-dn 3
 number 1203
!
ephone 1
 device-security-mode none
 mac-address 0004.9A6A.8DEC
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 0001.9618.62E2
 type 7960
 button 1:2
!
ephone 3
 device-security-mode none
 mac-address 0060.3EA7.84D5
 type 7960
 button 1:3
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

#### SwitchA

```
Current configuration : 1326 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SwitchA
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/2
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/3
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/4
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/5
 switchport mode access
 switchport voice vlan 1
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

#### SwitchB

```
Current configuration : 1326 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SwitchB
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/2
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/3
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/4
 switchport mode access
 switchport voice vlan 1
!
interface FastEthernet0/5
 switchport mode access
 switchport voice vlan 1
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

#### Контрольные вопросы.

1. Маршрутизируемые протоколы (Routed Protocols) - это наборы правил, которые определяют структуру пакетов данных и систему адресации, позволяя доставлять информацию от одного узла к другому через сеть.
   
Примеры: IPv4, IPv6, а также устаревшие IPX и AppleTalk.

Протоколы маршрутизации (Routing Protocols) - это инструменты, с помощью которых маршрутизаторы обмениваются данными о доступных сетях, строят таблицы маршрутизации и выбирают наилучший путь для передачи трафика.

Примеры: RIP, OSPF, EIGRP, BGP.

3. Протокол RIP является дистанционно-векторным протоколом, использующим метрику «количество переходов» (hop count).

Для предотвращения петель маршрутизации используются следующие механизмы:

- Split Horizon: запрещает маршрутизатору отправлять информацию о маршруте через тот же интерфейс, от которого эта информация была получена.
  
- Poisoned Reverse: маршрутизатор помечает вышедший из строя маршрут как недостижимый (метрика 16) и рассылает это обновление всем соседям.
  
- Hop-count limit: устанавливает максимальное расстояние до сети в 15 хопов; сеть на расстоянии 16 хопов считается недоступной, что разрывает бесконечные циклы.

В сравнении с IGRP, RIP ограничен 15 хопами и учитывает только расстояние, тогда как IGRP (проприетарный протокол Cisco) использует сложную метрику (пропускная способность, задержка) и поддерживает до 255 хопов.

3. Настройка DHCP на маршрутизаторе Cisco:

- Исключение адресов, которые не должны выдаваться клиентам: ip dhcp excluded-address [start_ip] [end_ip].
  
- Создание пула адресов: ip dhcp pool [name].
  
- Указание подсети: network [network_address] [mask].
  
- Настройка шлюза по умолчанию: default-router [ip_address].
  
- Настройка DNS-сервера (опционально): dns-server [ip_address]

4. Последовательное соединение между маршрутизаторами используется для организации WAN-каналов. Один конец кабеля (DCE) должен задавать синхронизацию (команда clock rate), а другой (DTE) — подстраиваться под неё. Передача данных осуществляется побитово (последовательно) с использованием протоколов канального уровня, таких как HDLC (по умолчанию для Cisco) или PPP.

5. В реальных сетях скорости зависят от стандартов линий связи (например, T1 — 1.544 Мбит/с, E1 — 2.048 Мбит/с). В Cisco Packet Tracer при настройке параметра clock rate доступны значения от 1200 бит/с до 4 000 000 бит/с (4 Мбит/с) и выше, в зависимости от модели интерфейса.

6. Для обеспечения качественной передачи голоса (QoS) и работы одного голосового потока с использованием кодека G.711 (без сжатия) требуется полоса пропускания около 80-90 Кбит/с (с учетом заголовков IP/UDP/RTP). При использовании сжимающих кодеков (например, G.729) минимальная планка может опускаться до 24-30 Кбит/с.

7. Выход из IP-сети в телефонную сеть общего пользования (PSTN) осуществляется через специальный голосовой шлюз (Voice Gateway). Шлюз преобразует пакеты IP-телефонии (протоколы SIP или SCCP) в аналоговые или цифровые сигналы телефонии. На маршрутизаторе настраиваются соответствующие dial-peer, указывающие направление вызова на внешние линии.

8. Для присвоения номера используется команда number [номер] внутри режима конфигурации конкретного телефонного канала.
   
Пример:

- Router(config-telephony)# dn 1
  
- Router(config-ephone-dn)# number 1001

## Лабораторная работа №8. Построение сети IP-телефонии между удаленными маршрутизаторами

Собираем топологию сети по заданному примеру.

*Топология сети*

Присваиваем имена устройствам.

<img width="462" height="53" alt="image" src="https://github.com/user-attachments/assets/b9414f96-d4b6-4297-9b43-4daf071f1fad" />

*Присваивание имени CMERouter*

<img width="478" height="53" alt="image" src="https://github.com/user-attachments/assets/9c74eb67-59d9-4dd8-a677-49e4ff1a756c" />

*Присваивание имени RemoteRouter*

<img width="435" height="46" alt="image" src="https://github.com/user-attachments/assets/4169c7d8-247f-40c1-ae8c-930c364ed155" />

*Присваивание имени CMESwitch*

<img width="499" height="71" alt="image" src="https://github.com/user-attachments/assets/1dd626f7-f9e7-450f-820f-79fb7caf6769" />

*Присваивание имени RemoteSwitch*

Настраиваем интерфейс S0/3/0 на CMERouter: задаем IP-адрес, маску подсети и скорость передачи.

<img width="457" height="60" alt="image" src="https://github.com/user-attachments/assets/e69dfa58-1a58-4b58-b646-cbdc688123fa" />

*Настройка s0/3/0 на CMERouter*

Настроим маршрутизацию по протоколу EIGRP.

<img width="328" height="63" alt="image" src="https://github.com/user-attachments/assets/1e016e37-dda4-47b8-8a65-e5f4ce7ec2e6" />

*Настройка маршрутизации по протоколу EIGRP на CMERouter*

Настраиваем интерфейс S0/3/0 на RemoteRouter: задаем IP-адрес, маску подсети и скорость передачи.

<img width="446" height="110" alt="image" src="https://github.com/user-attachments/assets/fb53ab21-00cd-46bf-a27c-ca766569428b" />

*Настройка s0/3/0 на RemoteRouter*

Проверяем соединение между маршрутизаторами ping-запросом с RemoteRouter на CMERouter.

<img width="532" height="118" alt="image" src="https://github.com/user-attachments/assets/7ddd12c2-0772-4e6a-8327-9011e0c1f743" />

*ping с RemoteRouter на CMERouter*

Создаем подынтерфейсы для VLAN передачи голоса и данных: VLAN 40 - для данных, VLAN 30 - для голоса, а также закрепляем для них IP-адреса.

*Настройка подынтерфейсов для VLAN передачи голоса и данных на RemoteRouter*
