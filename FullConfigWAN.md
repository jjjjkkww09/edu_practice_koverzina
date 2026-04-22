## Часть 1.

#### Шаг 1.

Строим топологию сети согласно схеме:

<img width="1565" height="564" alt="image" src="https://github.com/user-attachments/assets/707e7966-fce9-4248-ac2d-1ee58940c000" />

*Топология сети*

#### Шаг 2.

Настраиваем R1 со следующими условиями:

1. f0/0 - 10.1.1.1/24
  
2. f0/1 - 10.12.12.1/24

<img width="650" height="332" alt="image" src="https://github.com/user-attachments/assets/ed132443-bdee-4a2b-8a2f-13f9b136dba4" />

*Настройка адресов на R1*

#### Шаг 3.

Настраиваем R2 по следующим условиям:

1. f0/0 - 10.23.23.2/24

2. f0/1 -10.12.12.2/24

<img width="639" height="328" alt="image" src="https://github.com/user-attachments/assets/6b12fad3-82f4-467a-878a-57794e053e18" />

*Настройка адресов на R2*

#### Шаг 4.

Настраиваем R3 по следующим условиям:

1. loopback 3 - 3.3.3.3/8.

2. loopback 33 - 33.33.33.33/8.

3. g0/0 - 10.23.23.3/24

4. s0/3/0 - 30.30.30.3/24

<img width="629" height="354" alt="image" src="https://github.com/user-attachments/assets/5ad82775-5495-47bc-b716-46238bf7d0b7" />

*Настройка loopback-интерфейсов на R3*

<img width="635" height="176" alt="image" src="https://github.com/user-attachments/assets/a1cf44fb-3879-4e37-aa8f-f0280418e64d" />

*Настройка g0/0 и s0/3/0 на R3*

#### Шаг 5.

Настраиваем R1973 по следующим условиям:

1. loopback 1973: IP-адрес 73.73.73.73/24

2. s0/3/0: IP-адрес 30.30.30.73/24

<img width="619" height="161" alt="image" src="https://github.com/user-attachments/assets/f4a26514-deb3-4d5b-8c90-eb7c7941be20" />

*Настройка интерфейсов на R1973*

## Часть 2.

#### Шаг 1.

Настраиваем последовательные интерфейсы между R3 и R1973 с использованием протокола инкапсуляции PPP и проверяем, что оба маршрутизатора аутентифицируют друг друга с использованием максимально надежного протокола аутентификации.

R3:

<img width="347" height="70" alt="image" src="https://github.com/user-attachments/assets/d88f5ea4-cf0e-442b-9ff7-09494e9c2499" />

*Настройка PPP на R3*

R1973:

<img width="322" height="79" alt="image" src="https://github.com/user-attachments/assets/dac9605d-3c20-4186-8ec4-1a3135a15340" />

*Настройка PPP на R3*

## Часть 3.

#### Шаг 1.

Включаем OSPFv2 на маршрутизаторах R1, R2, R3.

На R1:

<img width="241" height="21" alt="image" src="https://github.com/user-attachments/assets/6f581bbb-b05a-43da-8001-50c8d642e5db" />

*Включаем OSPFv2 на R1*

На R2:

<img width="425" height="54" alt="image" src="https://github.com/user-attachments/assets/cf2ddf9b-162f-4ecd-a6be-e1bcf8fada65" />

*Включаем OSPFv2 на R2*

На R3:

<img width="236" height="45" alt="image" src="https://github.com/user-attachments/assets/e9de9a72-4a4c-4426-a23d-188cb31c62c2" />

*Включаем OSPFv2 на R3*

#### Шаг 2.

Настраиваем R2 так, чтобы он использовал ID маршрутизатора 0.0.0.2.

<img width="309" height="38" alt="image" src="https://github.com/user-attachments/assets/9e71cbd1-3982-4ac5-8281-b4117746df6c" />

*Настройка ID маршрутизатора на R2*

#### Шаг 3.

Настраиваем маршрутизаторы R1, R2 и R3 так, чтобы они объявляли все свои подключенные сети в OSPF.

На R1:

<img width="446" height="34" alt="image" src="https://github.com/user-attachments/assets/6fb00a50-4015-4292-9a0e-07fd0c1f0563" />

*Настройка для объявления подключенных сетей в OSPF на R1*

На R2:

<img width="456" height="39" alt="image" src="https://github.com/user-attachments/assets/9dd1db46-c88f-4e8d-9694-f880c29c4c1f" />

*Настройка для объявления подключенных сетей в OSPF на R2*

На R3:

<img width="628" height="63" alt="image" src="https://github.com/user-attachments/assets/ecbf1e6f-17c7-423c-ac7e-477120607aba" />

*Настройка для объявления подключенных сетей в OSPF на R3*

#### Шаг 4.

Используем ID процесса 100 для OSPF на всех маршрутизаторах.

На R1:

<img width="301" height="28" alt="image" src="https://github.com/user-attachments/assets/f3ddff1d-5cb1-41f8-bd1a-44751388f380" />

*Используем ID процесса 100 для OSPF на R1*

На R2:

<img width="301" height="24" alt="image" src="https://github.com/user-attachments/assets/b412ca64-8494-487a-ad93-79c6a24ca438" />

*Используем ID процесса 100 для OSPF на R2*

На R3:

<img width="311" height="52" alt="image" src="https://github.com/user-attachments/assets/8c946e65-c1b1-4235-837e-63920c3ba6da" />

*Используем ID процесса 100 для OSPF на R3*

#### Шаг 5.

Настраиваем интерфейс f0/0 маршрутизатора R1 так, чтобы он принадлежал зоне 1.

<img width="422" height="28" alt="image" src="https://github.com/user-attachments/assets/4500bcfe-11a0-4905-8b0f-fd855b5cea5b" />

*Настройка принадлежности интерфейса f0/0 R1 к зоне 1*

#### Шаг 6.

Настраиваем интерфейс f0/1 маршрутизатора R1 так, чтобы он принадлежал зоне 0.

<img width="427" height="21" alt="image" src="https://github.com/user-attachments/assets/94bbb37b-190f-4053-83a0-ba8c041e79a1" />

*Настройка принадлежности интерфейса f0/1 R1 к зоне 0*

#### Шаг 7.

Настраиваем интерфейс f0/0 маршрутизатора R2 так, чтобы он принадлежал зоне 23.

<img width="449" height="33" alt="image" src="https://github.com/user-attachments/assets/dd4cbc83-864e-4ca3-9244-39717577f108" />

*Настройка принадлежности интерфейса f0/0 R2 к зоне 23*

#### Шаг 8.

Настраиваем интерфейс f0/1 маршрутизатора R2 так, чтобы он принадлежал зоне 0.

<img width="429" height="32" alt="image" src="https://github.com/user-attachments/assets/b78b8819-606a-44e1-864c-a9e4cea18594" />

*Настройка принадлежности интерфейса f0/1 R2 к зоне 0*

#### Шаг 9.

Настраиваем интерфейс f0/0, интерфейс loopback3 и loopback33 маршрутизатора R3 так, чтобы они принадлежали зоне 23.

<img width="479" height="52" alt="image" src="https://github.com/user-attachments/assets/b9af04e3-1716-4b9a-bc69-2ca67145aa96" />

#### Шаг 10.

Блокируем отправку hello-пакетов OSPF на всех интерфейсах маршрутизатора R1, кроме интерфейса f0/1.

<img width="438" height="34" alt="image" src="https://github.com/user-attachments/assets/5387a5b9-29a9-4d5d-8977-6a8a316e7706" />

*Блокировка отправки hello-пакетов OSPF на всех интерфейсах маршрутизатора R1, кроме интерфейса f0/1*

#### Шаг 11.

Настраиваем маршрутизатор R2 так, чтобы он всегда был назначенным маршрутизатором (DR) на всех многодоступовых сетях (broadcast и NBMA).

<img width="336" height="77" alt="image" src="https://github.com/user-attachments/assets/eb2dbce8-4ed0-4a3f-83e9-af8c82ae2a53" />

#### Шаг 12.

Настраиваем маршрутизатор R3 так, чтобы он работал в качестве шлюза по умолчанию для всех маршрутизаторов OSPF, чтобы они могли взаимодействовать с любыми другими сетями.

<img width="404" height="35" alt="image" src="https://github.com/user-attachments/assets/bd94f4dc-4d09-4688-9691-504e164fc535" />

*Настройка R3 в качестве шлюза по умолчанию для всех маршрутизаторов OSPF*

## Часть 4.

#### Шаг 1.

Настраиваем BGP между R3 и R1973.

Входим в процесс BGP на R3:

<img width="251" height="33" alt="image" src="https://github.com/user-attachments/assets/f2ade307-6939-42c6-a8f2-ae2782d6b884" />

*Вход в процесс BGP на R3*

Входим в процесс BGP на R1973:

<img width="239" height="32" alt="image" src="https://github.com/user-attachments/assets/38a6604e-0c26-410a-9040-dc875b635bc8" />

*Вход в процесс BGP на R1973*

#### Шаг 2.

Указываем что все маршрутизаторы, использующие протокол OSPF, находятся в автономной системе BGP (AS) номер 3.

<img width="296" height="29" alt="image" src="https://github.com/user-attachments/assets/18846c8c-c7e0-48f3-823a-ad527d7e2bd7" />

*Указываем, что маршрутизаторы, использующие протокол OSPF, находятся в AS BGP 3*

#### Шаг 3.

Маршрутизатор R1973 находится в автономной системе BGP (AS) номер 1973.

<img width="265" height="32" alt="image" src="https://github.com/user-attachments/assets/471721a0-0016-419f-be10-2ecf189a00ed" />

*Указываем, что R1973 находятся в AS BGP 1973*

#### Шаг 4.

Настраиваем маршрутизатор R3 для установления внешнего BGP-соседства с маршрутизатором R1973.

<img width="500" height="27" alt="image" src="https://github.com/user-attachments/assets/36a0bbe2-1782-480c-a5b5-c771cb72aa9a" />

*Настройка R3 для установления внешнего BGP-соседства с R1973*

#### Шаг 5.

Настраиваем маршрутизатор R1973 так, чтобы он объявил свой loopback-интерфейс маршрутизатору R3.

<img width="437" height="40" alt="image" src="https://github.com/user-attachments/assets/68556895-e46d-46df-820a-160cb45bf861" />

*Настройка объявления loopback-интерфейса R1937 для R3*

#### Шаг 6.

Настраиваем маршрутизатор R1973 так, чтобы маршрут по умолчанию указывал на маршрутизатор R3.

<img width="417" height="33" alt="image" src="https://github.com/user-attachments/assets/98abb87c-b6f7-4a09-9394-c6f48eb6b92f" />

*Настройка маршрута по умолчанию, указывающего на R3 на R1973*
## Часть 5.

#### Шаг 1.

Проверяем, что IOS на R3 поддерживает все команды VOIP и расширенные настройки безопасности, используя для этого оценочную лицензию.

<img width="641" height="128" alt="image" src="https://github.com/user-attachments/assets/b5a20063-6f8c-407c-b3fd-7e988a8f5c27" />

*Проверка с использованием оценочной лицензии*

#### Шаг 2.

Устанавливаем лицензии UCK9.

<img width="647" height="611" alt="image" src="https://github.com/user-attachments/assets/f103aedd-3fc1-4f28-a60b-0ec15b4980ae" />

*Установка лицензий UCK9*

#### Шаг 3.

Устанавливаем лицензии securityk9.

<img width="644" height="618" alt="image" src="https://github.com/user-attachments/assets/007d14e1-9e13-4657-b1fa-00fd6e317e4d" />

*Установка лицензий securityk9*

#### Шаг 4.

Сохраняем конфигурацию.

<img width="416" height="118" alt="image" src="https://github.com/user-attachments/assets/82440e9d-58d4-46d9-a1a2-b33ecb4ef67f" />

*Сохранение конфигурации*

#### Шаг 5.

Перезагружаем конфигурацию.

<img width="609" height="283" alt="image" src="https://github.com/user-attachments/assets/884849de-6eec-4dad-849e-248e7bb988e8" />

*Перезагрузка конфигурации*
## Часть 6.

#### Шаг 1.

Настраиваем R1 в качестве DHCP-ретранслятора.

Сначала настроим сам DHCP-сервер на R3.

<img width="415" height="90" alt="image" src="https://github.com/user-attachments/assets/df519ff8-0268-45ec-b683-4767b501543e" />

*Настройка DHCP-сервера на R3*

Теперь настраиваем R1 как DHCP-ретранслятор.

<img width="351" height="47" alt="image" src="https://github.com/user-attachments/assets/3a666321-1f8f-4b84-807c-316db060e0d3" />

*Настройка R1 DHCP-ретранслятором*

#### Шаг 2.

Проверяем, что PC0 может получить IPv4 от DHCP-сервера.

<img width="726" height="373" alt="image" src="https://github.com/user-attachments/assets/98d915f8-0510-407a-8daf-a913bca0a57e" />

*Проверка получения IPv4-адреса на PC0 от DHCP-сервера*

## Часть 7.

#### Шаг 1.

Настраиваем маршрутизаторы R1, R2, R3, R1973 с IPv6-адресами.


<img width="499" height="80" alt="image" src="https://github.com/user-attachments/assets/3fc4d8e2-17da-4947-a919-60ab163a5319" />

*Настройка IPv6-адреса на R1*


<img width="424" height="104" alt="image" src="https://github.com/user-attachments/assets/7ad9004c-b950-4d31-a26c-611a0f825334" />

*Настройка IPv6-адреса на R2*


<img width="472" height="106" alt="image" src="https://github.com/user-attachments/assets/a298f8a4-e900-47a5-b820-3f2852d06f46" />

*Настройка IPv6-адреса на R3*


<img width="649" height="199" alt="image" src="https://github.com/user-attachments/assets/77fec289-36fc-4de3-8105-eb74175cc637" />

*Настройка IPv6-адреса на R1937*

#### Шаг 2.

На всех маршрутизаторах включаем возможность маршрутизации IPv6.

<img width="293" height="37" alt="image" src="https://github.com/user-attachments/assets/bdb950ff-c4b8-45b7-b0c6-c4efa731df47" />

*Включаем возможность маршрутизации на R1*

<img width="502" height="185" alt="image" src="https://github.com/user-attachments/assets/cf5a0f09-3c8c-4530-9ac6-08944cda221d" />

*Включаем возможность маршрутизации на R2*

<img width="284" height="28" alt="image" src="https://github.com/user-attachments/assets/4f7e085f-dc93-42e8-9167-6886d92be9ce" />

*Включаем возможность маршрутизации на R3*

<img width="307" height="21" alt="image" src="https://github.com/user-attachments/assets/0d032fec-4400-4eb1-9872-bfff8c1d4626" />

*Включаем возможность маршрутизации на R1937*

#### Шаг 3.

Проверяем, что интерфейс f0/0 на маршрутизаторе R1 использует локальный адрес канала fe80::1.

<img width="414" height="63" alt="image" src="https://github.com/user-attachments/assets/ffb21cad-5b51-49f8-b9f4-867e4adbd803" />

*Проверка использования локального адреса канала fe80::1 на интерфейса f0/0 R1*

#### Шаг 4.

Проверяем, что R1 использует функцию EUI-64 для своего глобального адреса на интерфейсе f0/0.

<img width="454" height="64" alt="image" src="https://github.com/user-attachments/assets/6763c9f8-eb3d-44f6-9673-9a811984d7d5" />

*Проверка на R1 использования функцию EUI-64 для своего глобального адреса на интерфейсе f0/0*

## Часть 8.

#### Шаг 1.

Настраиваем OSPFv3 между R1, R2 и R3.

<img width="464" height="50" alt="image" src="https://github.com/user-attachments/assets/11f38cb9-a05c-4629-949a-4331da7450a5" />

*Настраиваем OSPFv3 между маршрутизаторами на R1*

<img width="267" height="47" alt="image" src="https://github.com/user-attachments/assets/8ed852ad-07f6-4fef-8052-dd4bd14bf442" />

*Настраиваем OSPFv3 между маршрутизаторами на R2*

<img width="291" height="35" alt="image" src="https://github.com/user-attachments/assets/57411615-b7bd-408b-8e15-baad1fec547c" />

*Настраиваем OSPFv3 между маршрутизаторами на R3*

#### Шаг 2.

R1 будет использовать router-id 0.0.0.1, R2 будет использовать router-id 0.0.0.2, R3 будет использовать router-id 0.0.0.3.

<img width="305" height="39" alt="image" src="https://github.com/user-attachments/assets/71d2b720-dbf4-475e-89cf-5d191bfc68de" />

*Настраиваем router-id на R1*

<img width="297" height="46" alt="image" src="https://github.com/user-attachments/assets/8be5b74c-991b-4c40-82e3-5a55c424a3e2" />

*Настраиваем router-id на R2*

<img width="308" height="49" alt="image" src="https://github.com/user-attachments/assets/27074e53-10cd-4893-b51f-e118ef98b931" />

*Настраиваем router-id на R3*

#### Шаг 3.

R1, R2 и R3 должны объявлять все подключенные сети IPv6.

#### Шаг 4.

Используйте номер процесса 100 для всех маршрутизаторов.

<img width="332" height="59" alt="image" src="https://github.com/user-attachments/assets/d51d6178-2633-4936-bf05-c5ba3495d988" />

*Объявление всех подключенных сетей IPv6 с номером процесса 100 на R1*

<img width="350" height="80" alt="image" src="https://github.com/user-attachments/assets/15fa55a5-2f9a-4eff-985e-987b0a7b17d9" />

*Объявление всех подключенных сетей IPv6 с номером процесса 100 на R2*

<img width="330" height="36" alt="image" src="https://github.com/user-attachments/assets/43a0a9a5-6782-4c5f-9bbb-b806f9d76d64" />

*Объявление всех подключенных сетей IPv6 с номером процесса 100 на R3*

#### Шаг 5.

Интерфейс f0/0 маршрутизатора R1 будет подключен к Area 1, интерфейс f0/1 маршрутизатора R1 будет подключен к Area 0.

<img width="319" height="75" alt="image" src="https://github.com/user-attachments/assets/96ee4088-1cbc-43b3-a050-9bd66560c3a5" />

*На R1 интерфейс f0/0 подключаем к Area 1, f0/1 к Area 0*

#### Шаг 6.

Интерфейс f0/0 маршрутизатора R2 будет подключен к Area 23, интерфейс f0/1 маршрутизатора R2 будет подключен к Area 0.

(сделано выше)

#### Шаг 7.

Интерфейс g0/0 маршрутизатора R3 будет подключен к Area 23

(сделано выше)

#### Шаг 8.

R1 не должен отправлять hello-сообщения из всех своих текущих и будущих добавленных интерфейсов, кроме f0/1.

<img width="417" height="65" alt="image" src="https://github.com/user-attachments/assets/c932fbd8-fcc4-485f-8621-182869f07c77" />

*Настройка R1 на отправление hello-сообщений только с f0/1*

#### Шаг 9.

Настраиваем R3 для работы в качестве шлюза по умолчанию для всех маршрутизаторов OSPF для связи с любыми другими сетями.

<img width="405" height="53" alt="image" src="https://github.com/user-attachments/assets/d9a946e6-0df0-488c-9062-7b612f707d29" />

*Настраиваем R3 для работы в качестве шлюза по умолчанию для всех маршрутизаторов OSPF*

## Часть 9.

#### Шаг 1.

Настраиваем EIGRPv6 между R3 и R1973.

<img width="309" height="99" alt="image" src="https://github.com/user-attachments/assets/138a423c-4777-4bf1-b6f9-8e1c1421a9d6" />

*Настройка EIGRPv6 на R3*

*Настройка EIGRPv6 на R1937*

#### Шаг 2.

Указываем номер автономной системы (AS) 100.

(Этот номер уже указан в командах выше при создании процесса eigrp 100)

#### Шаг 3.

R3 должен использовать router-id 0.0.0.3, R1973 будет использовать router-id 0.0.0.73.

<img width="383" height="73" alt="image" src="https://github.com/user-attachments/assets/acd3bc7e-42b6-4e76-925c-b309bb4741e2" />

*Настройка router-id на R3*

<img width="373" height="69" alt="image" src="https://github.com/user-attachments/assets/c83a756d-4305-4cff-809d-19d08a15c452" />

*Настройка router-id на R1937*

#### Шаг 4.

R1973 должен объявить свою петлевую сеть (loopback) для R3 через EIGRPv6.

<img width="311" height="77" alt="image" src="https://github.com/user-attachments/assets/e404d2b8-183f-406d-85ab-0d07d0d6437f" />

*Настройка объявления loopback для R3 через EIGRPv6 на R1973*

#### Шаг 5.

Настройте на R1973 маршрут по умолчанию IPv6, указывающий на R3 в качестве следующего хопа (next hop) для связи с любыми другими сетями.

<img width="361" height="41" alt="image" src="https://github.com/user-attachments/assets/63d2d966-3b44-42d4-877d-15ccfe8041f6" />

*Настройка на R1973 маршрута по умолчанию IPv6, указывающего на R3 в качестве следующего хопа*

Прописываем "no shutdown", иначе EIGRPv6 не будет должным образом работать и функционировать.

<img width="330" height="66" alt="image" src="https://github.com/user-attachments/assets/79085034-6f47-435b-9d81-2e9006844ea2" />

*Прописываем "no shutdown" на R3*

<img width="426" height="58" alt="image" src="https://github.com/user-attachments/assets/b3bb0f7a-d435-4b14-9fe9-474c8e1b129b" />

*Прописываем "no shutdown" на R1973*

Назначаем имена устройствам.

<img width="222" height="34" alt="image" src="https://github.com/user-attachments/assets/0055f3dd-0cd9-4d02-af4d-5700af6060c5" />

*Назначение имени устройства на R1*

<img width="224" height="19" alt="image" src="https://github.com/user-attachments/assets/ae17d8ce-6fab-4897-aaad-e2f1a4fbbea2" />

*Назначение имени устройства на R2*

<img width="217" height="24" alt="image" src="https://github.com/user-attachments/assets/d5fec4a3-b36f-480a-a257-3c6c8d79bf0c" />

*Назначение имени устройства на R3*

<img width="214" height="29" alt="image" src="https://github.com/user-attachments/assets/a5f073be-ae06-4ebb-9756-ad6407440d18" />

*Назначение имени устройства на R1973*

## Полные конфигурации устройств

#### R1

```
Current configuration : 1164 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R1
!
!
!
!
!
!
!
!
ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10177BPO-
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
 ip address 10.1.1.1 255.255.255.0
 ip helper-address 10.23.23.100
 ip helper-address 10.23.23.3
 duplex auto
 speed auto
 ipv6 address FE80::1 link-local
 ipv6 address 2001:10:10:10::/64 eui-64
 ipv6 ospf 100 area 1
!
interface FastEthernet0/1
 ip address 10.12.12.1 255.255.255.0
 duplex auto
 speed auto
 ipv6 address 2001:11:11:11::1/64
 ipv6 ospf 100 area 0
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 log-adjacency-changes
 passive-interface default
 no passive-interface FastEthernet0/1
 network 10.1.1.0 0.0.0.255 area 1
 network 10.12.12.0 0.0.0.255 area 0
!
ipv6 router ospf 100
 router-id 0.0.0.1
 log-adjacency-changes
 passive-interface default
 no passive-interface FastEthernet0/1
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

#### R2

```
Current configuration : 1002 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R2
!
!
!
!
!
!
!
!
ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX1017O96U-
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
 ip address 10.23.23.2 255.255.255.0
 ip ospf priority 255
 duplex auto
 speed auto
 ipv6 address 2001:12:12:12::2/64
 ipv6 ospf 100 area 23
!
interface FastEthernet0/1
 ip address 10.12.12.2 255.255.255.0
 ip ospf priority 255
 duplex auto
 speed auto
 ipv6 address 2001:11:11:11::2/64
 ipv6 ospf 100 area 0
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 router-id 0.0.0.2
 log-adjacency-changes
 network 10.12.12.0 0.0.0.255 area 0
 network 10.23.23.0 0.0.0.255 area 23
!
ipv6 router ospf 100
 router-id 0.0.0.2
 log-adjacency-changes
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

#### R3

```
Current configuration : 1905 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R3
!
!
!
!
ip dhcp excluded-address 10.1.1.1
!
ip dhcp pool LAN_R1
 network 10.1.1.0 255.255.255.0
 default-router 10.1.1.1
 dns-server 8.8.8.8
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
username R1973 password 0 cisco
!
!
license udi pid CISCO2911/K9 sn FTX152406YK-
license boot module c2900 technology-package securityk9
license boot module c2900 technology-package uck9
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
interface Loopback3
 ip address 3.3.3.3 255.0.0.0
 ipv6 address 2001:1973:1973:1973::1973/64
 ipv6 eigrp 100
!
interface Loopback33
 ip address 33.33.33.33 255.0.0.0
!
interface GigabitEthernet0/0
 ip address 10.23.23.3 255.255.255.0
 duplex auto
 speed auto
 ipv6 address 2001:12:12:12::3/64
 ipv6 ospf 100 area 23
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 30.30.30.3 255.255.255.0
 encapsulation ppp
 ppp authentication chap
 ipv6 address 2001:30:30:30::3/64
 ipv6 eigrp 100
 clock rate 128000
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
router ospf 100
 log-adjacency-changes
 network 10.23.23.0 0.0.0.255 area 23
 network 3.0.0.0 0.255.255.255 area 23
 network 33.0.0.0 0.255.255.255 area 23
 default-information originate
!
router bgp 3
 bgp log-neighbor-changes
 no synchronization
 neighbor 30.30.30.73 remote-as 1973
!
ipv6 router ospf 100
 router-id 0.0.0.3
 log-adjacency-changes
!
ipv6 router eigrp 100
 eigrp router-id 0.0.0.3
 no shutdown 
!
ip classless
!
ip flow-export version 9
!
ipv6 route ::/0 Serial0/3/0
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
end
```

#### R1973

```
Current configuration : 1416 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R1973
!
!
!
!
!
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
username R3 password 0 cisco
!
!
license udi pid CISCO2911/K9 sn FTX1524J0BO-
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
interface Loopback3
 no ip address
 ipv6 address 2001:1973:1973:1973::1973/64
 ipv6 eigrp 100
!
interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 30.30.30.73 255.255.255.0
 encapsulation ppp
 ppp authentication chap
 ipv6 address 2001:30:30:30::1973/64
 ipv6 eigrp 100
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
router bgp 1973
 bgp log-neighbor-changes
 no synchronization
 neighbor 30.30.30.3 remote-as 3
 network 73.73.73.0 mask 255.255.255.0
!
ipv6 router ospf 100
 default-information originate
 log-adjacency-changes
!
ipv6 router eigrp 100
 eigrp router-id 0.0.0.73
 no shutdown 
!
ip classless
ip route 0.0.0.0 0.0.0.0 30.30.30.3 
!
ip flow-export version 9
!
ipv6 route ::/0 2001:30:30:30::3
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
end
```
