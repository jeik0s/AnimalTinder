CREATE TABLE province(
    provinceId INT NOT NULL AUTO_INCREMENT,
    provinceName VARCHAR(50) NOT NULL,
    PRIMARY KEY(provinceId)
);

CREATE TABLE animals (
    animalID int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    age Int(2) NOT NULL,
    sex varchar(1) NOT NULL,
    provinceId int(2) NOT NULL,
    breed varchar(50) NOT NULL,
    description varchar(255) NOT NULL,
    photoUrl varchar(255) NOT NULL,
    taken BOOLEAN NOT NULL,
    PRIMARY KEY (animalID),
    FOREIGN KEY (provinceId) REFERENCES province(provinceId)
);

INSERT INTO province (provinceName) values ('dolnoslaskie');
INSERT INTO province (provinceName) values ('kujawsko-pomorskie');
INSERT INTO province (provinceName) values ('lubelskie');
INSERT INTO province (provinceName) values ('lubuskie');
INSERT INTO province (provinceName) values ('lodzkie');
INSERT INTO province (provinceName) values ('malopolskie');
INSERT INTO province (provinceName) values ('mazowieckie');
INSERT INTO province (provinceName) values ('opolskie');
INSERT INTO province (provinceName) values ('podkarpackie');
INSERT INTO province (provinceName) values ('podlaskie');
INSERT INTO province (provinceName) values ('pomorskie');
INSERT INTO province (provinceName) values ('slaskie');
INSERT INTO province (provinceName) values ('swietokrzyskie');
INSERT INTO province (provinceName) values ('warminsko-mazurskie');
INSERT INTO province (provinceName) values ('wielkopolskie');
INSERT INTO province (provinceName) values ('zachodniopomorskie');

INSERT INTO animals(name,age,sex,breed,provinceId,description,photoUrl,taken) VALUES ('Lars',3,'M','Owczrek',3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque','https://www.essentialliving.co.uk/wp-content/uploads/2021/02/Where-to-Adopt-a-Dog-in-London_Thumbnail.png',false); 
INSERT INTO animals(name,age,sex,breed,provinceId,description,photoUrl,taken) VALUES ('Maciek',5,'K','York',5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque','https://s3.viva.pl/newsy/zmarl-boo-najpopularniejszy-pies-swiata-561503-GALLERY_BIG.jpg',false); 
INSERT INTO animals(name,age,sex,breed,provinceId,description,photoUrl,taken) VALUES ('Kapec',2,'M','Maltanczyk',6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque','https://www.zoocentrum24.pl/blog/wp-content/uploads/2020/08/dog-5449489_1920-1140x760.jpg',false); 
INSERT INTO animals(name,age,sex,breed,provinceId,description,photoUrl,taken) VALUES ('Ziutek',8,'K','Egipcjanin',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque','https://cdn.wamiz.fr/cdn-cgi/image/quality=80,width=400,fit=contain/https://cdn.wamiz.fr/article/images/Wamiz%20PL/koty/rasy%20kotow/sfinks-donski.jpg',false); 
INSERT INTO animals(name,age,sex,breed,provinceId,description,photoUrl,taken) VALUES ('Hass',4,'M','Kon',7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque','https://www.tygodnik-rolniczy.pl/media/articles/Kon_stanal_na_kobiecie_21-latka_zmarla_na_miejscu.jpg',false); 