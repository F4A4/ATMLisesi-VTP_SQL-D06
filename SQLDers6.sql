/* VER� TABANI  DERS� SORGULAR MOD�L� �RNEK �ALI�MALARI */
--VER� TABANI OLU�TURMA
create database Pazarlama
--Veritaban�n� Silme
--drop database Pazarlama

--Kullan�lacak Veritaban� Belirleme
use Pazarlama

--Tablo Olu�turma
create table tblMusteri(
ID int primary key identity(1,1),
AdSoyad nvarchar(50),
DogumTarihi date,
Tel varchar(20),
Adres nvarchar(150),
) 
--Tablo Silme
--drop table tblMusteri

--Tablo Kay�t Ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres)
values('Fatma Altay','1996-04-29','322 678 89 99','Ahmet �zcan Cad.'),
('Aynur Ulu�an','1996-04-29','322 678 89 99','Nal�ac� Cad.'),
('Hafize G�ng�r','1996-04-29','322 678 89 99','Alaadin  Cad.'),
('K�bra D. Kahya','1996-04-29','322 678 89 99','LaleBah�e Cad.'),
('Emine Kamac�','1996-04-29','322 678 89 99','Muhacir Cad.')

------�L��K�SEL TABLO YAPMA-----

create table tblBirim(
ID int primary key identity(1,1),
BirimAd nvarchar (20)

)
insert into tblBirim values('Sat��')
,('Depo')
,('Muhasebe')
,('Bilgi ��lem')
,('�dare')

create table tblPersonel(
ID int primary key identity(1,1),
Ad nvarchar(30),
Soyad nvarchar(20),
Maas money,
Eposta nvarchar(150),
BirimID int references tblBirim(ID) 
)

insert into tblPersonel
values('Adem',' Yerebakan',2200,'aa@hotmail.com',1)
,('Ece',' G�n',1500,'aa@hotmail.com',3)
,('Murat',' Apak',3000,'aa@hotmail.com',5)
,('Deniz',' Gece',2400,'aa@hotmail.com',4)
,('Melek',' Kader',1800,'aa@hotmail.com',2)
,('Emre',' �alan',2100,'aa@hotmail.com',1)


--Se�me Sorgusu----
select * from tblMusteri
select * from tblBirim
select * from tblPersonel
-------------------------------------
--Tek Bir Alan Se�me
select AdSoyad from tblMusteri
--Birden Alan� Se�me
select AdSoyad,DogumTarihi from tblMusteri
--Birden Alan� Yer De�i�tirerek Se�me 
select DogumTarihi,AdSoyad from tblMusteri

--�stenilen Kayd� veya Kay�tlar� Getirme

--Id'si 1 olan kayd� getirir
select * from tblMusteri
where ID=18

--Id'si 3 ve 2 olan kay�tlar� getirir
select * from tblMusteri
where ID=18 or ID=17

--AdSoyad� 'Fatma Altay' olan� getirir
select *from tblMusteri
where AdSoyad='Fatma Altay'

--Id'si 1 olan kayd� siler
delete from tblMusteri
where ID=19

--Kay�t G�ncelleme
update tblMusteri
set AdSoyad='Arif UYSAL'
where ID=16

select * from tblMusteri
update tblMusteri
set AdSoyad='Arif UYSAL',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=16
select * from tblMusteri


--tblPersonel de bulunan maa�� 2000 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas<=2000

--tblPersonel de bulunan maa�� 2000 den y�ksek ve 2500 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas>2000 and Maas<2500

--tblPersonel de bulunan maa�� 2000 den y�ksek ve 2500 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas between 2000 and 2500

select * from tblMusteri
where DogumTarihi>'1900-1-1'

select Ad+''+Soyad as 'Personel Ad� Soyad�',Maas
from tblPersonel 
where Maas between 1500 and 2500

--Ad� e harfi ile biten personelin ad�n� ve soyad�n� 
--ayn� kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e'

--Ad�n i�inde  e harfi bulunan personelin ad�n� ve soyad�n� 
--ayn� kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e%'

--Ad� e harfi ile ba�layan personelin ad�n� ve soyad�n� 
--ayn� kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like 'e%'

--Personel Tablosunda maa�� 3000 e�it olan� �a��r�r.
select * from tblPersonel 
where Maas=3000

--Personel Tablosunda maa�� 3000 e�it olmayanlar� �a��r�r.
select * from tblPersonel 
where Maas!=3000
--Buda maas�n �n�ne gelir ve 3000 e�it olmayanlar� �a��r�r.
select * from tblPersonel
where not Maas=3000

--Maa�� 2000 �le 3000 aras�nda olmayan
select * from tblPersonel
where Maas not between 2000 and 3000

--Maas� 1500 olan personellerin listesini 1650.50 olarak 
--de�i�tiren sql sorgusunu yaz�n�z
select * from tblPersonel
update tblPersonel
set Maas =1650.50
where Maas =1500.00


--Maas� .50 ile biten personellerin listesini veren sql sorgusunu yaz�n�z
select * from tblPersonel
where Maas like '%.50'

--Personel Tablosuna Yeni bir Personel eklemek i�in:
insert into tblPersonel(Ad,Soyad)
values ('Abdurrezzak','Karatoprak')
select * from tblPersonel

--delete from tblPersonel
--where ID between 8 and 19

--PERSONEL TABLOSUNDA NULL YAZAN KAYITLARI GET�R�R
select * from tblPersonel 
where Maas is null

--PERSONEL TABLOSUNDA NULL YAZMAYAN KAYITLARI GET�R�R
select * from tblPersonel 
where Maas is not null

--K���KTEN B�Y��E DO�RU SIRALAMA
select * from tblPersonel
order by Maas

--B�Y�KTEN K����E DO�RU SIRALAMA
select * from tblPersonel
order by Maas desc

--MAASI AYNI OLANLARI ADLARINA G�RE SIRALAMA
select * from tblPersonel
order by Maas desc,Ad asc

-----SQL SORGULARI------------

---UPPER()SOYADI B�Y�K HARFE �EV�R�R
select p.Ad+' '+UPPER(p.Soyad)
from tblPersonel p

--LOWER()SOYADI K���K HARFE �EV�R�R
select p.Ad+' '+LOWER(p.Soyad)
from tblPersonel p

--SUBSTR�NG()SOYADIN 1 VE 3. KARAKTERLER�N� ALIR.
select p.Ad+' '+SUBSTRING(p.Soyad,1,3)
from tblPersonel p

--LEFT()SOYADIN �LK 3 KARAKTER�N� ALIR.
select p.Ad+' '+LEFT(p.Soyad,3)
from tblPersonel p

--RIGHT()SOYADIN SON 3 KARAKTER�N� ALIR.
select p.Ad+' '+RIGHT(p.Soyad,3)
from tblPersonel p

--COUNT()B�ZE KA� KAYIT OLDU�UNU D�ND�R�R.
select COUNT(p.Soyad)
from tblPersonel p

--LEN()B�ZE KARAKTERLER� SAYAR D�ND�R�R
select p.Ad,LEN(p.Soyad) as 'Soyad daki karakter say�s�'
from tblPersonel p

--CHARINDEX()@ ��ARET�NDEN SONRA KA� KARAKTER OLDU�UNU BEL�RLER
select CHARINDEX('@',m.Eposta,1)
from tblPersonel m

----------METOTLARI �� ��E KULLANMA--------

select UPPER(LEFT(p.Ad,2))
from tblPersonel p


select LEFT(p.Eposta,CHARINDEX('@',p.Eposta,1)-1)
from tblPersonel p

---SADECE HOTMA�L.COM U ALIR
select RIGHT(Eposta,(LEN(Eposta)-(CHARINDEX('@',p.Eposta,1))))
from tblPersonel p


--ROUND()V�RG�LL� SAYILARI YUKARI YUVARLAR
--Virg�lden sonra ka� haneye kadar yuvarlamam�z� sa�lar
select ROUND(Maas,0)
from tblPersonel

--SAYISAL ALANDAK� V�G�LL� 5 VE �ST� SAYILARI YUKARI YUVARLAR
select ROUND(12345.56765756,1)
from tblPersonel

--FLOOR()KEND�S�NE VER�LEN SAYILAN V�RG�LDEN SONRASAINI YOK SAYAR
select FLOOR(12345.56765756)
from tblPersonel

--------------------TAR�HSEL FONKS�YONLAR---------------------------

--S�STEM�N TAR�H VE SAAT�N� D�ND�R�R
select GETDATE() as  G�n�nTarihi
select *, CONVERT(VARCHAR, DogumTarihi, 104)  from tblMusteri

--
SELECT CONVERT(VARCHAR, GETDATE(), 0)     --Sonu� : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 1)     --Sonu� : 07/17/09
SELECT CONVERT(VARCHAR, GETDATE(), 2)     --Sonu� : 09.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 3)     --Sonu� : 17/07/09
SELECT CONVERT(VARCHAR, GETDATE(), 4)     --Sonu� : 17.07.09
SELECT CONVERT(VARCHAR, GETDATE(), 5)     --Sonu� : 17-07-09
SELECT CONVERT(VARCHAR, GETDATE(), 6)     --Sonu� : 17 Jul 09
SELECT CONVERT(VARCHAR, GETDATE(), 7)     --Sonu� : Jul 17, 09
SELECT CONVERT(VARCHAR, GETDATE(), 8)     --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 9)     --Sonu� : Jul 17 2009  4:43:05:573PM
SELECT CONVERT(VARCHAR, GETDATE(), 10)    --Sonu� : 07-17-09
SELECT CONVERT(VARCHAR, GETDATE(), 11)    --Sonu� : 09/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 12)    --Sonu� : 090717
SELECT CONVERT(VARCHAR, GETDATE(), 13)    --Sonu� : 17 Jul 2009 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 14)    --Sonu� : 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 20)    --Sonu� : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 21)    --Sonu� : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 22)    --Sonu� : 07/17/09  4:43:05 PM
SELECT CONVERT(VARCHAR, GETDATE(), 23)    --Sonu� : 2009-07-17
SELECT CONVERT(VARCHAR, GETDATE(), 24)    --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 25)    --Sonu� : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 100)   --Sonu� : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 101)   --Sonu� : 07/17/2009
SELECT CONVERT(VARCHAR, GETDATE(), 102)   --Sonu� : 2009.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 103)   --Sonu� : 17/07/2009
SELECT CONVERT(VARCHAR, GETDATE(), 104)   --Sonu� : 17.07.2009
SELECT CONVERT(VARCHAR, GETDATE(), 105)   --Sonu� : 17-07-2009
SELECT CONVERT(VARCHAR, GETDATE(), 106)   --Sonu� : 17 Jul 2009
SELECT CONVERT(VARCHAR, GETDATE(), 107)   --Sonu� : Jul 17, 2009
SELECT CONVERT(VARCHAR, GETDATE(), 108)   --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 109)   --Sonu� : Jul 17 2009  4:43:05:607PM
SELECT CONVERT(VARCHAR, GETDATE(), 110)   --Sonu� : 07-17-2009
SELECT CONVERT(VARCHAR, GETDATE(), 111)   --Sonu� : 2009/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 112)   --Sonu� : 20090717
SELECT CONVERT(VARCHAR, GETDATE(), 113)   --Sonu� : 17 Jul 2009 16:43:05:607
SELECT CONVERT(VARCHAR, GETDATE(), 114)   --Sonu� : 16:43:05:620
SELECT CONVERT(VARCHAR, GETDATE(), 120)   --Sonu� : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 121)   --Sonu� : 2009-07-17 16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 126)   --Sonu� : 2009-07-17T16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 127)   --Sonu� : 2009-07-17T16:43:05.620