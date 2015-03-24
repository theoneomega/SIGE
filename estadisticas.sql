select count(*) as eventos_cos from events where created_at between '01/12/2014' and '01/01/2015' and area_id != 10000;
select count(*) as oficios_cos from offices where created_at between '01/12/2014' and '01/01/2015' and area_id != 10000;
select count(*) as colaboraciones_cos from colaborations where created_at between '01/12/2014' and '01/01/2015' and area_id != 10000;
select count(*) as justicias_cos from justice_nets where created_at between '01/12/2014' and '01/01/2015' and area_id != 10000;

select count(*) as eventos_norte from events where created_at between '01/12/2014' and '01/01/2015' and area_id = 10000;
select count(*) as oficios_norte from offices where created_at between '01/12/2014' and '01/01/2015' and area_id = 10000;
select count(*) as colaboraciones_norte from colaborations where created_at between '01/12/2014' and '01/01/2015' and area_id = 10000;
select count(*) as justicias_norte from justice_nets where created_at between '01/12/2014' and '01/01/2015' and area_id = 10000;	