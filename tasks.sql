USE PharmDB;

/* ============================================= task #7 =============================================
Вывести список всех касс со следующем столбцами: [Аптека], [Адрес аптеки с городом], [Номер кассы], [Описание кассы] 
   ============================================= task #7 ============================================= */
SELECT 
    D.name AS 'Аптека',
    CONCAT(C.name, ', ', D.address) AS 'Адрес аптеки с городом',
    CD.number AS 'Номер кассы', 
    CD.description AS 'Описание кассы'
FROM 
    cashdesk AS CD
INNER JOIN 
    drugstores AS D ON D.id = CD.drugstore_id 
INNER JOIN 
    cities AS C ON C.id = D.city_id;

/* ============================================= task #8 =============================================
Вывести список всех аптек, в которых более 3х касс, со столбцами [Аптека], [Город], [Адрес аптеки] 
   ============================================= task #8 ============================================= */
SELECT
    D.name AS 'Аптека',
	C.name AS 'Город',
	D.address AS 'Адрес аптеки'
FROM drugstores AS D
INNER JOIN 
	cities AS C ON C.id = D.city_id 
INNER JOIN 
	cashdesk AS CD ON D.id = CD.drugstore_id 
GROUP BY 
	C.name, D.name, D.address
HAVING 
    COUNT(CD.id) > 3
ORDER BY 
    D.name;

/* ============================================= task #9 =============================================
Вывести список всех аптек, расположенных по улице Карла Маркса, со столбцами [Аптека], [Город], [Адрес аптеки], [Кол-во касс]
   ============================================= task #9 ============================================= */
SELECT
    D.name AS 'Аптека',
	C.name AS 'Город',
	D.address AS 'Адрес аптеки',
    COUNT(CD.id) AS 'Кол-во касс'
FROM drugstores AS D
INNER JOIN 
	cities AS C ON C.id = D.city_id 
INNER JOIN 
	cashdesk AS CD ON D.id = CD.drugstore_id 
WHERE 
    D.address LIKE '%Карла Маркса%'
GROUP BY 
	C.name, D.name, D.address
ORDER BY 
    D.name;
