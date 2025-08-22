# 📊 SQL Satış Performans Analizi

Bu proje, **Microsoft SQL Server** üzerinde hazırlanmış satış analizi sorgularını içerir.  
Amaç, satış ekibi ve yöneticiler için **performans raporları** ve **trend analizleri** sunmaktır.  

---

## 📂 İçerik

- **satis_analizi.sql** → Satis Analizi
- **departmana_gore_satis.sql** → Departmanlara Göre Analiz

### 🔎 İçerikteki Analizler

1. **Departman Ortalamasının Üzerinde Satış Yapan Çalışanlar**  
2. **Her Çalışanın En Yüksek ve En Düşük Satışı**  
3. **Son 3 Günlük Hareketli Ortalama Satış**  
4. **En Çok Satış Yapan İlk 3 Çalışan**  
5. **Günlük Satış ile Kümülatif Satış Karşılaştırması**  
6. **Çalışan Bazlı Satış Artış / Azalışı**  

---

## 🛠 Gereksinimler

- Microsoft SQL Server (2019 veya üstü tavsiye edilir)
- `sales` adında tablo ve şu alanlar:
  ```sql
  CREATE TABLE sales (
      employee NVARCHAR(100),
      department NVARCHAR(100),
      amount DECIMAL(10,2),
      saledate DATE
  );

---

## 🚀 Kullanım

1. **satis_analizi.sql veya **departmana_gore_satis.sql** dosyasını açın.**

2. **SQL Server Management Studio (SSMS) veya Azure Data Studio üzerinden çalıştırın.**

3. **Sonuçlar farklı departmanlar için otomatik hesaplanacaktır.**

---

## 📈 Örnek Çıktılar

1. **Departman ortalamasını aşan çalışanlar**

2. **İlk 3 satış yapan çalışan listesi**

3. **Günlük satış + kümülatif satış tablosu**

---

## 🏷 Lisans

**Bu proje MIT lisansı ile paylaşılmıştır.Daha fazla bilgi için LICENSE dosyasına bakabilirsiniz.**
