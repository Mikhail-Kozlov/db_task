USE PharmDB;

/* ==================== task #7 ====================
Вывести список всех касс со следующем столбцами: [Аптека], [Адрес аптеки с городом], [Номер кассы], [Описание кассы] 
   ==================== task #7 ==================== */

SELECT 
    D.name AS 'Аптека',
    CONCAT(C.name, ', ', D.address) AS 'Адрес аптеки с городом',
    CD.number AS 'Номер кассы', 
    CD.description AS 'Описание кассы'
FROM 
    cashdesk as CD
INNER JOIN 
    drugstores AS D ON D.id = CD.drugstore_id 
INNER JOIN 
    cities AS C ON C.id = D.city_id;