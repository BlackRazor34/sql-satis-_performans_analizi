-- 📌 Aggregate Functions: Departmana göre toplam satış

SELECT 
	department,
	SUM(amount) AS toplam_satis
FROM sales
GROUP BY department;

-- 📌 Window Basics: Her satışın yanında departman ortalaması
SELECT 
    employee,
    department,
    amount,
    AVG(amount) OVER(PARTITION BY department) AS dept_avg
FROM sales;

-- 📌 Window Aggregate Functions: Tarih bazlı kümülatif toplam
SELECT 
    saledate,
    amount,
    SUM(amount) OVER(ORDER BY saledate) AS running_total
FROM sales;

-- 📌 Window Ranking Functions: En yüksek satış sıralaması
SELECT 
    employee,
    amount,
    RANK() OVER(ORDER BY amount DESC) AS satis_sirasi
FROM sales;

-- 📌 Window Value Functions: Bugün ve dün arasındaki fark, + - ciro farkları
SELECT 
    saledate,
    amount,
    LAG(amount) OVER(ORDER BY saledate) AS onceki_satis,
    amount - LAG(amount) OVER(ORDER BY saledate) AS fark
FROM sales;
