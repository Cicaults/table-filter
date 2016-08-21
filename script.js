var main = function(){

	// Получаем данные
	var tableData;
	$.post('ParseTable.php', function(data){
		try{
			tableData = JSON.parse(data);
			buildTable();
			var i;
			// Заполняем список фильтров
			for (i = 0; i < tableData.filters.qual.length; i++) {
				var curQual = tableData.filters.qual[i];
				$('.qualifications ul').append($('<li>').append($('<label>').append($('<input type="checkbox" value="'+curQual+'"/>'),(curQual))));
			}

			for (i = 0; i < tableData.filters.city.length; i++) {
				var curCity = tableData.filters.city[i];
				$('.cities ul').append($('<li>').append($('<label>').append($('<input type="checkbox" value="'+curCity+'"/>'),(curCity))));
			}
		}
		catch(e){
			alert("Ошибка при загрузке данных!\n"+data);
		}
	});

	// Заполняем таблицу оригинальными данными
	var buildTable = function () {
		$('.table tbody').empty();
		for (var i = 0; i < tableData.people.length; i++) {
			$('.table tbody').append($('<tr>').append(
				$('<td>').html(tableData.people[i].name), $('<td>').html(tableData.people[i].qualification), $('<td>').html(tableData.people[i].city)));
		}
	}

	// При изменении состояния чекбокса
	$('body').on('change', '.filters input', function() {
		// Берем данные отмеченных фильтров
		var checkedQuals = new Array();
		var checkedCities = new Array();
		$('.qualifications input').each(function() {
			if($(this).is(":checked"))
				checkedQuals.push($(this).val());
		});

		$('.cities input').each(function() {
			if($(this).is(":checked"))
				checkedCities.push($(this).val());
		});

		// Восстанавливаем таблицу
		buildTable();
		// Если ничего не отмечено, то и делать нам нечего
		if(checkedQuals.length == 0 && checkedCities.length == 0){
			return;
		}

		// Убираем строки, в которых нет отмеченного образования
		if(checkedQuals.length != 0){
			$('.table tbody tr td:nth-child(2)').each(function() {
				if(!checkedQuals.includes($(this).html()))
					$(this).parent().hide();
			});
		}

		// Убираем строки, в которых нет отмеченных городов
		if(checkedCities.length != 0){
			$('.table tbody tr td:nth-child(3)').each(function() {
				// Учитываем, что города разделены запятой и убираем пробелы
				if(!checkedCities.some(function (elem) {
					return $.map($(this).html().split(','), $.trim).includes(elem);
				}, this ))
					$(this).parent().hide();
				});
		}
	});

	// Выпадающий список фильтров
	$('.dropdown .filter').click(function() {
		$('.filters').slideToggle('slow');
		$('.caret').toggleClass('caret-open');

	});

	// Сбросить фильтры
	$('.reset').click(function() {
		$('.filters input').each(function() {
			$(this).prop("checked", false);
		});
		buildTable();
	});
}

$(document).ready(main);