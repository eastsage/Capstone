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

select ch_cpu, c_board, max(c_score)
from checkedview
         inner join CPU on ch_cpu = c_name;


select distinct ch_vga as VGA
from checkedview,
     VGA
group by VGA.v_name
having max(v_score);

select max(ch_ssd) as storage
from checkedview;

select max(ch_ram) as RAM
from checkedview;

select distinct v_power
from VGA,
     checkedview
where ch_vga = (
    select distinct ch_vga
    from checkedview,
         VGA
    group by v_name
    having max(v_score)
);

select ch_vga, v_power, max(v_score)
from checkedview
         inner join VGA on ch_vga = v_name;






