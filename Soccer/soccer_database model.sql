create database soccer

use soccer 

create table playing_position(
position_id int not null primary key,
position_decs varchar(15)
)

create table soccer_counry(
country_id int not null primary Key,
country_abbr varchar(4),
country_Name varchar(20)
)

create table soccer_team(
team_id int references soccer_counry(country_id),
team_group char(1),
match_played numeric,
won numeric ,
lost numeric,
goal_for numeric,
goal_against numeric,
goal_diff numeric,
points numeric,
group_position numeric
 )

create table player_must(
player_id numeric primary key,
team_id int references soccer_counry(country_id),
jersey_no numeric,
player_name varchar(40),
posi_to_play chAR(2),
DaTe_OF_birth date,
age numeric,
playing_club varchar(40)
) 


create table soccer_city(
city_id numeric not null primary key,
city varchar(20),
counrty_id int references soccer_counry(country_id),
)

create table soccer_venue(
venue_id numeric not null primary key,
venue_name varchar(20),
city_id numeric references soccer_city(city_id),
aud_capacity numeric
)

create table refree_must(
refree_id numeric not null primary key,
refree_Name varchar(20),
country_id int references soccer_counry(country_id) 
)

create table coach_must(
coach_id numeric not null primary key,
coach_name varchar(20),
)

create table team_coaches(
team_id int references soccer_counry(country_id),
coach_id numeric references coach_must(coach_id)
)

create table match_must(
match_no numeric not null primary key,
play_stage char(1),
paly_date date ,
result char(5),
decided_by char(1),
goal_score char(5),
venue_id numeric references soccer_venue(venue_id),
refree_id numeric references refree_must(refree_id),
audeances numeric,
pir_of_match numeric references player_must(player_id),
stop1_sec numeric,
stop2_sec numeric
)

create table asst_referee_must(
asst_ref_id numeric not null primary key,
ass_ref_name varchar(20),
country_id int references soccer_counry(country_id)
)

create table match_details(
match_no numeric references match_must(match_no),
play_stage varchar(1),
team_id int references soccer_counry(country_id),
win_loos varchar(1),
decided_By varchar(1),
goal_score numeric,
penality_score numeric,
ass_ref numeric references asst_referee_must(asst_ref_id),
palyer_gk numeric references player_must(player_id)
)

create table player_in_out(
match_no numeric references match_must(match_no),
team_id int references soccer_counry(country_id),
player_id numeric references player_must(player_id),
in_out char (1),
time_in_out char,
play_schedule char(2),
play_half numeric,
)

create table goal_detail(
goal_id numeric not null primary key,
match_no numeric references match_must(match_no),
player_id numeric references player_must(player_id),
team_id int references soccer_counry(country_id),
goal_time numeric,
goal_type char(1),
play_stage char(1),
goal_schedule char(2),
goal_half numeric
)

create table player_booked(
match_no numeric references match_must(match_no),
player_id numeric references player_must(player_id),
team_id int references soccer_counry(country_id),
bookind_time varchar(20),
send_off char(1),
play_schedule char(2),
play_half numeric
)

create table penalty_shootout(
kick_id numeric not null primary key,
match_no numeric references match_must(match_no),
player_id numeric references player_must(player_id),
team_id int references soccer_counry(country_id),
score_goal varchar(1),
kick_no numeric
)

create table match_captain(
match_no numeric references match_must(match_no),
team_id int references soccer_counry(country_id),
player_captain numeric references player_must(player_id), 
)

create table penalty_gk(
match_no numeric references match_must(match_no),
team_id int references soccer_counry(country_id),
player_gk numeric references player_must(player_id),
)
