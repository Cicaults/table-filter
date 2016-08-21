<?php

//error_reporting( E_ERROR );

// Данные для подключения к БД
$host = 'localhost';
$login = 'Buzz_Lightyear';
$password = 'To_infinity_and_beyond';
$database = 'table_filter_db';

// Устанавливаем соединение и кодировку
$db_connect = new mysqli($host, $login, $password, $database);
$db_connect->set_charset('utf8');

if($db_connect->connect_error){
	die('Connection error '.$db_connect->connect_errno.': '.$db_connect->connect_error);
}

// Получаем список людей с образованием и городами
$table_query = $db_connect->query(
	'SELECT user.user_id AS id, user.name AS name, qualification.name AS qualification, city.name AS city
	 FROM user_city
	 INNER JOIN user ON user.user_id = user_city.user_id
	 INNER JOIN city ON city.city_id = user_city.city_id
     INNER JOIN qualification ON qualification.qualification_id = user.qualification_id
	');

errorHandle($db_connect);

// Массив, который мы вернем как результат
$result = array('people' => array(), 
				'filters' => array(
					'qual' => array(), 'city' => array()));

// Собираем список ФИО с образованием и городами через запятую
while ($row = $table_query->fetch_assoc()) {
// Здесь я сделал выбор в пользу компактности, но понимаю, что присвоение возможно лучше вынести в отдельную строку
	 if(($k = array_search($row['id'], array_column($result['people'], 'id'))) !== false)
	 	$result['people'][$k]['city'] .= ", ".$row['city'];
	 else
	 	$result['people'][] = $row;
}

// id нам больше не понадобится, избавляемся
foreach ($result['people'] as &$value) {
		unset($value['id']);
}

// Получаем список квалификаций для фильтра
$table_query = $db_connect->query(
	'SELECT qualification.name AS qual
	FROM qualification'
	);

errorHandle($db_connect);

while ($row = $table_query->fetch_assoc()) {
	$result['filters']['qual'][] = $row['qual'];
}

// Получаем список городов для фильтра
$table_query = $db_connect->query(
	'SELECT city.name AS city
	FROM city'
	);

errorHandle($db_connect);

while ($row = $table_query->fetch_assoc()) {
	$result['filters']['city'][] = $row['city'];
}

// Возвращаем результат в виде JSON объекта
echo json_encode($result);

$table_query->close();
$db_connect->close();

// Обработка ошибки запроса к БД
function errorHandle($connect){
	if($connect->errno){
	die('Select error '.$connect->errno.': '.$connect->error);
}

}
?>