#Область ПрограммныйИнтерфейс

Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьГруппаСкидкаКнопка(Форма);
		ДобавитьПолеСогласованнаяСкидкаВГруппаСкидкаКнопка(Форма);
		ДобавитьКнопкаПересчитатьТаблицуВГруппаСкидкаКнопка(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(форма);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"),Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.МояД_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"),,Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.МояД_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьГруппаСкидкаКнопка(Форма)
	
	Группа = Форма.Элементы.Добавить("ГруппаСкидкаКнопка", Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.ОтображатьЗаголовок = Ложь;
	
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяСкидкаВГруппаСкидкаКнопка(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"),Форма.Элементы.ГруппаСкидкаКнопка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.МояД_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении","МояД_СогласованнаяСкидкаПриИзменении");
	
	//КомандаПриИзмененииСогласованнаяСкидка = Форма.Команды.Добавить("Мод10_СогласованнаяСкидкаПриИзменении");
	//КомандаПриИзмененииСогласованнаяСкидка.Заголовок = "Мод10_СогласованнаяСкидкаПриИзменении";
	//КомандаПриИзмененииСогласованнаяСкидка.Действие = "Мод10_СогласованнаяСкидкаПриИзменении";
	
КонецПроцедуры

Процедура ДобавитьКнопкаПересчитатьТаблицуВГруппаСкидкаКнопка(Форма)
	
	//Создание команды для кнопки Пересчитать таблицу
	НоваяКоманда = Форма.Команды.Добавить("МояД_ПересчитатьТаблицу");
	НоваяКоманда.Заголовок = "ПересчитатьТаблицу";
	НоваяКоманда.Действие = "МояД_ПересчитатьТаблицу";
	
	//Создание кнопки Пересчитать таблицу
	Кнопка = Форма.Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"),Форма.Элементы.ГруппаСкидкаКнопка);
	Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	Кнопка.ИмяКоманды = "МояД_ПересчитатьТаблицу";
	Кнопка.Заголовок = "Пересчитать таблицу";
	
КонецПроцедуры

#КонецОбласти