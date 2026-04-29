# Практическая № 1. Создание виртуальной машины

Чтобы создать виртуальную машину, мы будем использовать VMware Workstation Pro 12.

<img width="812" height="271" alt="image" src="https://github.com/user-attachments/assets/2561831f-6de0-401c-ab32-828f79ccd080" />

*Создание новой ВМ*

<img width="502" height="390" alt="image" src="https://github.com/user-attachments/assets/d572064c-2016-486c-bb29-c6a394997cc9" />

*Мастер создания ВМ*

<img width="512" height="393" alt="image" src="https://github.com/user-attachments/assets/f23b5bec-0fb7-4132-80b6-4ddca4792096" />

*Выбор установочного диска/образа ОС*

<img width="492" height="385" alt="image" src="https://github.com/user-attachments/assets/783c7d14-0a95-4a5c-94ff-478184f18f1a" />

*Выбор установки ОС*

<img width="492" height="391" alt="image" src="https://github.com/user-attachments/assets/2dcd1ab6-48b1-4a1e-8437-e4c857949c23" />

*Назначение имени ВМ*

<img width="498" height="390" alt="image" src="https://github.com/user-attachments/assets/8a124b02-311a-436b-a7c0-1e9009c6cb4e" />

*Указание размера диска*

После всех выборов и настроек проверяем все на завершительном этапе. Если все хорошо, жмем "Готово".

<img width="489" height="387" alt="image" src="https://github.com/user-attachments/assets/9782cde7-bacf-4025-bfbe-c84b3cc21d3c" />

*Завершение создания ВМ*

<img width="1908" height="1041" alt="image" src="https://github.com/user-attachments/assets/9cecdce0-5b1b-4ca4-8c57-67a5a5023e6a" />

Виртуальная машина создана.

Выберем установочный диск ОС. Для этого переходим в изменение настроек параметров виртуальной машины и ищем пункт CD/DVD (SATA). Выбираем файл образа ISO нашей операционной системы.

<img width="261" height="106" alt="image" src="https://github.com/user-attachments/assets/5f403dc6-c216-420d-9ad7-a5aed07a02a0" />

*Переход в изменение настроек*

<img width="806" height="611" alt="image" src="https://github.com/user-attachments/assets/bd54f1ea-f8d8-4996-a8ce-c7ae7deadf46" />

*Выбор файла образа ISO*

После всех настроек запускаем. Начинается запуск Ubuntu.

Система предложит выбрать нам язык. Выбираем русский язык.

<img width="1262" height="597" alt="image" src="https://github.com/user-attachments/assets/cd9d1eca-f13e-4fdf-9e9e-997e57737085" />

*Выбор языка*

Выбираем тип установки Ubuntu Server.

<img width="1277" height="779" alt="image" src="https://github.com/user-attachments/assets/1035a1f5-d150-42d4-8e77-be7a331e2569" />

*Выбор типа установки*

Система покажет сконфигурированный сетевой интерфейс, нажимаем готово.

<img width="1269" height="789" alt="image" src="https://github.com/user-attachments/assets/fd19ae64-edc5-4daa-b422-04a9506c401e" />

*Сетевой интерфейс*

Дальше будет конфигурация зеркал для Ubuntu. Ждем, пока все закончится, потом жмем готово.

<img width="1262" height="760" alt="image" src="https://github.com/user-attachments/assets/27529679-593b-49c5-87ea-fc4421382c55" />

*Зеркала*

Здесь система попросит сконфигурировать дисковое пространство - использовать весь диск или выбрать самому, шифровать диск или нет. Ничего не меняем, оставляя использование всего диска и жмем готово.

<img width="1245" height="786" alt="image" src="https://github.com/user-attachments/assets/9727e36b-bc61-4c59-af5e-982986bf33ef" />

*Дисковое пространство*

Конфигурация профиля. Система запрашивает ввести свое имя, создать первого пользователя и его пароль, написать имя сервера. В каждое поле пишем student, сервер называем studentserver.

<img width="1245" height="785" alt="image" src="https://github.com/user-attachments/assets/9ac56a17-7c0a-437e-b635-1bdc0f215212" />

*Конфигурация профиля*

После завершения всех настроек виртуальная машина попросит перезагрузиться. Делаем это, после перезагрузки уже попадаем в консоль самой машины, вводим логин и пароль созданного пользователя.

<img width="1912" height="1031" alt="image" src="https://github.com/user-attachments/assets/47d3b9f6-8c06-46f9-ab47-f9e51cb9527f" />

*Первый вход в консоль после установки*

#### Выполнение заданий. 

1. Создаем пользователя: логин - своя фамилия, пароль - 0000.

<img width="433" height="94" alt="image" src="https://github.com/user-attachments/assets/876fa934-4778-4a80-9e0f-a52dcc8ff840" />

*Создание пользователя Koverzina с паролем 0000*

2. Создаем пользователя по номеру ПК, за которым работаем. Пароль такой же, как и само имя пользователя.

<img width="503" height="101" alt="image" src="https://github.com/user-attachments/assets/8baca9e4-1bf6-40a3-9a23-0336f5bec09b" />

*Создание пользователя user9 с паролем user9
*
3. Создаем пользователей username1, username2, username3, username4, каждый с паролем 1234.

<img width="508" height="338" alt="image" src="https://github.com/user-attachments/assets/bd0a94c0-b678-4ca4-a954-69eda6683185" />

*Созднаие пользователей с паролем 1234*

4. Проверяем созданных пользователей.

<img width="732" height="651" alt="image" src="https://github.com/user-attachments/assets/5ef8aadf-4216-4150-a629-486faf31223b" />

*Проверка пользователей*


5. Входим под каждым пользователем, после чего выполняем команду whoami - она определяет текущего пользователя.

<img width="647" height="232" alt="image" src="https://github.com/user-attachments/assets/f55af2a3-8536-4c53-8a90-85cb5c150c41" />

*Вход под пользователем Koverzina*

<img width="107" height="54" alt="image" src="https://github.com/user-attachments/assets/fadd88a7-29cb-4d2b-b97c-a9a607ab66ef" />

*Вывод whoami под пользователем Koverzina*

<img width="603" height="266" alt="image" src="https://github.com/user-attachments/assets/054cc515-2c0c-4ee2-8e56-1fe853eb8b59" />

*Вход под пользователем user9*

<img width="96" height="55" alt="image" src="https://github.com/user-attachments/assets/803454d6-a809-449a-8ba3-8e24081eed94" />

*Вывод whoami под пользователем user9*

<img width="674" height="246" alt="image" src="https://github.com/user-attachments/assets/cf31b420-f97c-4dcc-9db0-b1a53a802ef6" />

*Вход под пользователем username1*

<img width="100" height="58" alt="image" src="https://github.com/user-attachments/assets/7533e3c9-d3e1-48eb-9d25-c544fc3a8dee" />

*Вывод whoami под пользователем username1*

<img width="658" height="233" alt="image" src="https://github.com/user-attachments/assets/a0e36569-46d5-42e6-a7dc-7e7fa9a9fd91" />

*Вход под пользователем username2*

<img width="95" height="46" alt="image" src="https://github.com/user-attachments/assets/90f05817-8627-4ffe-8afd-1349cc7e5830" />

*Вывод whoami под пользователем username2*

<img width="639" height="233" alt="image" src="https://github.com/user-attachments/assets/e20ba3f5-2045-4761-b62f-5a2e8fb60fda" />

*Вход под пользователем username3*

<img width="95" height="50" alt="image" src="https://github.com/user-attachments/assets/057d948d-d242-49b7-b0b8-f4f0277aaca9" />

*Вывод whoami под пользователем username3*

<img width="666" height="231" alt="image" src="https://github.com/user-attachments/assets/542ce0d4-ca76-4e2e-ab8b-67a95255703f" />

*Вход под пользователем username4*

<img width="105" height="57" alt="image" src="https://github.com/user-attachments/assets/f3524fa6-7b11-44bb-bd44-a574c138a1a4" />

*Вывод whoami под пользователем username4*

# Практическая № 2. Начало использования команд


#### Выполнение заданий.

1. Вызовем мануал, не указывая никаких параметров и/или опций.

<img width="320" height="51" alt="image" src="https://github.com/user-attachments/assets/9a9348dc-46cf-4f53-9eb6-3127db3e5131" />

*Вызов мануала*

2. Посмотрим мануал по мануалу, использовав команду man man.

<img width="1323" height="808" alt="image" src="https://github.com/user-attachments/assets/51e3a316-4489-410b-b7e8-49edab6b7503" />

*Просмотр мануала по мануалу*

3. Вызовем мануал по команде ls.

<img width="1282" height="800" alt="image" src="https://github.com/user-attachments/assets/f5b6adb0-37fd-4fdf-8fff-5ccd0bca904e" />

*Просмотр мануала по ls*

4. Попробуем посмотреть мануал по несуществующей команде.

<img width="359" height="50" alt="image" src="https://github.com/user-attachments/assets/0e09b6cc-0e7e-4661-b83e-8de831d418a7" />

5. Проверим наше положение на данный момент с разными флагами.

<img width="299" height="203" alt="image" src="https://github.com/user-attachments/assets/952cd345-fcba-4a78-8e02-e0543002b006" />

*Выводы pwd с разными флагами*

6. Просмотрим историю использования команд.

<img width="549" height="511" alt="image" src="https://github.com/user-attachments/assets/7c1c0faf-19e6-4086-aba9-bb2da459f123" />

*История использования команд*

7. В домашнем каталоге /student/home создамим структуру папок по заданному шаблону.

<img width="566" height="197" alt="image" src="https://github.com/user-attachments/assets/940e869a-dfaf-463b-a7f1-ab44705d5f0c" />

*Создание структуры папок*

8. Создаем файлы с указанными названиями и содержимым, используя не предустановленный редактор.

Для выполнения я использую mcedit.

<img width="445" height="62" alt="image" src="https://github.com/user-attachments/assets/70477a18-8a40-454e-8f94-08c55c76fab4" />

*Установка mc*

Сначала создаем greetings.txt. Он находится по пути /home/student/text_files/greetings/.

<img width="572" height="60" alt="image" src="https://github.com/user-attachments/assets/6ff3f85f-dbb6-40fc-863b-d77a81583b55" />

*Переход в нужную директорию и создание файла, переход в редактор*

<img width="1274" height="802" alt="image" src="https://github.com/user-attachments/assets/c8735ec4-e423-419c-904e-2a0bf80e037d" />

*Написание содержимого*

<img width="676" height="106" alt="image" src="https://github.com/user-attachments/assets/3db17921-f5b4-420f-b24f-d80f78efbb80" />

*Подтверждаем сохранение файла*

Создадим файл numbers.txt, находящийся по пути /home/student/text_files/data/.

<img width="475" height="46" alt="image" src="https://github.com/user-attachments/assets/59a5c2ab-7e91-4d7a-a6bd-7eac4617ca3a" />

*Переход в нужную директорию и создание файла, переход в редактор*

<img width="704" height="148" alt="image" src="https://github.com/user-attachments/assets/97ff8da7-dd83-44f2-8e2b-4d24e1dc8385" />

*Написание содержимого*

<img width="540" height="105" alt="image" src="https://github.com/user-attachments/assets/27831cab-34ec-4eda-99b6-58b6a38a3ef3" />

*Подтверждаем сохранение файла*

Создадим файл colours.txt. Он, так же как и numbers.txt, находится по пути /home/student/text_files/data/.

<img width="456" height="38" alt="image" src="https://github.com/user-attachments/assets/4ff041ce-d6f2-4448-97a3-0e1f45eedd88" />

*Создание файла и переход в редактор*

<img width="706" height="110" alt="image" src="https://github.com/user-attachments/assets/ccbe02d6-2d29-4d36-8db1-0f2e73635237" />

*Написание содержимого*

Создаем файл shopping.txt, находящийся по пути /home/student/text_files/shopping_list.

<img width="573" height="110" alt="image" src="https://github.com/user-attachments/assets/35abb10d-f229-4145-ac4b-886fa2b16edb" />

*Переход в нужную директорию и создание файла, переход в редактор*

<img width="758" height="121" alt="image" src="https://github.com/user-attachments/assets/5b9d0cd9-ef88-4afe-95ad-7ceab2af528a" />

*Написание содержимого*

По тому же пути, то есть /home/student/text_files/shopping_list, создадим файл todo.txt.

<img width="498" height="41" alt="image" src="https://github.com/user-attachments/assets/43605d77-a4b2-4541-8830-85d6eb3e93e2" />

*Создание файла и переход в редактор*

<img width="745" height="115" alt="image" src="https://github.com/user-attachments/assets/6ad5d1ca-9dbf-4c93-bc0d-338a2c1e7492" />

*Написание содержимого*

Создадим файл poem.txt по пути /home/student/text_files/literature/.

<img width="493" height="47" alt="image" src="https://github.com/user-attachments/assets/497e85ca-a53f-47e6-b1b4-fd7d5719981d" />

*Переход в нужную директорию и создание файла, переход в редактор*

<img width="705" height="106" alt="image" src="https://github.com/user-attachments/assets/d6fab212-78a7-46b2-9757-0f883a5c5d59" />

*Написание содержимого*

Создаем файл zeroInfo.txt по пути /home/student/text_files/empty_lines/.

<img width="764" height="160" alt="image" src="https://github.com/user-attachments/assets/270a884a-a7d4-4cae-bb8d-35f732e729c5" />

*Написание содержимого*

Создаем файл space.txt по тому же пути, где находится и zeroInfo.txt, то есть /home/student/text_files/empty_lines/.

<img width="591" height="47" alt="image" src="https://github.com/user-attachments/assets/1c72089b-0cfc-4b88-bfaf-07339cef38ca" />

*Создание файла и переход в редактор*

<img width="859" height="192" alt="image" src="https://github.com/user-attachments/assets/97410434-3ebf-49ab-b358-493ec637c8e1" />

*Написание содержимого*

9. Выведем содержимое файла zeroInfo.txt сначала без флага, потом с флагом -n, а после с флагом -b.

<img width="663" height="306" alt="image" src="https://github.com/user-attachments/assets/7c67893d-69de-433c-9084-c49316a2b688" />

*Вывод содержимого zeroInfo.txt без флага; с флагом -n; с флагом -b*

Разница состоит в том, что cat без флага выводит просто содержимое файла; cat-n нумерует все выводимые строки без исключения (включая абсолютно пустые), а cat -b Ннмерует только непустые строки. Если в файле есть полностью пустая строка (только символ переноса), она останется без номера.

10. Выводим содержимое файла zeroInfo.txt с флагом -s.

<img width="562" height="62" alt="image" src="https://github.com/user-attachments/assets/a4adf6aa-17d8-4a2c-9577-a0d87097b89a" />

*Вывод содержимого zeroInfo с флагом -s*

Выводится просто одна строчка пустоты без нумерации. Это происходит по причине того, что команда cat -s предназначена для того, чтобы «сжимать» идущие подряд пустые строки в одну.

11. Выводим файл space.txt c флагом -E. Этот флаг добавляет символ $ в конце каждой строки.

<img width="574" height="89" alt="image" src="https://github.com/user-attachments/assets/f5e91ff3-37af-4cd0-a83f-199de831b340" />

*Вывод содержимого space.txt с флагом -E*

12. Выведем файл shopping.txt с флагом -T, чтобы посмотреть отображение табуляций.

<img width="588" height="83" alt="image" src="https://github.com/user-attachments/assets/b2d2e0a6-1c39-4e96-b961-e01e7dc95b10" />
