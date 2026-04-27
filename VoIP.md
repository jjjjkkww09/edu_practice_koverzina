### .pkt файлы с выполненными лабораторными работами находятся в /pkt_voip.

## Лабораторная работа №2. Базовая настройка IP-телефонов в среде Cisco Packet Tracer

Цель работы: изучить построение сети IP-телефонии с помощью маршрутизатора, коммутатора и IP телефонов Cisco 7960 в среде Packet tracer.

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



## Лабораторная работа №7. Построение сети IP-телефонии между удаленными маршрутизаторами в среде Cisco Packet Tracer

тут будет лаба

## Лабораторная работа №8. Построение сети IP-телефонии между удаленными маршрутизаторами

тут будет лаба
