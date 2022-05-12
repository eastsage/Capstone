drop view if exists checkedview;
create or replace view checkedview as
select p_name ch_name, p_cpu ch_cpu, p_vga ch_vga, p_ram ch_ram, p_ssd ch_ssd
from Program
where '3ds max' = p_name or 'ableton live' = p_name;

select * from checkedview;

desc checkedview;


