-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 21 2016 г., 11:45
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `table_filter_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`city_id`, `name`) VALUES
(343, 'Екатеринбург'),
(495, 'Москва'),
(812, 'Санкт-Петербург'),
(816, 'Великий Новгород'),
(843, 'Казань'),
(844, 'Волгоград'),
(846, 'Самара'),
(861, 'Краснодар'),
(863, 'Ростов');

-- --------------------------------------------------------

--
-- Структура таблицы `qualification`
--

CREATE TABLE `qualification` (
  `qualification_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `qualification`
--

INSERT INTO `qualification` (`qualification_id`, `name`) VALUES
(1, 'Школьное'),
(2, 'Среднее'),
(3, 'Средне-специальное'),
(4, 'Бакалавриат'),
(5, 'Магистратура'),
(6, 'Аспирантура'),
(7, 'Докторнатура');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `qualification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `name`, `qualification_id`) VALUES
(100, 'Тони Старк', 7),
(101, 'Стив Роджерс', 1),
(102, 'Брюс Бэннер', 7),
(103, 'Клинт Бартон', 3),
(104, 'Наташа Романофф', 5),
(105, 'Ник Фьюри', 3),
(106, 'Сэм Уилсон', 4),
(107, 'Пегги Картер', 6),
(108, 'Джеймс Роудс', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_city`
--

CREATE TABLE `user_city` (
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_city`
--

INSERT INTO `user_city` (`user_id`, `city_id`) VALUES
(100, 343),
(100, 812),
(100, 861),
(101, 844),
(102, 343),
(103, 816),
(104, 495),
(104, 843),
(105, 844),
(106, 846),
(107, 495),
(108, 863);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Индексы таблицы `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`qualification_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_city`
--
ALTER TABLE `user_city`
  ADD PRIMARY KEY (`user_id`,`city_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
