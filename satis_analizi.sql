-- 1️) Departman Ortalamasının Üzerinde Satış Yapan Çalışanlar
--👉 Satış ekibi, hangi çalışanın performansı ortalamanın üstünde merak ediyor.

SELECT 
    employee,
    department,
    amount,
    AVG(amount) OVER(PARTITION BY department) AS dept_avg,
    CASE 
        WHEN amount > AVG(amount) OVER(PARTITION BY department) THEN 'ORTALAMA ÜSTÜNDE'
        ELSE 'ORTALAMANIN ALTINDA'
    END AS durum
FROM sales
ORDER BY amount DESC

-- 2️) Her Çalışanın En Yüksek ve En Düşük Satışı
-- 👉 İnsan kaynakları veya satış müdürü, çalışanın potansiyelini görmek ister.

SELECT 
    employee,
    amount,
    MAX(amount) OVER(PARTITION BY employee) AS en_yuksek_satis,
    MIN(amount) OVER(PARTITION BY employee) AS en_dusuk_satis
FROM sales;


-- 3️ Son 3 Günlük Hareketli Ortalama Satış
-- 👉 Finans ekibi, günlük trendleri görmek için hareketli ortalama ister.

SELECT 
    saledate,
    amount,
    AVG(amount) OVER(ORDER BY saledate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS hareketli_ortalama
FROM sales;

-- 4️) En Çok Satış Yapan İlk 3 Çalışan
-- 👉 Satış direktörü, bonus dağıtmak için ilk 3 kişiyi görmek ister.

SELECT *
FROM (
    SELECT 
        employee,
        SUM(amount) AS toplamsatis,
        RANK() OVER(ORDER BY SUM(amount) DESC) AS siralama
    FROM sales
    GROUP BY employee
) t
WHERE siralama <= 3;

-- 5️) Günlük Satış ile Kümülatif Satış Karşılaştırması
-- 👉 Finans departmanı, günlük ilerleme + toplam ilerleme görmek ister.

SELECT 
    saledate,
    SUM(amount) AS gunluk_satis,
    SUM(SUM(amount)) OVER(ORDER BY saledate) AS kümülatif_satis
FROM sales
GROUP BY saledate
ORDER BY saledate;

-- 6️) Çalışan Bazlı Satış Artış / Azalışı
-- 👉 Satış müdürü, her çalışanın önceki satışına göre artış/azalışı görmek ister.

SELECT 
    employee,
    saledate,
    amount,
    LAG(amount) OVER(PARTITION BY employee ORDER BY saledate) AS onceki_satis,
    amount - LAG(amount) OVER(PARTITION BY employee ORDER BY saledate) AS degisim
FROM sales;

