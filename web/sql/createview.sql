drop view if exists checkedview;
create or replace view checkedview as
select p_name ch_name, p_cpu ch_cpu, p_vga ch_vga, p_ram ch_ram, p_ssd ch_ssd
from Program
where '3ds max' = p_name or 'ableton live' = p_name;

create or replace view checkedview as
select p_name ch_name, p_cpu ch_cpu, p_vga ch_vga, p_ram ch_ram, p_ssd ch_ssd
from Program
where p_name in ('3ds max', 'android studio', 'blender', 'catia');

create or replace view checkedview as
select p_name,  p_cpu,  p_vga,  p_ram,  p_ssd
from Program
where p_name in ('3ds max', 'android studio', 'blender', 'catia');

select * from checkedview;

desc checkedview;

select distinct ch_cpu as CPU
from checkedview,
     CPU
group by cpu.c_name
having max(c_score);

select distinct ch_vga as VGA
from checkedview,
     VGA
group by VGA.v_name
having max(v_score);

select concat(max(ch_ssd), 'GB') as storage
from checkedview;

select concat(max(ch_ram), 'GB') as RAM
from checkedview;

select distinct v_power as Power
from VGA,
     checkedview
where v_name = (
    select distinct ch_vga as VGA
    from checkedview,
         VGA
    group by VGA.v_name
    having max(v_score)
);







