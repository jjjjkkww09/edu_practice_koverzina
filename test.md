Собираем топологию сети по заданной схеме.

*Топология сети*

Сразу переименуем все устройства.

<img width="425" height="69" alt="image" src="https://github.com/user-attachments/assets/78cf268f-26e1-40e4-8d3d-fd70852b1563" />

*CMERouter*

<img width="519" height="78" alt="image" src="https://github.com/user-attachments/assets/9339bd14-a95f-40f6-8c08-6968b6e0bdc2" />

*CMESwitch*

<img width="437" height="72" alt="image" src="https://github.com/user-attachments/assets/f4e37fb2-250c-42dd-88ae-71738d245c99" />

*RemoteRouter*

<img width="479" height="68" alt="image" src="https://github.com/user-attachments/assets/a615855b-2369-4d69-9e7f-c8ac0beac304" />

*RemoteSwitch*

Настраиваем порт Serial 0/3/0 на CMERouter.

<img width="403" height="79" alt="image" src="https://github.com/user-attachments/assets/ce4be4c0-0080-4ebd-a995-54e542562450" />

*Настройка s0/3/0 на CMERouter*

Настроим EIGRP на устройстве CMERouter.

<img width="346" height="66" alt="image" src="https://github.com/user-attachments/assets/4d0c59dc-2b91-4a3a-9c89-9d98d084eb92" />

*Настройка EIGRP на CMERouter*

Перейдем к настройке удаленного роутера. Настроим на RemoteRouter интерфейс Serial 0/3/0.

<img width="470" height="94" alt="image" src="https://github.com/user-attachments/assets/69409919-658c-44c0-b748-79a58ba0456b" />

*Настройка s0/3/0 на RemoteRouter*

Проверим соединение между маршрутизаторами. Для этого на RemoteRouter выполним команду ping на интерфейс Serial 0/3/0 маршрутизатора CMERouter.

<img width="562" height="118" alt="image" src="https://github.com/user-attachments/assets/d4778b37-7b31-4495-a81b-21859a89795a" />

*Выполнение ping с RemoteRouter на CMERouter*

Создадим подинтерфейсы для VLAN'ов передачи голоса и данных - VLAN 40 для данных и VLAN 30 для голоса. Закрепим за ними IP-адреса.

<img width="431" height="102" alt="image" src="https://github.com/user-attachments/assets/cf4bdb94-4e09-4090-be71-e0bf3974073a" />

*Конфигурация подинтерфейсов VLAN на RemoteRouter*

Аналогично создадим подинтерфейсы на маршрутизаторе CMERouter.

<img width="636" height="186" alt="image" src="https://github.com/user-attachments/assets/60ae7065-60a3-414d-9e4a-e1a5d60b5563" />

*Конфигурация подинтерфейсов VLAN на CMERouter*

Так же, как и на маршрутизаторе CMERouter, настроим маршрутацию по протоколу EIGRP для RemoteRouter.

<img width="638" height="114" alt="image" src="https://github.com/user-attachments/assets/8c2d9158-ebbc-41e0-a4d5-cf4859f3fb22" />

*Настройка EIGRP на RemoteRouter*

Продолжим настройку удаленного узла. Настроим коммутатор RemoteSwitch - здесь мы отключим синтаксис ввода слов от DNS-серверов и зададим пароли для защиты устройства в консольном и удаленном режимах.

<img width="331" height="151" alt="image" src="https://github.com/user-attachments/assets/b0522541-0f91-450f-ad97-93426dd86c30" />

*Настройка RemoteSwitch*

Настроим первый порт этого коммутатора, переведя его в транковый режим.

<img width="651" height="244" alt="image" src="https://github.com/user-attachments/assets/bd589d1b-bd8f-493d-95d2-9535c7974703" />

*Настройка f0/1 на RemoteSwitch*

Здесь же создадим VLAN'ы и присвоим им имена.

<img width="285" height="82" alt="image" src="https://github.com/user-attachments/assets/50006b2d-5da3-453a-b905-60edb16318e4" />

*Создание VLAN на RemoteSwitch*

Настроим порт коммутатора в соотвествии с этими VLAN'ами.

<img width="534" height="158" alt="image" src="https://github.com/user-attachments/assets/2df52aa7-3bb1-4f3b-a38a-cd5dd6a36209" />

*Настройка VLAN на RemoteSwitch*

Перейдем к настройке CMESwitch. Здесь мы проведем аналогичную настройку.

<img width="621" height="226" alt="image" src="https://github.com/user-attachments/assets/f6db1313-6e5f-4b06-b174-4ce2d5159c61" />

*Настройка f0/1 на CMESwitch*

<img width="550" height="341" alt="image" src="https://github.com/user-attachments/assets/ef331335-3693-4a57-9d2e-f10a42852260" />

*Настройка VLAN на CMESwitch*

Вернемся к настройке маршрутизатора CMERouter. Сначала настроим DHCP.

<img width="451" height="156" alt="image" src="https://github.com/user-attachments/assets/a6a8bcdb-1da3-4c93-ae82-12e119f18739" />

*Настройка DHCP на CMERouter*

Здесь же настроим телефонный сервис.

<img width="453" height="76" alt="image" src="https://github.com/user-attachments/assets/43ba37f1-d12c-4346-86fc-7d64e9ed3ba2" />

*Настройка телефонного сервиса на CMERouter*

Настроим IP-телефонам номера.

<img width="635" height="166" alt="image" src="https://github.com/user-attachments/assets/9bc89af1-24ed-487b-aeda-c666d7c70017" />

*Настройка номеров для IP-телефонов на CMERouter*

Настроим dial-peer.

<img width="458" height="63" alt="image" src="https://github.com/user-attachments/assets/004f030e-0fc4-41ee-b168-5d8090c28ebd" />

*Настройка dial-peer на CMERouter*

На маршрутизаторе RemoteRouter проведем аналогичные настройки.

<img width="454" height="154" alt="image" src="https://github.com/user-attachments/assets/64a9a4d6-63fc-4d04-987f-dc4031f26a9c" />

*Настройка DHCP на RemoteRouter*

<img width="481" height="78" alt="image" src="https://github.com/user-attachments/assets/5ee81bc6-fd1d-4918-ba89-57a36dcbb575" />

*Настройка телефонного сервиса на RemoteRouter*

<img width="633" height="138" alt="image" src="https://github.com/user-attachments/assets/cc84a81b-3324-4a3c-9d7e-f2b372720b16" />

*Настройка номера для IP-телефона и dial-peer на RemoteRouter*


