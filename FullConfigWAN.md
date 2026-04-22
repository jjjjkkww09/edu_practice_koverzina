## Часть 1.

#### Шаг 1.

Строим топологию сети согласно схеме:

<img width="1565" height="564" alt="image" src="https://github.com/user-attachments/assets/707e7966-fce9-4248-ac2d-1ee58940c000" />

#### Шаг 2.

Настраиваем R1 со следующими условиями:

1. f0/0 - 10.1.1.1/24
  
2. f0/1 - 10.12.12.1/24

<img width="650" height="332" alt="image" src="https://github.com/user-attachments/assets/ed132443-bdee-4a2b-8a2f-13f9b136dba4" />

#### Шаг 3.

Настраиваем R2 по следующим условиям:

1. f0/0 - 10.23.23.2/24

2. f0/1 -10.12.12.2/24

<img width="639" height="328" alt="image" src="https://github.com/user-attachments/assets/6b12fad3-82f4-467a-878a-57794e053e18" />

#### Шаг 4.

Настраиваем R3 по следующим условиям:

1. loopback 3 - 3.3.3.3/8.

2. loopback 33 - 33.33.33.33/8.

3. g0/0 - 10.23.23.3/24

4. s0/3/0 - 30.30.30.3/24

<img width="629" height="354" alt="image" src="https://github.com/user-attachments/assets/5ad82775-5495-47bc-b716-46238bf7d0b7" />

<img width="635" height="176" alt="image" src="https://github.com/user-attachments/assets/a1cf44fb-3879-4e37-aa8f-f0280418e64d" />

#### Шаг 5.

Настраиваем R1973 по следующим условиям:

1. loopback 1973: IP-адрес 73.73.73.73/24

2. s0/3/0: IP-адрес 30.30.30.73/24

<img width="619" height="161" alt="image" src="https://github.com/user-attachments/assets/f4a26514-deb3-4d5b-8c90-eb7c7941be20" />

## Часть 2.

#### Шаг 1.

Настраиваем последовательные интерфейсы между R3 и R1973 с использованием протокола инкапсуляции PPP и проверяем, что оба маршрутизатора аутентифицируют друг друга с использованием максимально надежного протокола аутентификации.

R3:

<img width="347" height="70" alt="image" src="https://github.com/user-attachments/assets/d88f5ea4-cf0e-442b-9ff7-09494e9c2499" />

R1973:

<img width="322" height="79" alt="image" src="https://github.com/user-attachments/assets/dac9605d-3c20-4186-8ec4-1a3135a15340" />

## Часть 3.

#### Шаг 1.

Включаем OSPFv2 на маршрутизаторах R1, R2, R3.

На R1:

<img width="241" height="21" alt="image" src="https://github.com/user-attachments/assets/6f581bbb-b05a-43da-8001-50c8d642e5db" />

На R2:

<img width="425" height="54" alt="image" src="https://github.com/user-attachments/assets/cf2ddf9b-162f-4ecd-a6be-e1bcf8fada65" />

На R3:

<img width="236" height="45" alt="image" src="https://github.com/user-attachments/assets/e9de9a72-4a4c-4426-a23d-188cb31c62c2" />

#### Шаг 2.

Настраиваем R2 так, чтобы он использовал ID маршрутизатора 0.0.0.2.

<img width="309" height="38" alt="image" src="https://github.com/user-attachments/assets/9e71cbd1-3982-4ac5-8281-b4117746df6c" />

#### Шаг 3.

Настраиваем маршрутизаторы R1, R2 и R3 так, чтобы они объявляли все свои подключенные сети в OSPF.

На R1:

<img width="446" height="34" alt="image" src="https://github.com/user-attachments/assets/6fb00a50-4015-4292-9a0e-07fd0c1f0563" />

На R2:

<img width="456" height="39" alt="image" src="https://github.com/user-attachments/assets/9dd1db46-c88f-4e8d-9694-f880c29c4c1f" />

На R3:

<img width="628" height="63" alt="image" src="https://github.com/user-attachments/assets/ecbf1e6f-17c7-423c-ac7e-477120607aba" />

#### Шаг 4.

Используем ID процесса 100 для OSPF на всех маршрутизаторах.

На R1:

<img width="301" height="28" alt="image" src="https://github.com/user-attachments/assets/f3ddff1d-5cb1-41f8-bd1a-44751388f380" />

На R2:

<img width="301" height="24" alt="image" src="https://github.com/user-attachments/assets/b412ca64-8494-487a-ad93-79c6a24ca438" />

На R3:

<img width="311" height="52" alt="image" src="https://github.com/user-attachments/assets/8c946e65-c1b1-4235-837e-63920c3ba6da" />

#### Шаг 5.

Настраиваем интерфейс f0/0 маршрутизатора R1 так, чтобы он принадлежал зоне 1.

<img width="422" height="28" alt="image" src="https://github.com/user-attachments/assets/4500bcfe-11a0-4905-8b0f-fd855b5cea5b" />

#### Шаг 6.

Настраиваем интерфейс f0/1 маршрутизатора R1 так, чтобы он принадлежал зоне 0.

<img width="427" height="21" alt="image" src="https://github.com/user-attachments/assets/94bbb37b-190f-4053-83a0-ba8c041e79a1" />

#### Шаг 7.

Настраиваем интерфейс f0/0 маршрутизатора R2 так, чтобы он принадлежал зоне 23.

<img width="449" height="33" alt="image" src="https://github.com/user-attachments/assets/dd4cbc83-864e-4ca3-9244-39717577f108" />

#### Шаг 8.

Настраиваем интерфейс f0/1 маршрутизатора R2 так, чтобы он принадлежал зоне 0.

<img width="429" height="32" alt="image" src="https://github.com/user-attachments/assets/b78b8819-606a-44e1-864c-a9e4cea18594" />

#### Шаг 9.

Настраиваем интерфейс f0/0, интерфейс loopback3 и loopback33 маршрутизатора R3 так, чтобы они принадлежали зоне 23.

<img width="479" height="52" alt="image" src="https://github.com/user-attachments/assets/b9af04e3-1716-4b9a-bc69-2ca67145aa96" />

#### Шаг 10.

Блокируем отправку hello-пакетов OSPF на всех интерфейсах маршрутизатора R1, кроме интерфейса f0/1.

<img width="438" height="34" alt="image" src="https://github.com/user-attachments/assets/5387a5b9-29a9-4d5d-8977-6a8a316e7706" />

#### Шаг 11.

Настраиваем маршрутизатор R2 так, чтобы он всегда был назначенным маршрутизатором (DR) на всех многодоступовых сетях (broadcast и NBMA).

<img width="336" height="77" alt="image" src="https://github.com/user-attachments/assets/eb2dbce8-4ed0-4a3f-83e9-af8c82ae2a53" />

#### Шаг 12.

Настраиваем маршрутизатор R3 так, чтобы он работал в качестве шлюза по умолчанию для всех маршрутизаторов OSPF, чтобы они могли взаимодействовать с любыми другими сетями.

<img width="404" height="35" alt="image" src="https://github.com/user-attachments/assets/bd94f4dc-4d09-4688-9691-504e164fc535" />

## Часть 4.

#### Шаг 1.

Настраиваем BGP между R3 и R1973.

Входим в процесс BGP на R3:

<img width="251" height="33" alt="image" src="https://github.com/user-attachments/assets/f2ade307-6939-42c6-a8f2-ae2782d6b884" />

Входим в процесс BGP на R1973:

<img width="239" height="32" alt="image" src="https://github.com/user-attachments/assets/38a6604e-0c26-410a-9040-dc875b635bc8" />

#### Шаг 2.

Указываем что все маршрутизаторы, использующие протокол OSPF, находятся в автономной системе BGP (AS) номер 3.

<img width="296" height="29" alt="image" src="https://github.com/user-attachments/assets/18846c8c-c7e0-48f3-823a-ad527d7e2bd7" />

#### Шаг 3.

Маршрутизатор R1973 находится в автономной системе BGP (AS) номер 1973.

<img width="265" height="32" alt="image" src="https://github.com/user-attachments/assets/471721a0-0016-419f-be10-2ecf189a00ed" />

#### Шаг 4.

Настраиваем маршрутизатор R3 для установления внешнего BGP-соседства с маршрутизатором R1973.

<img width="500" height="27" alt="image" src="https://github.com/user-attachments/assets/36a0bbe2-1782-480c-a5b5-c771cb72aa9a" />

#### Шаг 5.

Настраиваем маршрутизатор R1973 так, чтобы он объявил свой loopback- интерфейс маршрутизатору R3.

<img width="437" height="40" alt="image" src="https://github.com/user-attachments/assets/68556895-e46d-46df-820a-160cb45bf861" />

#### Шаг 6.

Настраиваем маршрутизатор R1973 так, чтобы маршрут по умолчанию указывал на маршрутизатор R3.

<img width="417" height="33" alt="image" src="https://github.com/user-attachments/assets/98abb87c-b6f7-4a09-9394-c6f48eb6b92f" />

## Часть 5.

#### Шаг 1.

Проверяем, что IOS на R3 поддерживает все команды VOIP и расширенные настройки безопасности, используя для этого оценочную лицензию.

<img width="641" height="128" alt="image" src="https://github.com/user-attachments/assets/b5a20063-6f8c-407c-b3fd-7e988a8f5c27" />

#### Шаг 2.

Устанавливаем лицензии UCK9.

<img width="647" height="611" alt="image" src="https://github.com/user-attachments/assets/f103aedd-3fc1-4f28-a60b-0ec15b4980ae" />

#### Шаг 3.

Устанавливаем лицензии securityk9.

<img width="644" height="618" alt="image" src="https://github.com/user-attachments/assets/007d14e1-9e13-4657-b1fa-00fd6e317e4d" />

#### Шаг 4.

Сохраняем конфигурацию.

<img width="416" height="118" alt="image" src="https://github.com/user-attachments/assets/82440e9d-58d4-46d9-a1a2-b33ecb4ef67f" />

#### Шаг 5.

Перезагружаем конфигурацию.

<img width="609" height="283" alt="image" src="https://github.com/user-attachments/assets/884849de-6eec-4dad-849e-248e7bb988e8" />

## Часть 6.

#### Шаг 1.

Настраиваем R1 в качестве DHCP-ретранслятора.

Сначала настроим сам DHCP-сервер на R3.

<img width="415" height="90" alt="image" src="https://github.com/user-attachments/assets/df519ff8-0268-45ec-b683-4767b501543e" />

Теперь настраиваем R1 как DHCP-ретранслятор.

<img width="351" height="47" alt="image" src="https://github.com/user-attachments/assets/3a666321-1f8f-4b84-807c-316db060e0d3" />

#### Шаг 2.

Проверяем, что PC0 может получить IPv4 от DHCP-сервера с IP 10.23.23.100.

<img width="726" height="373" alt="image" src="https://github.com/user-attachments/assets/98d915f8-0510-407a-8daf-a913bca0a57e" />

## Часть 7.

#### Шаг 1.

Настраиваем маршрутизаторы R1, R2, R3, R1973 с IPv6-адресами.

R1:

<img width="473" height="105" alt="image" src="https://github.com/user-attachments/assets/e3c29623-fab0-46b6-b618-e045c10d4e50" />

R2:

<img width="468" height="151" alt="image" src="https://github.com/user-attachments/assets/4bb6491b-8712-407d-8b38-11b872ea7967" />

R3:

<img width="513" height="172" alt="image" src="https://github.com/user-attachments/assets/5da280db-d9f4-4001-96e8-bb3506edcf1e" />

R1973:

<img width="480" height="115" alt="image" src="https://github.com/user-attachments/assets/da457d1a-40b7-4497-9dc8-c9610a01a8bf" />

#### Шаг 2.

На всех маршрутизаторах включаем возможность маршрутизации IPv6.

R1:

<img width="293" height="37" alt="image" src="https://github.com/user-attachments/assets/bdb950ff-c4b8-45b7-b0c6-c4efa731df47" />

R2:

<img width="502" height="185" alt="image" src="https://github.com/user-attachments/assets/cf5a0f09-3c8c-4530-9ac6-08944cda221d" />

R3:

<img width="284" height="28" alt="image" src="https://github.com/user-attachments/assets/4f7e085f-dc93-42e8-9167-6886d92be9ce" />

R1973:

<img width="307" height="21" alt="image" src="https://github.com/user-attachments/assets/0d032fec-4400-4eb1-9872-bfff8c1d4626" />

#### Шаг 3.

Проверяем, что интерфейс f0/0 на маршрутизаторе R1 использует локальный адрес канала fe80::1.

<img width="510" height="351" alt="image" src="https://github.com/user-attachments/assets/f1e1e793-3b24-4269-a1bf-066eff70b3cc" />

#### Шаг 4.

Проверяем, что R1 использует функцию EUI-64 для своего глобального адреса на интерфейсе f0/0.

<img width="521" height="63" alt="image" src="https://github.com/user-attachments/assets/d23cbbcf-868e-49b7-820c-b262feaa4271" />

## Часть 8.

#### Шаг 1.

Настраиваем OSPFv3 между R1, R2 и R3.

R1:

<img width="464" height="50" alt="image" src="https://github.com/user-attachments/assets/11f38cb9-a05c-4629-949a-4331da7450a5" />

R2:

<img width="267" height="47" alt="image" src="https://github.com/user-attachments/assets/8ed852ad-07f6-4fef-8052-dd4bd14bf442" />

R3:

<img width="291" height="35" alt="image" src="https://github.com/user-attachments/assets/57411615-b7bd-408b-8e15-baad1fec547c" />

#### Шаг 2.

R1 будет использовать router-id 0.0.0.1, R2 будет использовать router-id 0.0.0.2, R3 будет использовать router-id 0.0.0.3.

Сначала настраиваем router-id на R1:

<img width="297" height="30" alt="image" src="https://github.com/user-attachments/assets/788539ab-f3b5-411b-925d-f53fd95ba9de" />

Настраиваем router-id на R2:

<img width="288" height="22" alt="image" src="https://github.com/user-attachments/assets/3bf95be9-2b3a-4f04-b508-059c38c4a884" />

Настраиваем router-id на R3:

<img width="320" height="75" alt="image" src="https://github.com/user-attachments/assets/63d8bf6e-681d-4f60-8d8b-36f58cc80b7d" />

#### Шаг 3.

R1, R2 и R3 должны объявлять все подключенные сети IPv6.

#### Шаг 4.

Используйте номер процесса 100 для всех маршрутизаторов.

R1:

<img width="324" height="84" alt="image" src="https://github.com/user-attachments/assets/214782ab-7c77-4e20-8d08-c2ffb8e5ef50" />

R2:

<img width="301" height="32" alt="image" src="https://github.com/user-attachments/assets/f740aa04-3c83-45f2-8036-97d0ca1ea739" />

R3:

<img width="336" height="79" alt="image" src="https://github.com/user-attachments/assets/1f34eb0c-7fee-415c-acde-63e39939f015" />

#### Шаг 5.

Интерфейс f0/0 маршрутизатора R1 будет подключен к Area 1, интерфейс f0/1 маршрутизатора R1 будет подключен к Area 0.

<img width="319" height="75" alt="image" src="https://github.com/user-attachments/assets/96ee4088-1cbc-43b3-a050-9bd66560c3a5" />

#### Шаг 6.

Интерфейс f0/0 маршрутизатора R2 будет подключен к Area 23, интерфейс f0/1 маршрутизатора R2 будет подключен к Area 0.

<img width="358" height="50" alt="image" src="https://github.com/user-attachments/assets/93745615-1411-4eea-a2da-2fd008a6bc6a" />

#### Шаг 7.

Интерфейс g0/0 маршрутизатора R3 будет подключен к Area 23

<img width="413" height="67" alt="image" src="https://github.com/user-attachments/assets/d79dd6ea-6ede-40fc-a336-1666236a76d6" />

#### Шаг 8.

R1 не должен отправлять hello-сообщения из всех своих текущих и будущих добавленных интерфейсов, кроме f0/1.

<img width="292" height="28" alt="image" src="https://github.com/user-attachments/assets/98884044-bf99-4d7e-a250-a7f34957c7d7" />

#### Шаг 9.

Настраиваем R3 для работы в качестве шлюза по умолчанию для всех маршрутизаторов OSPF для связи с любыми другими сетями.

Сначала создаем статический маршрут.

<img width="365" height="45" alt="image" src="https://github.com/user-attachments/assets/0fe1668e-50cc-4b10-8fe8-354e22c50f2d" />

Объявляем его в OSPF.

<img width="325" height="41" alt="image" src="https://github.com/user-attachments/assets/34fe4d7a-f971-4a63-a2a0-61b64227cd90" />

## Часть 9.

#### Шаг 1.

Настраиваем EIGRPv6 между R3 и R1973.

На R3:

<img width="283" height="44" alt="image" src="https://github.com/user-attachments/assets/6978f08f-14a1-442b-8d38-740714f457d2" />

На R1973:

<img width="384" height="73" alt="image" src="https://github.com/user-attachments/assets/ce90d7f0-94ab-42ca-92da-e3eb472e85dd" />

#### Шаг 2.

Указываем номер автономной системы (AS) 100.

(Этот номер уже указан в командах выше при создании процесса eigrp 100)

#### Шаг 3.

R3 должен использовать router-id 0.0.0.3, R1973 будет использовать router-id 0.0.0.73.

R3:

<img width="348" height="65" alt="image" src="https://github.com/user-attachments/assets/4ae1c415-6b66-49d1-a6f7-a39d5d62ef3e" />

R1973:

<img width="309" height="54" alt="image" src="https://github.com/user-attachments/assets/b05eda1d-5709-4a17-be7b-0f31b44becc0" />

#### Шаг 4.

R1973 должен объявить свою петлевую сеть (loopback) для R3 через EIGRPv6.

На R3 активируем связь с R1973:

<img width="288" height="94" alt="image" src="https://github.com/user-attachments/assets/2bb273d6-46e3-45f1-ad7e-a1c4e6d32edd" />

На R1973 активируем связь и объявляем loopback.

<img width="362" height="34" alt="image" src="https://github.com/user-attachments/assets/3e72fa91-e400-4c0e-af04-efd75a1677c9" />

#### Шаг 5.

Настройте на R1973 маршрут по умолчанию IPv6, указывающий на R3 в качестве следующего хопа (next hop) для связи с любыми другими сетями.

<img width="284" height="53" alt="image" src="https://github.com/user-attachments/assets/c086f689-7d8e-43ba-8f1d-03648d14cb92" />

Прописываем "no shutdown", иначе EIGRPv6 не будет должным образом работать и функционировать.

На R3:

<img width="283" height="55" alt="image" src="https://github.com/user-attachments/assets/e93597a1-9bf4-4784-80a1-e24b6bc228e8" />

На R1973:

![Uploading image.png…]()
