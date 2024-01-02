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