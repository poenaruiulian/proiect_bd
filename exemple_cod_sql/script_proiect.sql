-- Aceste comenzi le folosim la inceput pentru a sterge toate informatiile
-- astfel incat sa putem creea de la zero proiectul

drop table PetOwner
drop table Pet
drop table MedicalRecords
drop table PresicribedMedications
drop table Diagnosis

-- Comenzile folosite pentru crearea tabelelor

create table PetOwner(
    cnp int not null primary key, 
    first_name char(50) not null, 
    last_name char(50) not null, 
    address char(50),
    phone char(12) not null,
    email char(25)
)

create table Pet(
    id int not null primary key, 
    cnp_owner int not null, 
    name char(50) not null, 
    species char(50) not null, 
    breed char(50) not null, 
    age int not null, 
    gender char(1) not null,

    foreign key (cnp_owner) references PetOwner(cnp)
)

create table MedicalRecords(
    id int not null primary key, 
    cnp_owner int not null, 
    id_pet int not null, 

    foreign key (cnp_owner) references PetOwner(cnp),
    foreign key (id_pet) references Pet(id)
)

create table PrescribedMedications(
    id_medical_record int not null, 
    medication_name char(50) not null,
    dosage_information char(200) not null,

    primary key(id_medical_record, medication_name),
    foreign key(id_medical_record) references MedicalRecord(id)
)

create table Diagnosis(
    id_medical_record int not null, 
    medical_condition char(50) not null, 
    observation char(200), 

    primary key(id_medical_record, medical_condition),
    foreign key(id_medical_record) references MedicalRecord(id)
)

-- Pentru a vizualiza structura unei tabele in SQLite

pragma table_info(PetOwner)

-- Pentru alterarea unei tabele

alter table Pet
add column color char(20)

alter table Pet
rename column color to color_of_pet

alter table Pet 
drop column color_of_pet

-- Adugam date in tabela noastra

INSERT INTO PetOwner (cnp, first_name, last_name, address, phone, email)
VALUES
    (1, 'John', 'Doe', '123 Main St', '1234567890', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', NULL, '9876543210', NULL),
    (3, 'Bob', 'Johnson', '456 Oak St', '5551234567', 'bob.j@example.com'),
    (4, 'Alice', 'Williams', NULL, '7778889999', 'alice.w@example.com'),
    (5, 'Charlie', 'Brown', '789 Elm St', '4445556666', NULL),
    (6, 'Eva', 'Miller', '101 Pine St', '1112223333', 'eva.m@example.com'),
    (7, 'David', 'Lee', NULL, '9990001111', NULL),
    (8, 'Grace', 'Clark', '202 Cedar St', '3334445555', 'grace.c@example.com'),
    (9, 'Sam', 'Taylor', '303 Maple St', '6667778888', NULL),
    (10, 'Sophia', 'Moore', '404 Birch St', '2223334444', 'sophia.m@example.com');

INSERT INTO Pet (id, cnp_owner, name, species, breed, age, gender)
VALUES
    (1, 123456789, 'Buddy', 'Dog', 'Golden Retriever', 3, 'M'),
    (2, 234567890, 'Whiskers', 'Cat', 'Siamese', 2, 'F'),
    (3, 345678901, 'Max', 'Dog', 'German Shepherd', 4, 'M'),
    (4, 456789012, 'Luna', 'Cat', 'Persian', 1, 'F'),
    (5, 567890123, 'Rocky', 'Dog', 'Boxer', 2, 'M'),
    (6, 678901234, 'Mittens', 'Cat', 'Tabby', 3, 'F'),
    (7, 789012345, 'Charlie', 'Dog', 'Beagle', 5, 'M'),
    (8, 890123456, 'Oliver', 'Cat', 'Maine Coon', 2, 'M'),
    (9, 901234567, 'Bella', 'Dog', 'Labrador Retriever', 1, 'F'),
    (10, 123045678, 'Chloe', 'Cat', 'Ragdoll', 4, 'F'),
    (11, 123456789, 'Cooper', 'Dog', 'Poodle', 2, 'M'),
    (12, 123456789, 'Lucy', 'Dog', 'Labrador Retriever', 1, 'F'),
    (13, 345678901, 'Whiskey', 'Dog', 'Dachshund', 3, 'M'),
    (14, 345678901, 'Misty', 'Cat', 'Calico', 2, 'F'),
    (15, 567890123, 'Baxter', 'Dog', 'Bulldog', 4, 'M'),
    (16, 567890123, 'Smokey', 'Cat', 'Russian Blue', 2, 'M'),
    (17, 789012345, 'Milo', 'Dog', 'Shih Tzu', 3, 'M'),
    (18, 789012345, 'Lily', 'Cat', 'Sphynx', 1, 'F'),
    (19, 901234567, 'Zeus', 'Dog', 'Rottweiler', 2, 'M'),
    (20, 901234567, 'Lola', 'Cat', 'Persian', 3, 'F');

INSERT INTO MedicalRecords (id, cnp_owner, id_pet)
VALUES
    (1, 123456789, 1),
    (2, 234567890, 2),
    (3, 345678901, 3),
    (4, 456789012, 4),
    (5, 567890123, 5),
    (6, 678901234, 6),
    (7, 789012345, 7),
    (8, 890123456, 8),
    (9, 901234567, 9),
    (10, 123045678, 10),
    (11, 123456789, 11),
    (12, 123456789, 12),
    (13, 345678901, 13),
    (14, 345678901, 14),
    (15, 567890123, 15),
    (16, 567890123, 16),
    (17, 789012345, 17),
    (18, 789012345, 18),
    (19, 901234567, 19),
    (20, 901234567, 20);

INSERT INTO PrescribedMedications (id_medical_record, medication_name, dosage_information)
VALUES
    (1, 'PainKiller', 'Take twice a day with food.'),
    (2, 'Antihistamine', 'Take once daily.'),
    (3, 'Antibiotic', 'Take as prescribed by the vet.'),
    (4, 'Vitamin Supplement', 'Administer with meals.'),
    (5, 'Heartworm Preventative', 'Monthly dosage.'),
    (6, 'Flea and Tick Medication', 'Apply once a month.'),
    (7, 'Anti-inflammatory', 'Take with meals.'),
    (8, 'Dewormer', 'Administer as directed by the vet.'),
    (9, 'Joint Supplement', 'Administer daily.'),
    (10, 'Calming Medication', 'As needed.'),
    (11, 'PainKiller', 'Take twice a day with food.'),
    (12, 'Vitamin Supplement', 'Administer with meals.'),
    (13, 'Antibiotic', 'Take as prescribed by the vet.'),
    (14, 'Anti-inflammatory', 'Take with meals.'),
    (15, 'Heartworm Preventative', 'Monthly dosage.'),
    (16, 'Flea and Tick Medication', 'Apply once a month.'),
    (17, 'Dewormer', 'Administer as directed by the vet.'),
    (18, 'Joint Supplement', 'Administer daily.'),
    (19, 'Calming Medication', 'As needed.'),
    (20, 'Antihistamine', 'Take once daily.');

INSERT INTO Diagnosis (id_medical_record, medical_condition, observation)
VALUES
    (1, 'Ear Infection', 'Redness and swelling observed.'),
    (2, 'Allergies', 'Excessive itching and sneezing.'),
    (3, 'Respiratory Infection', 'Coughing and nasal discharge.'),
    (4, 'Dental Issues', 'Bad breath and difficulty eating.'),
    (5, 'Parasite Infestation', 'Visible signs of fleas and ticks.'),
    (6, 'Skin Infection', 'Rashes and hair loss.'),
    (7, 'Arthritis', 'Stiffness and difficulty in movement.'),
    (8, 'Intestinal Parasites', 'Vomiting and diarrhea.'),
    (9, 'Joint Pain', 'Limping and reluctance to walk.'),
    (10, 'Anxiety', 'Excessive barking and nervous behavior.'),
    (11, 'Ear Infection', 'Redness and swelling observed.'),
    (12, 'Dental Issues', 'Bad breath and difficulty eating.'),
    (13, 'Respiratory Infection', 'Coughing and nasal discharge.'),
    (14, 'Arthritis', 'Stiffness and difficulty in movement.'),
    (15, 'Parasite Infestation', 'Visible signs of fleas and ticks.'),
    (16, 'Skin Infection', 'Rashes and hair loss.'),
    (17, 'Intestinal Parasites', 'Vomiting and diarrhea.'),
    (18, 'Joint Pain', 'Limping and reluctance to walk.'),
    (19, 'Anxiety', 'Excessive barking and nervous behavior.'),
    (20, 'Allergies', 'Excessive itching and sneezing.');

-- creare de obiecte ale bazei de date

create view DogsFromCabinet as 
select * from Pet
where species like 'Dog'

select * from DogsFromCabinet

create view OakStreet as 
select * from PetOwner
where address like '%Oak%'

select * from OakStreet

-- Prelucrarea datelor din tabel

update Pet 
set breed = "York Shire"
where
    breed in ('Poodle', 'Beagle') and
    species is not 'Cat'

alter table MedicalRecords
add column date date

update MedicalRecords
set date = DATE('now')
where date is null 

update MedicalRecords
set date = '2023-12-15'
where date is date('now') and id%2==0

delete from PrescribedMedications
where medication_name like '_a%'

-- Selectia datelor folosind interogari complexe

create view OwnerWithOnePet as
select po1.* from PetOwner po1
join (
    select p.cnp_owner, count(*) as pet_count from Pet p  
    group by p.cnp_owner
    ) pet_counts
on pet_counts.cnp_owner = po1.cnp
where pet_counts.pet_count = 1

select * from MedicalRecords
where 
    cnp_owner in (select cnp from OakStreet) and
    id_pet in (SELECT id from DogsFromCabinet)

create view MRFromDogsAroundOak as
select * from MedicalRecords
where 
    cnp_owner in (select cnp from OakStreet) and
    id_pet in (SELECT id from DogsFromCabinet)
    
select * from Diagnosis
where id_medical_record in (select id from MRFromDogsAroundOak)

create view CatWithLotsOfVowels as
select * from Pet 
where 
    species like 'Cat' and 
    length(name) - length(replace(lower(name),'a','')) +
    length(name) - length(replace(lower(name),'e','')) +
    length(name) - length(replace(lower(name),'i','')) +
    length(name) - length(replace(lower(name),'o','')) +
    length(name) - length(replace(lower(name),'u','')) > 1
    
select * from PrescribedMedications
where dosage_infomation in (
    select id from MedicalRecords 
    where id_pet in (select id from CatWithLotsOfVowels)
    )

create view Infections as
select * from Diagnosis 
where instr(lower(medical_condition),'infection')>0

select name, age from Pet where id
in (
    select id_pet from MedicalRecords 
    where id in 
        (
            select id_medical_record from Infections
        )
    )

select count(*), age from Pet p join MedicalRecords
on p.id=id_pet
where date='2023-12-15'
group by age


select * from Pet 
where
    species = 'Cat' and 
    age >= 3 and  
    id in (
        select id_pet from MedicalRecords
        join (
            select observation, id_medical_record 
            from Diagnosis 
            where medical_condition like '%itis'
            ) diagnosis
        on id=diagnosis.id_medical_record
    )
