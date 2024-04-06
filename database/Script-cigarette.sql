USE turretadb;

-- Создание таблицы "Табак"
CREATE TABLE tobacco (
id INT AUTO_INCREMENT PRIMARY KEY,
sort VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
company VARCHAR(50) NOT NULL
);

-- Создание таблицы "Сигареты"
CREATE TABLE cigarettes (
id INT AUTO_INCREMENT PRIMARY KEY,
name_cigarettes VARCHAR(50) NOT NULL,
brand VARCHAR(50) NOT NULL,
paper VARCHAR(50) NOT NULL,
no_of_buttons INT(50) NOT NULL,
quantity_per_pack INT(50) NOT NULL,
cost DECIMAL NOT NULL,
filter_cigarettes bool,
id_cigarettes INT,
FOREIGN KEY (id_cigarettes) REFERENCES tobacco(id)
);

-- Создание триггера для проверки валидации стоимости пачки сигарет в таблице "Сигареты"
DELIMITER
CREATE TRIGGER check_condition
BEFORE INSERT ON cigarettes
FOR EACH ROW
BEGIN
    IF NEW.cost < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Value must be positive';
    END IF;
END;
DELIMITER ;

-- Создание таблицы "Сотрудники"
CREATE TABLE employee (
id INT AUTO_INCREMENT PRIMARY KEY,
name_employee VARCHAR(50) NOT NULL,
last_name_employee VARCHAR(50) NOT NULL,
native_land_employee VARCHAR(50) NULL,
position_employee VARCHAR(50) NOT NULL,
labor_book INT(50) NOT NULL,
salary INT(50) NOT NULL
);

-- Создание таблицы "Потребители"
CREATE TABLE Store (
id INT AUTO_INCREMENT PRIMARY KEY,
name_store VARCHAR(50) NOT NULL,
address VARCHAR(50) NULL,
OPF VARCHAR(50) NOT NULL,
INN INT(50) NOT NULL
);

-- Создание таблицы "Заказы"
CREATE TABLE Orders (
id INT NOT NULL,
date_orders date,
no_of_packs INT(50) NOT NULL,
id_store INT,
FOREIGN KEY (id_store) REFERENCES Store(id),
id_cigarettes INT,
FOREIGN KEY (id_cigarettes) REFERENCES cigarettes(id),
id_employee INT,
FOREIGN KEY (id_employee) REFERENCES employee(id)
);








