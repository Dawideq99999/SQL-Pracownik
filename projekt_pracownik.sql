use kierownik_projekt;

create table pracownik(
	id_pracownika int  identity(1,1) ,
	imie nvarchar(30) not null,
	nazwisko nvarchar(30) not null,
	pesel char(11) not null unique, 

	constraint pk_pracownik primary key(id_pracownika),
	);


create table projekt (
	id_projekt int identity(1,1) ,
	id_kierownika int  not null,
	temat nvarchar(30) not null,
	budzet money not null,
	stan_realizacji tinyint default 0 not null, 
	
	constraint projekt_pk primary key (id_projekt),
	constraint id_kierownika_fk foreign key (id_kierownika) references pracownik(id_pracownika) on delete cascade,

	constraint  stan_reazliacji_ch check (stan_realizacji>=0 and stan_realizacji<=100)



);

create table projekt_pracownik(

	id_projekt int ,
	id_pracownika int ,

	constraint projekt_pracownik_pk primary key (id_projekt,id_pracownika),

	
	constraint id_pracownika_id_projekt_fk foreign key (id_pracownika) references pracownik(id_pracownika)  ,
	constraint id_projekt_id_pracownika_fk foreign key (id_projekt) references projekt(id_projekt) ,
);

create table specjalizacja(
	id_pracownika int not null,
	specjalizacja varchar(30),
	
	constraint specjalizacja_pk primary key (id_pracownika),
	constraint id_pracnownika_specjalizacja_fk foreign key (id_pracownika) references pracownik(id_pracownika)
);

create table data_rozpoczecia_data_zakonczenia(
	id_projekt int not null,
	realizacja_od date not null,
	realizacja_do date,
 
	constraint id_projektu_fk foreign key (id_projekt) references projekt(id_projekt),
	constraint realizacja_od_ch check (realizacja_od<=getdate()),
	constraint realizacja_do_ch check (realizacja_do<=getdate() and realizacja_od<=realizacja_do ),




);