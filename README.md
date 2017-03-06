# table-filter
Запрос к БД, помещение ответа в таблицу и фильтрация

## Принцип работы

У каждого пользователя может быть одно образование и несколько городов.

+ Берем данные из базы и форматируем их, составляя список фильтров и людей. Возвращаем их в JSON формате.
+ Заполняем список фильтров и таблицу
+ Фильтрация по выбранным параметрам. Должны выводиться только те пользователи, которые имеют выбранное образование *и* связаны хотя бы с одним из выбранных городов. Если в образовании ничего не выбрано, то список выводиться без фильтрации по образованию. Аналогично с городами.

## Использованные технологии
1. jQuery
2. Стили Bootstrap
3. База Данных - MariaDB
